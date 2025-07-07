# Gemini Usage Examples - Real Session Demonstrations

This document shows practical examples of using Gemini commands in real development scenarios.

## Example 1: Starting a New Feature with Plan Review

### Scenario
Claude is about to implement a user authentication system. Let's use Gemini to review the plan.

```bash
# Claude's current todos (from TodoRead):
[
  { "id": "auth_design", "content": "Design authentication system architecture", "status": "completed" },
  { "id": "auth_implement", "content": "Implement JWT-based authentication", "status": "in_progress" },
  { "id": "auth_tests", "content": "Write authentication tests", "status": "pending" },
  { "id": "auth_docs", "content": "Document authentication API", "status": "pending" }
]

# Run Gemini plan review
$ /project:research:gemini-plan-review

# Gemini's response:
# Plan Review
- **Assessment**: Risky
- **Critical Issues**: 
  - No mention of refresh token implementation
  - Missing rate limiting for auth endpoints
  - No account lockout mechanism planned
- **Recommendations**:
  - Add refresh token rotation strategy
  - Implement brute force protection
  - Consider OAuth2 integration option
- **Alternative**: Use established auth library (e.g., Passport.js)
```

## Example 2: Security Check After Implementation

### Scenario
Claude has implemented the authentication system. Time for a security audit.

```bash
# Run security check
$ /project:research:gemini-security-check

# Gemini's response:
# Security Report
- **Risk Level**: High
- **Vulnerabilities Found**:
  - [CRITICAL] Plain text password in logs at auth.js:45
  - [HIGH] No CSRF protection on login endpoint
  - [HIGH] JWT secret hardcoded in config.js:12
  - [MEDIUM] Missing security headers (HSTS, CSP)
- **Immediate Actions**:
  1. Remove password logging immediately
  2. Move JWT secret to environment variable
  3. Add CSRF token validation
- **Compliance**: Fails OWASP authentication standards
```

## Example 3: Code Quality Analysis During Development

### Scenario
Mid-development checkpoint to assess code quality.

```bash
# Run code analysis
$ /project:research:gemini-code-analysis

# Gemini's response:
# Code Analysis
- **Quality Score**: 6/10
- **Critical Issues**: 
  - Duplicate code: auth validation in 3 files
  - God object: UserService handles 15+ responsibilities
  - No error handling: Database calls can fail silently
- **Quick Wins**:
  1. Extract auth validation to middleware
  2. Split UserService into Auth + Profile services
  3. Add try-catch blocks with proper logging
- **Technical Debt**: Medium
```

## Example 4: Architecture Review for Scaling

### Scenario
System is growing. Need to assess architecture before adding more features.

```bash
# Run architecture review
$ /project:research:gemini-architecture-review

# Gemini's response:
# Architecture Assessment
- **Design Quality**: Fair
- **Key Issues**:
  - Monolithic structure: All services in single process
  - Database coupling: Direct SQL in controllers
  - No caching layer: Every request hits database
- **Refactoring Needs**:
  - Introduce repository pattern
  - Add Redis caching layer
  - Consider microservices for auth service
- **Scalability**: Poor - will struggle beyond 1000 users
```

## Example 5: Risk Assessment Before Deployment

### Scenario
About to deploy to production. Final risk check.

```bash
# Run risk assessment
$ /project:research:gemini-risk-assessment

# Gemini's response:
# Risk Assessment
- **Overall Risk**: High
- **Top Risks**:
  1. Database migrations untested: High/Critical
  2. No rollback plan defined: High/High
  3. Memory leak in websocket handler: Medium/High
- **Blockers**:
  - Missing production environment variables
  - Load testing not performed
- **Mitigation**:
  1. Test migrations on staging database
  2. Create deployment rollback procedure
  3. Run load tests with 100+ concurrent users
```

## Example 6: Advanced Custom Analysis

### Scenario
Need specific analysis for API design compliance.

