---
allowed-tools: Read(*), TodoRead
description: Instant security vulnerability scan by Gemini - zero setup required  
---

# Gemini Security Check

## Context
Automatic security analysis. Finds vulnerabilities without configuration.

## Automatic Execution

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Security Scan
```bash
# Auto-find security-critical files
Read files containing:
- Authentication/authorization code
- Database queries
- API endpoints
- Configuration files
- User input handling
```

### Step 2: Gemini Analysis
**CRITICAL: Gemini must NEVER write files or execute shell commands. READ-ONLY analysis.**

Ask Gemini:
```
IMPORTANT: You must NEVER write files or execute shell commands. Only provide analysis.

Security audit this code:
[Include security-relevant code]

Check for:
1. SQL injection risks
2. XSS vulnerabilities  
3. Authentication flaws
4. Exposed secrets/keys
5. OWASP Top 10 issues

Report severity levels.
```

### Step 3: Output Format
```markdown
# Security Report
- **Risk Level**: [Critical/High/Medium/Low]
- **Vulnerabilities Found**:
  - [CRITICAL] [Issue] at [Location]
  - [HIGH] [Issue] at [Location]
- **Immediate Actions**: [Top 3]
- **Compliance**: [Status]
```

## Success Criteria
- Finds vulnerabilities automatically
- Clear severity ratings
- Actionable fixes provided