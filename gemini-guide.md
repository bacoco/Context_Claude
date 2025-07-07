# Gemini - Simple AI Review Guide

Get quick feedback on your code and plans. No complex setup needed.

## Quick Start

```bash
# Just one command:
gemini check      # Auto-detects what to review

# Or use /command syntax:
/gemini-check     # Same thing
```

That's it! Gemini automatically figures out what needs checking.

## What Each Command Does

### `/gemini-review` 
Reviews your current plan and suggests improvements.
```
You: /gemini-review
Gemini: "Your auth plan is missing refresh tokens and rate limiting..."
```

### `/gemini-code`
Checks code quality and finds issues.
```
You: /gemini-code
Gemini: "Found duplicate code in 3 files, suggest extracting to utility..."
```

### `/gemini-security`
Scans for security vulnerabilities.
```
You: /gemini-security
Gemini: "CRITICAL: Password logged in plain text at line 45..."
```

### `/gemini-arch`
Reviews system architecture and design.
```
You: /gemini-arch  
Gemini: "Database directly accessed in controllers, consider repository pattern..."
```

### `/gemini-risk`
Identifies risks and blockers.
```
You: /gemini-risk
Gemini: "High risk: No database migration rollback plan..."
```

## Real Examples

### Example 1: Before Starting Work
```
Claude: I'm going to implement user authentication with JWT
You: /gemini-review

Gemini: Issues with your plan:
- Missing refresh token strategy
- No rate limiting mentioned
- Consider OAuth2 as alternative
```

### Example 2: After Writing Code
```
You: /gemini-code

Gemini: Code issues found:
- UserService is doing too much (15+ methods)
- No error handling in database calls
- Duplicate validation logic in 3 places
```

### Example 3: Before Deploy
```
You: /gemini-security

Gemini: Security scan results:
- CRITICAL: JWT secret hardcoded
- HIGH: No CSRF protection
- MEDIUM: Missing security headers
```

## Natural Language Works Too

Instead of commands, just ask:
- "gemini, review my authentication plan"
- "gemini, check this code for issues"
- "gemini, any security problems?"

## If Gemini Isn't Available

No problem! Just skip these steps. Everything still works fine without Gemini.

```bash
# Check if Gemini works:
gemini --version

# If not found, just continue coding!
```

## Tips

1. **Use early and often** - Catch issues before they grow
2. **Be specific** - "gemini review the auth system" 
3. **Don't block on it** - If Gemini is slow/unavailable, keep going

## Custom Analysis

Need something specific? Use `/gemini` with a custom prompt:

```
/gemini
Prompt: Check if our API follows REST principles

# Or just:
gemini check if our API is RESTful
```

---

That's it! Simple commands for better code. No complex paths or configuration needed.