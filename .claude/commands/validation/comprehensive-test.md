---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Multi-level testing protocol ensuring code quality, performance, and security with comprehensive validation
---

# Comprehensive Testing Protocol

## Context
This command implements a rigorous 6-level testing validation protocol ensuring code meets professional standards for quality, performance, and security. Use this command to validate code thoroughly before deployment through systematic testing approaches.

## Testing Protocol Process

### Step 1: Test Environment Setup and Validation
**Environment Preparation**
```bash
# Set up testing environment
python -m venv test_env
source test_env/bin/activate
pip install -r requirements.txt
pip install -r requirements-test.txt

# Validate test environment
python -c "import sys; print(f'Python version: {sys.version}')"
pip list | grep -E "pytest|coverage|mock"

# Clean up previous test artifacts
rm -rf .coverage htmlcov/ .pytest_cache/
find . -name "*.pyc" -delete
find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
```

**Test Data and Configuration Setup**
- Set up test databases and data fixtures
- Configure test settings and environment variables
- Prepare mock services and external dependencies
- Validate test configuration and connectivity
- Document test environment requirements

### Step 2: Level 1 - Syntax and Style Validation
**Code Style and Formatting**
```bash
# Format code consistently
black . --check --diff
isort . --check-only --diff

# Lint code for style issues
ruff check . --show-source
flake8 . --max-line-length=88 --extend-ignore=E203,E501

# Check import sorting
isort . --check-only --verbose
```

**Type Checking and Static Analysis**
```bash
# Type checking with mypy
mypy . --strict --show-error-codes

# Static code analysis
pylint src/ --rcfile=.pylintrc

# Complexity analysis
radon cc . --min=B --show-complexity
radon mi . --min=B --show-maintainability
```

**Quality Gate 1: Syntax and Style**
- [ ] Code formatting is consistent (Black/Prettier)
- [ ] No linting errors or warnings
- [ ] Type hints are complete and valid
- [ ] Import statements are properly organized
- [ ] Code complexity is within acceptable limits

### Step 3: Level 2 - Unit Testing Validation (85% Minimum Coverage)
**Comprehensive Unit Testing**
```bash
# Run unit tests with coverage
pytest tests/unit/ -v --cov=src --cov-report=html --cov-report=term-missing --cov-fail-under=85

# Generate detailed coverage reports
coverage report --show-missing --skip-covered
coverage html

# Test specific modules with detailed output
pytest tests/unit/test_module.py -v -s --tb=short

# Run tests with parallel execution
pytest tests/unit/ -n auto --dist=worksteal
```

**Test Quality Validation**
```bash
# Check test isolation
pytest tests/unit/ --cache-clear --forked

# Validate test performance
pytest tests/unit/ --durations=10

# Test with different Python versions (if available)
tox -e py38,py39,py310

# Check for flaky tests
pytest tests/unit/ --count=3 --verbose
```

**Quality Gate 2: Unit Testing**
- [ ] Minimum 85% line coverage achieved
- [ ] All unit tests pass consistently
- [ ] Tests are properly isolated (no interdependencies)
- [ ] Test execution time is reasonable (<5 minutes)
- [ ] No flaky or unreliable tests

### Step 4: Level 3 - Integration Testing Validation
**API and Service Integration Testing**
```bash
# Run integration tests
pytest tests/integration/ -v --tb=short

# Test API endpoints
pytest tests/integration/api/ -v --strict-markers

# Database integration tests
pytest tests/integration/database/ -v

# External service integration tests
pytest tests/integration/services/ -v --timeout=30
```

**End-to-End Workflow Testing**
```bash
# Complete user workflow tests
pytest tests/e2e/ -v --browser=headless

# Test data flow between components
pytest tests/integration/dataflow/ -v

# Test configuration and deployment scenarios
pytest tests/integration/deployment/ -v
```

**Quality Gate 3: Integration Testing**
- [ ] All API endpoints tested and working
- [ ] Database operations tested and validated
- [ ] External service integrations working
- [ ] End-to-end workflows complete successfully
- [ ] Data consistency maintained across components

### Step 5: Level 4 - System Testing Validation
**Complete System Functionality Testing**
```bash
# System-wide functionality tests
pytest tests/system/ -v --timeout=60

# User acceptance test scenarios
pytest tests/uat/ -v --strict-markers

# Business logic validation
pytest tests/business/ -v

# Configuration and environment testing
pytest tests/config/ -v
```

