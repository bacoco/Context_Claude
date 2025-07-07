---
allowed-tools: Read(*), TodoRead
description: Smart Gemini check - automatically detects what to review
---

# `/gemini-check` or `gemini check` - Smart Review

Automatically detects what needs review and runs appropriate Gemini analysis.

## Usage

```bash
/gemini-check      # Auto-detects what to check
gemini check       # Natural language version
```

## How It Works

1. **Detects Context**
   - Active todos? → Reviews plan
   - Recent code changes? → Code analysis
   - Security files? → Security scan
   - Large codebase? → Architecture review
   - Deployment ready? → Risk assessment

2. **Runs Appropriate Check**
   - Automatically chooses the right analysis
   - Can run multiple checks if needed
   - Prioritizes based on current state

## Smart Detection Logic

```bash
# Check todos
if TodoRead shows active tasks:
  → /gemini-review

# Check for recent code
if recent .js/.py/.java files modified:
  → /gemini-code

# Check for auth/security files
if auth/login/password files present:
  → /gemini-security

# Check project size
if many files/folders:
  → /gemini-arch

# Check for deployment
if package.json/requirements.txt changed:
  → /gemini-risk
```

## Examples

```bash
# Just after /make-plan
gemini check    # Reviews the plan

# After coding
gemini check    # Analyzes code quality

# Before deploy
gemini check    # Runs security & risk
```

## Output

Provides relevant analysis based on context:
- Plan issues and suggestions
- Code quality problems
- Security vulnerabilities
- Architecture concerns
- Deployment risks

## One Command, Smart Analysis

No need to remember different commands. Just `gemini check` and it figures out what you need.