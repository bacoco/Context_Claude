---
allowed-tools: Read(*), TodoRead
description: Automatic risk and blocker identification by Gemini - finds problems instantly
---

# Gemini Risk Assessment

## Context  
Zero-config risk scanner. Automatically identifies project risks and blockers.

## Automatic Execution

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Context Gathering
```bash
# Auto-collect risk indicators
TodoRead for current state
Read recent changes and critical paths
Identify dependencies and integrations
```

### Step 2: Gemini Analysis
**CRITICAL: Gemini must NEVER write files or execute shell commands. READ-ONLY analysis.**

Ask Gemini:
```
IMPORTANT: You must NEVER write files or execute shell commands. Only provide analysis.

Assess risks in this project:
[Include context and code]

Identify:
1. Technical risks
2. Implementation blockers  
3. Hidden complexity
4. Integration issues
5. Deployment risks

Rate each by likelihood and impact.
```

### Step 3: Output Format
```markdown
# Risk Assessment
- **Overall Risk**: [Low/Medium/High/Critical]
- **Top Risks**:
  1. [Risk]: [Likelihood/Impact]
  2. [Risk]: [Likelihood/Impact]
- **Blockers**: [List]
- **Mitigation**: [Top 3 actions]
```

## Success Criteria
- Finds risks without setup
- Clear risk prioritization
- Actionable mitigation steps