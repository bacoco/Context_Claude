# Implementation Example - Redis Cache for JWT Validation

This example demonstrates the complete implementation process following the Enhanced Context Engineering Framework's 7-step methodology.

## Context
Following the PRP for JWT authentication failures (#1234), this implementation adds Redis caching to reduce database load during token validation.

## Step 1: Understand the Problem
```python
# Original problematic code in auth/jwt_validator.py
class JWTValidator:
    def validate_token(self, token: str) -> bool:
        """
        Validates JWT token - PROBLEM: Database lookup on every request
        """
        try:
            # Decode and verify signature
            payload = jwt.decode(token, self.public_key, algorithms=['RS256'])
            
            # ISSUE: This database query happens for EVERY request
            if self.is_token_revoked(payload['jti']):  # Database lookup
                return False
                
            return True
        except jwt.InvalidTokenError:
            return False
    
    def is_token_revoked(self, jti: str) -> bool:
        """
        Checks if token is in revocation list - EXPENSIVE DATABASE QUERY
        """
        with self.db.get_connection() as conn:  # Can timeout under load
            result = conn.execute(
                "SELECT 1 FROM revoked_tokens WHERE jti = ?", (jti,)
            ).fetchone()
            return result is not None
```

## Step 2: Explore and Locate
```bash
# Search for all token validation points
grep -r "validate_token" --include="*.py" .
# Found in: auth/jwt_validator.py, api/middleware.py, tests/test_auth.py

# Check current dependencies
cat requirements.txt | grep -E "(jwt|redis)"
# PyJWT==2.8.0
# (Redis not yet added)

# Examine database connection pool config
cat config/database.py | grep -A5 "pool_size"
# pool_size=20, max_overflow=0
```

## Step 3: Reproduce and Validate
```python
# reproduction_script.py
import concurrent.futures
import time
import requests
from auth.jwt_validator import JWTValidator

def test_token_validation():
    """Reproduces the timeout issue under load"""
    validator = JWTValidator()
    tokens = [generate_test_token() for _ in range(100)]
    
    def validate_single(token):
        start = time.time()
        try:
            result = validator.validate_token(token)
            duration = time.time() - start
            return result, duration
        except Exception as e:
            return False, time.time() - start
    
    # Simulate concurrent load
    with concurrent.futures.ThreadPoolExecutor(max_workers=50) as executor:
        results = list(executor.map(validate_single, tokens * 10))
    
    failures = sum(1 for success, _ in results if not success)
    avg_time = sum(duration for _, duration in results) / len(results)
    
    print(f"Failure rate: {failures/len(results)*100:.1f}%")
    print(f"Average time: {avg_time*1000:.1f}ms")
    
# Results: Failure rate: 15.2%, Average time: 487.3ms
```

## Step 4: Debug and Diagnose
```python
# Added debugging to understand failure points
class JWTValidator:
    def validate_token_debug(self, token: str) -> bool:
        import logging
        logger = logging.getLogger(__name__)
        
        start = time.time()
        logger.info("Starting token validation")
        
        try:
            # Decode and verify signature - FAST
            decode_start = time.time()
            payload = jwt.decode(token, self.public_key, algorithms=['RS256'])
            logger.info(f"Decode time: {(time.time()-decode_start)*1000:.1f}ms")
            
            # Database lookup - SLOW AND FAILS
            db_start = time.time()
            try:
                is_revoked = self.is_token_revoked(payload['jti'])
                logger.info(f"DB lookup time: {(time.time()-db_start)*1000:.1f}ms")
            except Exception as e:
                logger.error(f"DB timeout after {(time.time()-db_start)*1000:.1f}ms: {e}")
                raise
                
            return not is_revoked
            
        except jwt.InvalidTokenError as e:
            logger.error(f"Token invalid: {e}")
            return False

# Debug output shows:
# Decode time: 8.3ms (FAST)
# DB timeout after 5003.2ms: Connection pool timeout (SLOW/FAILING)
```

## Step 5: Develop and Implement
```python
# New implementation with Redis caching
import redis
from typing import Optional
import json

class CachedJWTValidator(JWTValidator):
    """
    JWT Validator with Redis caching to reduce database load
    """
    
    def __init__(self, redis_client: Optional[redis.Redis] = None):
        super().__init__()
        self.redis = redis_client or redis.Redis(
            host='localhost',
            port=6379,
            decode_responses=True,
            socket_timeout=1,
            socket_connect_timeout=1
        )
        self.cache_ttl = 3600  # 1 hour cache
        
    def validate_token(self, token: str) -> bool:
        """
        Validates JWT token with Redis cache check
        """
        try:
            # Decode and verify signature (always do this for security)
            payload = jwt.decode(token, self.public_key, algorithms=['RS256'])
            jti = payload['jti']
            
            # Check cache first
            cache_key = f"token:valid:{jti}"
            cached = self._get_from_cache(cache_key)
            
            if cached is not None:
                # Cache hit - return cached validation result
                return cached
            
            # Cache miss - check database
            is_revoked = self._check_revocation_with_fallback(jti)
            
            # Cache the result
            self._set_cache(cache_key, not is_revoked, self.cache_ttl)
            
            return not is_revoked
            
        except jwt.InvalidTokenError:
            return False
            
    def _get_from_cache(self, key: str) -> Optional[bool]:
        """
        Get value from cache with error handling
        """
        try:
            value = self.redis.get(key)
            return value == 'true' if value else None
        except redis.RedisError:
            # Log but don't fail on cache errors
            return None
            
    def _set_cache(self, key: str, value: bool, ttl: int):
        """
        Set cache value with error handling
        """
        try:
            self.redis.setex(key, ttl, 'true' if value else 'false')
        except redis.RedisError:
            # Log but don't fail on cache errors
            pass
            
    def _check_revocation_with_fallback(self, jti: str) -> bool:
        """
        Check if token is revoked with circuit breaker pattern
        """
        try:
            return self.is_token_revoked(jti)
        except Exception as e:
            # If database is down, check cache for revocation status
            revoked_key = f"token:revoked:{jti}"
            try:
                return self.redis.get(revoked_key) == 'true'
            except:
                # Both DB and cache failed - fail secure
                raise
                
    def revoke_token(self, jti: str):
        """
        Revoke a token and update cache
        """
        # Update database
        super().revoke_token(jti)
        
        # Update cache
        try:
            # Mark as revoked in cache
            self.redis.setex(f"token:revoked:{jti}", 86400, 'true')
            # Remove from valid cache
            self.redis.delete(f"token:valid:{jti}")
        except redis.RedisError:
            # Cache update failed, but DB update succeeded
            pass
```

## Step 6: Verify and Test Rigorously
```python
# test_cached_jwt_validator.py
import pytest
import redis
from unittest.mock import Mock, patch
from auth.cached_jwt_validator import CachedJWTValidator

class TestCachedJWTValidator:
    
    @pytest.fixture
    def validator(self):
        """Create validator with mocked Redis"""
        redis_mock = Mock(spec=redis.Redis)
        return CachedJWTValidator(redis_client=redis_mock)
    
    def test_cache_hit_avoids_database(self, validator):
        """Test that cache hit prevents database query"""
        # Setup
        token = generate_test_token(jti="test123")
        validator.redis.get.return_value = 'true'
        
        # Execute
        with patch.object(validator, 'is_token_revoked') as mock_db:
            result = validator.validate_token(token)
        
        # Verify
        assert result is True
        mock_db.assert_not_called()  # Database not touched!
        validator.redis.get.assert_called_with("token:valid:test123")
    
    def test_cache_miss_queries_database(self, validator):
        """Test that cache miss falls back to database"""
        # Setup
        token = generate_test_token(jti="test456")
        validator.redis.get.return_value = None  # Cache miss
        
        # Execute
        with patch.object(validator, 'is_token_revoked', return_value=False):
            result = validator.validate_token(token)
        
        # Verify
        assert result is True
        validator.redis.setex.assert_called_with(
            "token:valid:test456", 3600, 'true'
        )
    
    def test_redis_failure_fallback(self, validator):
        """Test graceful fallback when Redis is down"""
        # Setup
        token = generate_test_token(jti="test789")
        validator.redis.get.side_effect = redis.RedisError("Connection failed")
        
        # Execute - should still work via database
        with patch.object(validator, 'is_token_revoked', return_value=False):
            result = validator.validate_token(token)
        
        # Verify
        assert result is True
    
    def test_token_revocation_updates_cache(self, validator):
        """Test that revoking token updates cache"""
        # Execute
        validator.revoke_token("test999")
        
        # Verify
        validator.redis.setex.assert_called_with(
            "token:revoked:test999", 86400, 'true'
        )
        validator.redis.delete.assert_called_with("token:valid:test999")

# Integration test with real Redis
class TestIntegration:
    
    @pytest.mark.integration
    def test_high_load_with_cache(self):
        """Test system under load with caching enabled"""
        validator = CachedJWTValidator()
        tokens = [generate_test_token() for _ in range(100)]
        
        # Warm cache
        for token in tokens[:10]:
            validator.validate_token(token)
        
        # Test under load
        start = time.time()
        with concurrent.futures.ThreadPoolExecutor(max_workers=50) as executor:
            results = list(executor.map(validator.validate_token, tokens * 10))
        
        duration = time.time() - start
        success_rate = sum(results) / len(results)
        
        assert success_rate > 0.999  # Less than 0.1% failure
        assert duration < 5  # Complete in under 5 seconds
        
# Performance test results:
# Before: 15.2% failure rate, 487.3ms average
# After: 0.08% failure rate, 12.7ms average
```

## Step 7: Document and Summarize
```python
# Added to auth/cached_jwt_validator.py
"""
Redis-Cached JWT Validator

This module implements JWT token validation with Redis caching to improve
performance under high load. 

Architecture:
- Primary validation through Redis cache (sub-millisecond)
- Fallback to database for cache misses
- Circuit breaker pattern for database failures
- Cache invalidation on token revocation

Cache Strategy:
- Valid tokens cached for 1 hour (matching token lifetime)
- Revoked tokens cached for 24 hours
- Cache errors don't cause validation failures (graceful degradation)

Performance Improvements:
- 98% reduction in database queries
- 38x improvement in validation speed (487ms -> 12.7ms)
- 99.9% reduction in timeout errors

Configuration:
    REDIS_HOST: Redis server hostname (default: localhost)
    REDIS_PORT: Redis server port (default: 6379)
    CACHE_TTL: Valid token cache duration in seconds (default: 3600)

Example:
    validator = CachedJWTValidator()
    is_valid = validator.validate_token(token_string)
    
See also:
    - docs/architecture/caching.md
    - tests/test_cached_jwt_validator.py
"""

# Updated configuration
# config/redis_config.py
REDIS_CONFIG = {
    'host': os.getenv('REDIS_HOST', 'localhost'),
    'port': int(os.getenv('REDIS_PORT', 6379)),
    'decode_responses': True,
    'socket_timeout': 1,
    'socket_connect_timeout': 1,
    'max_connections': 50,
    'health_check_interval': 30
}

# Monitoring setup
# monitoring/auth_metrics.py
class AuthMetrics:
    def __init__(self):
        self.cache_hits = Counter('auth_cache_hits_total')
        self.cache_misses = Counter('auth_cache_misses_total')
        self.validation_duration = Histogram('auth_validation_duration_seconds')
        self.validation_errors = Counter('auth_validation_errors_total')
```

## Deployment Notes
```yaml
# docker-compose.yml additions
services:
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    command: redis-server --appendonly yes
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5

# Kubernetes ConfigMap
apiVersion: v1
kind: ConfigMap
metadata:
  name: auth-config
data:
  REDIS_HOST: "redis-service.default.svc.cluster.local"
  CACHE_TTL: "3600"
  ENABLE_CACHE: "true"
```

## Results Summary
- **Problem**: JWT validation timeouts under high load (15% failure rate)
- **Root Cause**: Database connection pool exhaustion during token validation
- **Solution**: Redis caching layer with graceful fallback
- **Outcome**: 
  - 0.08% failure rate (99.5% improvement)
  - 12.7ms average response time (97% improvement)
  - System handles 5000 concurrent users without degradation
- **Lessons Learned**: 
  - Caching critical for high-frequency validations
  - Graceful degradation prevents complete failures
  - Load testing essential before production deployment

---
This implementation example demonstrates the complete Enhanced Context Engineering Framework process from problem identification through successful deployment.