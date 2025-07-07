---
allowed-tools: Read(*), TodoRead
description: Custom Gemini analysis
---

# `/gemini` - Custom Analysis

Ask Gemini anything specific about your code or plans.

## How it works

1. **Check Gemini** (skip if unavailable)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **You provide the prompt**
```
/gemini
Prompt: [Your specific question]
```

3. **Gemini analyzes** (read-only)

## Examples

```bash
# Check REST compliance
/gemini
Prompt: Is our API RESTful?

# Review database design
/gemini  
Prompt: Analyze our database schema for normalization issues

# Custom security check
/gemini
Prompt: Check authentication flow for OAuth2 compliance
```

## Natural Language
Or just say:
- "gemini, is our API RESTful?"
- "gemini check database design"
- "gemini review auth flow"

## Usage
Type: `/gemini` with your custom prompt