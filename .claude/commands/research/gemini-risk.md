---
allowed-tools: Read(*), TodoRead
description: Quick risk assessment
---

# `/gemini-risk` - Risk Check

Find project risks and blockers. Zero config.

## How it works

1. **Check Gemini** (skip if unavailable)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **Gather context**
- Current todos
- Recent changes
- Dependencies
- Critical paths

3. **Ask Gemini**
```
Identify risks:
- Technical risks
- Blockers
- Hidden complexity
- Deployment issues

Rate: likelihood/impact
```

## Example Output
```
Risk: HIGH
Top risks:
1. No rollback plan - High/Critical
2. Untested migrations - High/High
3. Memory leak in websockets - Medium/High
Blockers:
- Missing prod env vars
Mitigate:
1. Test migrations on staging
2. Create rollback procedure
3. Fix memory leak
```

## Usage
Type: `/gemini-risk` or say "gemini check risks"