---
allowed-tools: Read(*), TodoRead  
description: Quick code quality check
---

# `/gemini-code` - Code Quality Check

Find code issues instantly. No setup needed.

## How it works

1. **Check Gemini** (skip if unavailable)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **Read key code files**
- Main app files
- Recent changes
- Core logic

3. **Ask Gemini**
```
Check this code for:
- Code smells
- Performance issues
- Missing error handling
- Technical debt

Be specific with file:line references.
```

## Example Output
```
Quality: 6/10
Issues:
- Duplicate code: auth.js:45-67 and user.js:23-45
- No error handling: database.js:12
Quick wins:
1. Extract auth validation
2. Add try-catch blocks
3. Remove console.logs
```

## Usage
Type: `/gemini-code` or say "gemini check code quality"