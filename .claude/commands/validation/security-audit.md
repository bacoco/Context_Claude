---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Comprehensive security validation checklist and audit process ensuring application security controls and compliance
---

# Comprehensive Security Audit

## Context
This command provides comprehensive security validation checklist and audit process to ensure application security controls are properly implemented and compliant with security standards. Use this command to validate security posture before deployment.

## Security Audit Process

### Step 1: Security Baseline and Scope Definition
**Security Audit Scope Definition**
- Define security audit scope and objectives
- Identify critical assets and data flows
- Document security requirements and compliance standards
- Establish security testing criteria and thresholds
- Create security audit timeline and milestones

**Current Security Posture Assessment**
```bash
# Check for existing security configurations
find . -name "*.py" | xargs grep -l "password\|secret\|key\|token" | head -10
find . -name "*.env*" -o -name "*config*" | head -10

# Analyze authentication mechanisms
grep -r "auth\|login\|session" --include="*.py" . | head -10

# Check for security headers and middleware
grep -r "CORS\|CSRF\|XSS\|security" --include="*.py" .
```

### Step 2: Static Application Security Testing (SAST)
**Code Security Analysis**
```bash
# Security vulnerability scanning with bandit
bandit -r . -f json -o security-scan-results.json
bandit -r . -ll -f txt

# Dependency vulnerability checking
safety check --json --output safety-report.json
pip-audit --format=json --output=pip-audit-report.json

# Secrets detection
truffleHog --regex --entropy=False .
git-secrets --scan-history
```

**Static Code Analysis for Security Issues**
```bash
# Security-focused linting
semgrep --config=auto --json --output=semgrep-results.json .
semgrep --config=p/security-audit .

# Check for hardcoded secrets
grep -r "password\s*=\|secret\s*=\|key\s*=" --include="*.py" .
grep -r "api_key\|access_token\|private_key" --include="*.py" .

# SQL injection vulnerability detection
grep -r "SELECT.*%\|INSERT.*%\|UPDATE.*%" --include="*.py" .
grep -r "execute.*format\|query.*%" --include="*.py" .
```

### Step 3: Authentication and Authorization Security
**Authentication Mechanism Validation**
```bash
# Test authentication endpoints
pytest tests/security/auth/ -v --tb=short

# Password policy validation
python -c "
import re
patterns = [
    r'.{8,}',  # Minimum 8 characters
    r'[A-Z]',  # Uppercase letter
    r'[a-z]',  # Lowercase letter
    r'[0-9]',  # Number
    r'[!@#$%^&*]'  # Special character
]
print('Password policy patterns to validate:', patterns)
"

# Session management testing
pytest tests/security/sessions/ -v
```

**Authorization and Access Control Testing**
```bash
# Role-based access control testing
pytest tests/security/rbac/ -v

# Permission boundary testing
pytest tests/security/permissions/ -v

# Privilege escalation testing
pytest tests/security/privilege_escalation/ -v

# API access control validation
pytest tests/security/api_access/ -v
```

### Step 4: Input Validation and Data Security
**Input Validation Security Testing**
```bash
# SQL injection testing
pytest tests/security/sql_injection/ -v

# XSS (Cross-Site Scripting) testing
pytest tests/security/xss/ -v

# Command injection testing
pytest tests/security/command_injection/ -v

# Path traversal testing
pytest tests/security/path_traversal/ -v
```

**Data Protection and Encryption Validation**
```bash
# Encryption implementation testing
pytest tests/security/encryption/ -v

# Data sanitization testing
pytest tests/security/data_sanitization/ -v

# PII (Personally Identifiable Information) handling
grep -r "email\|phone\|ssn\|credit.*card" --include="*.py" .
pytest tests/security/pii_handling/ -v
```

### Step 5: Network and Communication Security
**HTTPS and TLS Configuration**
```bash
# Check for HTTPS enforcement
grep -r "SECURE_SSL_REDIRECT\|HTTPS_ONLY" --include="*.py" .
grep -r "force_https\|require_https" --include="*.py" .

# TLS configuration validation
openssl s_client -connect localhost:443 -servername localhost < /dev/null 2>/dev/null | openssl x509 -text

# Security headers validation
curl -I https://localhost:443 | grep -E "Strict-Transport-Security|X-Frame-Options|X-Content-Type-Options|Content-Security-Policy"
```

