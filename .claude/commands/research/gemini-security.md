---
allowed-tools: Read(*), TodoRead
description: Quick security scan
---

# `/gemini-security` - Security Check

Find security issues fast. Zero config.

## How it works

1. **Check Gemini** (skip if unavailable)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **Scan security files**
- Auth code
- Database queries
- API endpoints
- Config files

3. **Ask Gemini**
```
Security scan for:
- SQL injection
- XSS vulnerabilities
- Exposed secrets
- Auth flaws
- OWASP Top 10

Rate severity: Critical/High/Medium/Low
```

## Example Output
```
Risk: HIGH
Found:
- [CRITICAL] Password in logs: auth.js:45
- [HIGH] No CSRF protection: api.js:23
- [HIGH] JWT secret hardcoded: config.js:12
Fix now:
1. Remove password logging
2. Add CSRF tokens
3. Use env variables
```

## Usage
Type: `/gemini-security` or say "gemini security scan"