**Cross-Platform and Environment Testing**
```bash
# Test different operating systems (if applicable)
docker run -v $(pwd):/app python:3.9 pytest /app/tests/

# Test different database versions
docker-compose -f docker-compose.test.yml up --abort-on-container-exit

# Test with different dependency versions
pip-compile requirements.in --upgrade && pip install -r requirements.txt
pytest tests/ -v
```

**Quality Gate 4: System Testing**
- [ ] All system features working as specified
- [ ] User acceptance criteria met
- [ ] Business logic validation passes
- [ ] Cross-platform compatibility verified
- [ ] Environment configuration tested

### Step 6: Level 5 - Performance Testing Validation
**Load and Performance Testing**
```bash
# Benchmark critical functions
pytest tests/performance/ --benchmark-only --benchmark-sort=mean

# Load testing with locust
locust -f tests/load/locustfile.py --host=http://localhost:8000 --users=100 --spawn-rate=10 -t 60s --headless

# Memory profiling
python -m memory_profiler tests/performance/memory_test.py

# CPU profiling
python -m cProfile -o profile_output.prof main.py
```

**Database and Query Performance**
```bash
# Database query performance tests
pytest tests/performance/database/ -v --benchmark-compare=baseline.json

# Index usage and optimization validation
python tests/performance/analyze_queries.py

# Connection pooling and resource usage tests
pytest tests/performance/resources/ -v
```

**Quality Gate 5: Performance Testing**
- [ ] Response times meet performance requirements
- [ ] System handles expected load capacity
- [ ] Memory usage is within acceptable limits
- [ ] Database queries are optimized
- [ ] No performance regressions detected

### Step 7: Level 6 - Security Testing Validation
**Security Vulnerability Scanning**
```bash
# Security vulnerability scanning
bandit -r src/ -f json -o security-report.json
safety check --json

# Dependency vulnerability checking
pip-audit --format=json --output=dependency-audit.json

# SAST (Static Application Security Testing)
semgrep --config=auto src/
```

**Authentication and Authorization Testing**
```bash
# Authentication mechanism testing
pytest tests/security/auth/ -v

# Authorization and access control tests
pytest tests/security/permissions/ -v

# Session management testing
pytest tests/security/sessions/ -v

# Input validation and sanitization tests
pytest tests/security/input_validation/ -v
```

**Quality Gate 6: Security Testing**
- [ ] No critical security vulnerabilities found
- [ ] Authentication mechanisms working properly
- [ ] Authorization controls enforced correctly
- [ ] Input validation prevents injection attacks
- [ ] Security dependencies are up-to-date

## Comprehensive Testing Report