**API Security Testing**
```bash
# API rate limiting testing
pytest tests/security/rate_limiting/ -v

# API authentication testing
pytest tests/security/api_auth/ -v

# CORS (Cross-Origin Resource Sharing) testing
pytest tests/security/cors/ -v

# API input validation testing
pytest tests/security/api_validation/ -v
```

### Step 6: Dynamic Application Security Testing (DAST)
**Automated Security Scanning**
```bash
# OWASP ZAP baseline scan
docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py \
    -t http://localhost:8000 -J zap-baseline-report.json

# Web application vulnerability scanning
nikto -h http://localhost:8000 -output nikto-report.txt

# SSL/TLS security testing
testssl.sh --severity=HIGH --parallel https://localhost:443
```

**Manual Security Testing Scenarios**
```bash
# Business logic testing
pytest tests/security/business_logic/ -v

# Error handling security testing
pytest tests/security/error_handling/ -v

# File upload security testing
pytest tests/security/file_upload/ -v

# Logout and session termination testing
pytest tests/security/logout/ -v
```

### Step 7: Compliance and Regulatory Validation
**Compliance Standards Validation**
- Validate GDPR compliance for data protection
- Check OWASP Top 10 vulnerability prevention
- Verify PCI DSS compliance for payment processing
- Assess HIPAA compliance for healthcare data
- Document compliance gaps and remediation plans

**Security Policy and Procedure Validation**
- Review incident response procedures
- Validate backup and recovery processes
- Check access control policies
- Verify data retention policies
- Document security training requirements

## Security Audit Report Structure

### Executive Summary
```markdown
# Security Audit Report

## Executive Summary
- **Audit Date**: [Date]
- **Auditor**: [Name/Team]
- **Application**: [Application Name]
- **Overall Security Score**: [Score]/100
- **Critical Vulnerabilities**: [Count]
- **Compliance Status**: [Compliant/Non-compliant/Partial]

## Risk Assessment
- **Critical Risk**: [Count] issues
- **High Risk**: [Count] issues
- **Medium Risk**: [Count] issues
- **Low Risk**: [Count] issues
- **Total Issues**: [Count]

## Compliance Summary
- **OWASP Top 10**: [Compliant/Issues found]
- **GDPR**: [Compliant/Issues found]
- **PCI DSS**: [Compliant/N/A/Issues found]
- **HIPAA**: [Compliant/N/A/Issues found]
- **Industry Standards**: [Compliant/Issues found]
```

