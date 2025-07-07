---
allowed-tools: Read(*), TodoRead
description: Quick review of current plan
---

# `/gemini-review` - Instant Plan Review

Get quick feedback on your implementation plan. No setup needed.

## How it works

1. **Check Gemini** (if not available, skip)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **Read current plan**
```bash
TodoRead
```

3. **Ask Gemini**
```
Review this plan and identify:
- Missing pieces
- Potential issues  
- Better approaches
- Risk factors

Be concise and actionable.
```

## Example Output
```
Assessment: Risky
Issues:
- No error handling planned
- Missing authentication
Recommendation: Add auth layer first
```

## Usage
Just type: `/gemini-review` or say "gemini review this plan"