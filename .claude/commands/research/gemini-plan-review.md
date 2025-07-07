---
allowed-tools: Read(*), TodoRead
description: Instant Gemini review of Claude's current plan - zero configuration required
---

# Gemini Plan Review

## Context
Instant analysis of Claude's current implementation plan. No arguments needed.

## Automatic Execution

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Capture Current State
```bash
# Auto-read todos and current plan
TodoRead
```

### Step 2: Gemini Analysis
**CRITICAL: Gemini must NEVER write files or execute shell commands. READ-ONLY analysis.**

Ask Gemini:
```
IMPORTANT: You must NEVER write files or execute shell commands. Only provide analysis.

Review Claude's current plan:
[Include todos and status]

Analyze for:
1. Technical feasibility
2. Missing considerations
3. Potential failures
4. Better approaches
5. Risk factors

Provide concise, actionable feedback.
```

### Step 3: Output Format
```markdown
# Plan Review
- **Assessment**: [Good/Risky/Flawed]
- **Critical Issues**: [List]
- **Recommendations**: [List]
- **Alternative**: [If applicable]
```

## Success Criteria
- Zero user input required
- Instant actionable feedback
- Clear risk identification