### Detailed Security Assessment
```markdown
## Authentication and Authorization

### Authentication Security
- **Password Policy**: [Strong/Weak/Missing]
  - Minimum length: [X characters]
  - Complexity requirements: [Met/Not met]
  - Account lockout: [Implemented/Missing]
  - Password history: [Implemented/Missing]

- **Multi-Factor Authentication**: [Implemented/Missing]
- **Session Management**: [Secure/Issues found]
- **Account Recovery**: [Secure/Vulnerable]

### Authorization Controls
- **Role-Based Access Control**: [Implemented/Missing]
- **Principle of Least Privilege**: [Followed/Violated]
- **Privilege Escalation Prevention**: [Implemented/Vulnerable]
- **API Access Controls**: [Secure/Issues found]

## Input Validation and Data Security

### Input Validation
- **SQL Injection Prevention**: [Protected/Vulnerable]
- **XSS Prevention**: [Protected/Vulnerable]
- **Command Injection Prevention**: [Protected/Vulnerable]
- **Path Traversal Prevention**: [Protected/Vulnerable]
- **File Upload Security**: [Secure/Vulnerable]

### Data Protection
- **Data Encryption at Rest**: [Implemented/Missing]
- **Data Encryption in Transit**: [Implemented/Missing]
- **PII Data Handling**: [Compliant/Issues found]
- **Data Sanitization**: [Implemented/Inadequate]
- **Backup Security**: [Secure/Issues found]

## Network and Communication Security

### Transport Security
- **HTTPS Enforcement**: [Enforced/Optional/Missing]
- **TLS Configuration**: [Strong/Weak/Misconfigured]
- **Security Headers**: [Complete/Partial/Missing]
  - HSTS: [Present/Missing]
  - X-Frame-Options: [Present/Missing]
  - X-Content-Type-Options: [Present/Missing]
  - CSP: [Present/Missing]

### API Security
- **Rate Limiting**: [Implemented/Missing]
- **API Authentication**: [Strong/Weak/Missing]
- **CORS Configuration**: [Secure/Misconfigured]
- **API Input Validation**: [Comprehensive/Gaps found]

## Application Security Controls

### Error Handling
- **Error Information Disclosure**: [Secure/Information leaked]
- **Logging Security**: [Appropriate/Issues found]
- **Debug Information**: [Disabled/Exposed]
- **Stack Trace Exposure**: [Hidden/Exposed]

### Business Logic Security
- **Business Rule Enforcement**: [Secure/Bypassed]
- **Transaction Integrity**: [Maintained/Issues found]
- **Workflow Security**: [Secure/Vulnerable]
- **Data Consistency**: [Maintained/Issues found]

## Infrastructure Security

### Server Configuration
- **Server Hardening**: [Implemented/Missing]
- **Unnecessary Services**: [Disabled/Running]
- **File Permissions**: [Secure/Overly permissive]
- **Directory Listing**: [Disabled/Enabled]

### Database Security
- **Database Access Controls**: [Secure/Issues found]
- **Database Encryption**: [Implemented/Missing]
- **Database Backup Security**: [Secure/Issues found]
- **SQL Injection Prevention**: [Protected/Vulnerable]

## Identified Vulnerabilities

### Critical Vulnerabilities (CVSS 9.0-10.0)
1. **[Vulnerability Name]**
   - **CVSS Score**: [Score]
   - **Location**: [File/component]
   - **Description**: [Detailed description]
   - **Impact**: [Potential impact]
   - **Remediation**: [How to fix]
   - **Timeline**: [Immediate/ASAP]

### High Risk Vulnerabilities (CVSS 7.0-8.9)
1. **[Vulnerability Name]**
   - **CVSS Score**: [Score]
   - **Location**: [File/component]
   - **Description**: [Detailed description]
   - **Impact**: [Potential impact]
   - **Remediation**: [How to fix]
   - **Timeline**: [Within 7 days]

### Medium Risk Vulnerabilities (CVSS 4.0-6.9)
1. **[Vulnerability Name]**
   - **CVSS Score**: [Score]
   - **Location**: [File/component]
   - **Description**: [Detailed description]
   - **Impact**: [Potential impact]
   - **Remediation**: [How to fix]
   - **Timeline**: [Within 30 days]

### Low Risk Vulnerabilities (CVSS 0.1-3.9)
1. **[Vulnerability Name]**
   - **CVSS Score**: [Score]
   - **Location**: [File/component]
   - **Description**: [Detailed description]
   - **Impact**: [Potential impact]
   - **Remediation**: [How to fix]
   - **Timeline**: [Within 90 days]

## Compliance Assessment

### OWASP Top 10 (2021) Compliance
1. **A01:2021 – Broken Access Control**: [Compliant/Non-compliant]
2. **A02:2021 – Cryptographic Failures**: [Compliant/Non-compliant]
3. **A03:2021 – Injection**: [Compliant/Non-compliant]
4. **A04:2021 – Insecure Design**: [Compliant/Non-compliant]
5. **A05:2021 – Security Misconfiguration**: [Compliant/Non-compliant]
6. **A06:2021 – Vulnerable and Outdated Components**: [Compliant/Non-compliant]
7. **A07:2021 – Identification and Authentication Failures**: [Compliant/Non-compliant]
8. **A08:2021 – Software and Data Integrity Failures**: [Compliant/Non-compliant]
9. **A09:2021 – Security Logging and Monitoring Failures**: [Compliant/Non-compliant]
10. **A10:2021 – Server-Side Request Forgery**: [Compliant/Non-compliant]

### Regulatory Compliance
- **GDPR Article 32 (Security)**: [Compliant/Gaps identified]
- **PCI DSS Requirements**: [Compliant/N/A/Gaps identified]
- **HIPAA Security Rule**: [Compliant/N/A/Gaps identified]
- **SOC 2 Type II**: [Compliant/Gaps identified]

## Remediation Plan

### Immediate Actions (0-7 days)
- [ ] [Critical vulnerability fix 1]
- [ ] [Critical vulnerability fix 2]
- [ ] [Critical vulnerability fix 3]

### Short-term Actions (1-4 weeks)
- [ ] [High-risk vulnerability fix 1]
- [ ] [High-risk vulnerability fix 2]
- [ ] [Security control implementation]

### Medium-term Actions (1-3 months)
- [ ] [Medium-risk vulnerability fixes]
- [ ] [Security process improvements]
- [ ] [Compliance gap remediation]

### Long-term Actions (3-12 months)
- [ ] [Security architecture improvements]
- [ ] [Security training implementation]
- [ ] [Continuous security monitoring setup]

## Security Recommendations

### Technical Recommendations
1. **Implement Web Application Firewall (WAF)**
2. **Enable Security Headers**
3. **Implement Content Security Policy (CSP)**
4. **Use Parameterized Queries**
5. **Implement Input Validation Framework**

### Process Recommendations
1. **Establish Security Code Review Process**
2. **Implement Security Testing in CI/CD**
3. **Create Incident Response Plan**
4. **Establish Vulnerability Management Process**
5. **Implement Security Training Program**

### Monitoring Recommendations
1. **Implement Security Information and Event Management (SIEM)**
2. **Set up Intrusion Detection System (IDS)**
3. **Enable Application Security Monitoring**
4. **Implement Log Analysis and Alerting**
5. **Create Security Dashboards**

## Next Steps and Follow-up

### Immediate Actions Required
1. [Action 1]: [Description and owner]
2. [Action 2]: [Description and owner]
3. [Action 3]: [Description and owner]

### Follow-up Schedule
- **1 Week**: Critical vulnerability remediation review
- **1 Month**: High-risk vulnerability remediation review
- **3 Months**: Complete security audit follow-up
- **6 Months**: Next comprehensive security audit

### Risk Acceptance
- **Accepted Risks**: [List of risks accepted by business]
- **Risk Mitigation**: [Alternative controls implemented]
- **Business Justification**: [Reason for risk acceptance]
```