### Test Execution Summary
```markdown
# Comprehensive Testing Report

## Executive Summary
- **Test Date**: [Date]
- **Total Test Duration**: [Duration]
- **Overall Status**: [PASS/FAIL]
- **Test Coverage**: [Coverage Percentage]
- **Critical Issues**: [Count]

## Test Results by Level

### Level 1: Syntax and Style ✅/❌
- **Status**: [PASS/FAIL]
- **Code Style**: [PASS/FAIL]
- **Type Checking**: [PASS/FAIL]
- **Static Analysis**: [PASS/FAIL]
- **Issues Found**: [Count]

### Level 2: Unit Testing ✅/❌
- **Status**: [PASS/FAIL]
- **Coverage**: [Percentage]
- **Tests Passed**: [Count]/[Total]
- **Test Duration**: [Duration]
- **Failed Tests**: [List if any]

### Level 3: Integration Testing ✅/❌
- **Status**: [PASS/FAIL]
- **API Tests**: [PASS/FAIL]
- **Database Tests**: [PASS/FAIL]
- **Service Integration**: [PASS/FAIL]
- **E2E Tests**: [PASS/FAIL]

### Level 4: System Testing ✅/❌
- **Status**: [PASS/FAIL]
- **Functionality Tests**: [PASS/FAIL]
- **UAT Scenarios**: [PASS/FAIL]
- **Business Logic**: [PASS/FAIL]
- **Environment Tests**: [PASS/FAIL]

### Level 5: Performance Testing ✅/❌
- **Status**: [PASS/FAIL]
- **Load Tests**: [PASS/FAIL]
- **Benchmark Results**: [Summary]
- **Memory Usage**: [Within limits/Excessive]
- **Response Times**: [Meeting requirements/Too slow]

### Level 6: Security Testing ✅/❌
- **Status**: [PASS/FAIL]
- **Vulnerability Scan**: [Clean/Issues found]
- **Authentication Tests**: [PASS/FAIL]
- **Authorization Tests**: [PASS/FAIL]
- **Input Validation**: [PASS/FAIL]

## Detailed Findings

### Critical Issues (Must Fix)
1. **Issue 1**: [Description]
   - **Severity**: Critical
   - **Impact**: [Impact description]
   - **Location**: [File/line references]
   - **Recommendation**: [How to fix]

### Major Issues (Should Fix)
1. **Issue 1**: [Description]
   - **Severity**: Major
   - **Impact**: [Impact description]
   - **Location**: [File/line references]
   - **Recommendation**: [How to fix]

### Minor Issues (Nice to Fix)
1. **Issue 1**: [Description]
   - **Severity**: Minor
   - **Impact**: [Impact description]
   - **Location**: [File/line references]
   - **Recommendation**: [How to fix]

## Performance Metrics

### Response Time Benchmarks
- **API Response Time**: [X]ms (Target: [Y]ms)
- **Database Query Time**: [X]ms (Target: [Y]ms)
- **Page Load Time**: [X]ms (Target: [Y]ms)

### Resource Usage
- **Memory Usage**: [X]MB (Limit: [Y]MB)
- **CPU Usage**: [X]% (Limit: [Y]%)
- **Disk I/O**: [X] ops/sec

### Load Testing Results
- **Concurrent Users**: [Tested]/[Target]
- **Requests per Second**: [Achieved]/[Target]
- **Error Rate**: [X]% (Acceptable: <[Y]%)

## Security Assessment

### Vulnerability Summary
- **Critical**: [Count]
- **High**: [Count]
- **Medium**: [Count]
- **Low**: [Count]

### Security Controls Validated
- [x] Input validation and sanitization
- [x] Authentication mechanisms
- [x] Authorization controls
- [x] Session management
- [x] Data encryption
- [x] SQL injection prevention

## Recommendations

### Immediate Actions Required
1. [Critical fix 1]
2. [Critical fix 2]
3. [Critical fix 3]

### Performance Optimizations
1. [Optimization 1]
2. [Optimization 2]
3. [Optimization 3]

### Security Improvements
1. [Security improvement 1]
2. [Security improvement 2]
3. [Security improvement 3]

## Deployment Readiness

### Quality Gates Status
- [ ] All critical issues resolved
- [ ] Performance requirements met
- [ ] Security vulnerabilities addressed
- [ ] Test coverage above threshold
- [ ] Documentation updated

### Deployment Recommendation
**Status**: [APPROVED/NEEDS_WORK/REJECTED]
**Justification**: [Explanation of decision]

### Next Steps
1. [Action item 1]
2. [Action item 2]
3. [Action item 3]
```

## Testing Configuration

### Test Dependencies
```bash
# Install testing dependencies
pip install pytest pytest-cov pytest-xdist pytest-benchmark
pip install black ruff mypy bandit safety
pip install locust memory-profiler
```

### Test Environment Variables
```bash
# Set testing environment variables
export TESTING=true
export DATABASE_URL=sqlite:///:memory:
export LOG_LEVEL=DEBUG
export CACHE_BACKEND=dummy
```

## Quality Assurance Checklist

### Pre-Testing Setup
- [ ] Test environment properly configured
- [ ] All test dependencies installed
- [ ] Test data and fixtures prepared
- [ ] Mock services configured
- [ ] Environment variables set

### Testing Execution
- [ ] All 6 testing levels completed
- [ ] Quality gates validated at each level
- [ ] Performance benchmarks recorded
- [ ] Security scans completed
- [ ] Results documented comprehensively

### Post-Testing Analysis
- [ ] Critical issues identified and prioritized
- [ ] Performance metrics analyzed
- [ ] Security vulnerabilities assessed
- [ ] Deployment readiness determined
- [ ] Recommendations provided

## Success Criteria
- **All Tests Pass**: 100% test success rate required
- **Coverage Target**: Minimum 85% code coverage
- **Performance Standards**: All benchmarks meet requirements
- **Security Clean**: Zero critical security vulnerabilities
- **Quality Gates**: All 6 levels pass validation

## Output Requirements

### File Locations
- Save test report as `tests/reports/comprehensive-test-YYYY-MM-DD.md`
- Save coverage report as `htmlcov/index.html`
- Save security report as `tests/reports/security-YYYY-MM-DD.json`
- Save performance results as `tests/reports/performance-YYYY-MM-DD.json`
- Update `TASK.md` with testing completion

### Deliverables
- Comprehensive test execution report
- Detailed coverage analysis
- Performance benchmark results
- Security vulnerability assessment
- Deployment readiness recommendation

Use this command to ensure comprehensive validation and quality assurance before any deployment or release.