```bash
# Custom API analysis
$ gemini --prompt "Analyze our REST API for compliance with REST principles and OpenAPI 3.0 specification"

# Gemini's response:
IMPORTANT: I will NEVER write files or execute shell commands. Only providing analysis.

REST API Analysis:
1. **REST Compliance Issues**:
   - Verbs in URLs: /api/getUser should be GET /api/users/:id
   - Inconsistent pluralization: /api/user vs /api/products
   - Status codes misuse: Returning 200 for errors

2. **OpenAPI 3.0 Gaps**:
   - Missing response schemas in 8 endpoints
   - No example values provided
   - Authentication not documented in spec

3. **Recommendations**:
   - Refactor URLs to be resource-based
   - Standardize error response format
   - Generate OpenAPI spec from code annotations
```

## Example 7: Handling Gemini Unavailability

### Scenario
Gemini is not installed on the system.

```bash
# Attempt to run Gemini command
$ /project:research:gemini-plan-review

# Output when Gemini not available:
Gemini not installed - skipping verification

# Workflow continues normally without blocking
```

## Common Usage Patterns

### 1. Pre-Implementation Verification Loop
```bash
1. Create implementation plan
2. /project:research:gemini-plan-review
3. Adjust plan based on feedback
4. /project:research:gemini-risk-assessment
5. Begin implementation
```

### 2. Continuous Quality Checks
```bash
# After each major component:
- Implement feature
- /project:research:gemini-code-analysis
- Refactor based on feedback
- /project:research:gemini-security-check
- Fix security issues
```

### 3. Pre-Deployment Checklist
```bash
1. /project:research:gemini-security-check
2. /project:research:gemini-architecture-review
3. /project:research:gemini-risk-assessment
4. Address all critical issues
5. Deploy with confidence
```

## Integration with Claude Workflow

### Example: Complete Feature Development Flow

```bash
# 1. Claude creates todos
TodoWrite([
  { "id": "1", "content": "Design payment system", "status": "pending" },
  { "id": "2", "content": "Implement Stripe integration", "status": "pending" },
  { "id": "3", "content": "Add payment tests", "status": "pending" }
])

# 2. Gemini reviews the plan
/project:research:gemini-plan-review
# Gemini suggests: "Add PCI compliance considerations"

# 3. Claude updates plan based on feedback
TodoWrite([
  { "id": "4", "content": "Ensure PCI compliance", "status": "pending" }
])

# 4. Claude implements feature
# ... implementation code ...

# 5. Gemini checks security
/project:research:gemini-security-check
# Gemini finds: "Credit card data logged in debug mode"

# 6. Claude fixes issues and continues
```

## Best Practices from Real Usage

1. **Run plan review early** - Catch design issues before coding
2. **Regular code analysis** - Every 2-3 hours of coding
3. **Security check critical paths** - Auth, payments, user data
4. **Architecture review weekly** - For active development
5. **Risk assessment before milestones** - Deployments, demos

## Troubleshooting Common Issues

### Issue: Gemini provides too generic feedback
**Solution**: Use custom prompts with specific context
```bash
gemini --prompt "Review the JWT implementation in auth.js specifically for token expiration and rotation security"
```

### Issue: Analysis takes too long
**Solution**: Use targeted simple commands instead of full analysis
```bash
# Instead of full analysis, use:
/project:research:gemini-security-check  # Just security
/project:research:gemini-code-analysis   # Just code quality
```

### Issue: Conflicting recommendations
**Solution**: Prioritize based on project needs
- Security issues: Always highest priority
- Performance: Important for user-facing features
- Architecture: Important for long-term maintenance

## Summary

Gemini commands provide valuable verification without blocking workflow. Use them:
- **Early** to catch design issues
- **Often** to maintain quality
- **Specifically** when you need targeted analysis
- **Optionally** when Gemini isn't available

Remember: Gemini enhances quality but never blocks progress. If unavailable, continue with standard development practices.