## Security Audit Checklist

### Pre-Audit Preparation
- [ ] Audit scope defined and approved
- [ ] Security requirements documented
- [ ] Testing environment prepared
- [ ] Security tools configured
- [ ] Baseline security posture captured

### Technical Security Testing
- [ ] Static application security testing (SAST) completed
- [ ] Dynamic application security testing (DAST) completed
- [ ] Interactive application security testing (IAST) conducted
- [ ] Software composition analysis (SCA) performed
- [ ] Infrastructure security assessment completed

### Security Controls Validation
- [ ] Authentication mechanisms tested
- [ ] Authorization controls validated
- [ ] Input validation verified
- [ ] Data protection controls checked
- [ ] Network security controls tested

### Compliance Validation
- [ ] OWASP Top 10 compliance verified
- [ ] Regulatory compliance assessed
- [ ] Industry standards compliance checked
- [ ] Internal security policies validated
- [ ] Third-party security requirements met

### Documentation and Reporting
- [ ] Vulnerabilities documented and prioritized
- [ ] Remediation plan created
- [ ] Compliance gaps identified
- [ ] Risk assessment completed
- [ ] Executive summary prepared

## Security Testing Tools Configuration

### Required Tools Installation
```bash
# Install security testing tools
pip install bandit safety semgrep truffleHog
npm install -g retire

# Docker-based tools
docker pull owasp/zap2docker-stable
docker pull securitycodescanner/semgrep

# Additional security tools
wget https://testssl.sh/testssl.sh
chmod +x testssl.sh
```

### Tool Configuration
```bash
# Configure bandit for Python security scanning
cat > .bandit << EOF
[bandit]
exclude_dirs = tests,venv,env
skips = B101,B601
EOF

# Configure safety for dependency checking
safety check --full-report

# Configure semgrep for security rules
semgrep --config=auto --config=p/security-audit .
```

## Success Criteria
- **Zero Critical Vulnerabilities**: No critical security issues found
- **Compliance Achievement**: All applicable compliance requirements met
- **Security Controls**: All required security controls implemented
- **Risk Acceptance**: All residual risks accepted by business
- **Documentation Complete**: All security documentation updated

## Output Requirements

### File Locations
- Save security audit report as `security/audit-report-YYYY-MM-DD.md`
- Save vulnerability scan results as `security/scan-results-{date}/`
- Save compliance assessment as `security/compliance-assessment.md`
- Update `TASK.md` with security audit completion

### Deliverables
- Comprehensive security audit report
- Vulnerability assessment with CVSS scores
- Compliance assessment and gap analysis
- Remediation plan with timelines
- Risk assessment and acceptance documentation

Use this command to ensure comprehensive security validation and compliance before deployment.