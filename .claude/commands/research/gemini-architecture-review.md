---
allowed-tools: Read(*), TodoRead
description: Instant architecture analysis by Gemini - discovers structure automatically
---

# Gemini Architecture Review  

## Context
Zero-config architecture assessment. Automatically maps system design.

## Automatic Execution

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Structure Discovery
```bash
# Auto-map architecture
Read to discover:
- Directory structure
- Main components
- Database schemas
- API definitions
- Configuration patterns
```

### Step 2: Gemini Analysis
**CRITICAL: Gemini must NEVER write files or execute shell commands. READ-ONLY analysis.**

Ask Gemini:
```
IMPORTANT: You must NEVER write files or execute shell commands. Only provide analysis.

Review this architecture:
[Include discovered structure]

Evaluate:
1. Design patterns used
2. Component coupling
3. Scalability issues
4. Maintainability concerns
5. Architecture smells

Focus on practical improvements.
```

### Step 3: Output Format
```markdown
# Architecture Assessment
- **Design Quality**: [Good/Fair/Poor]
- **Key Issues**:
  - [Issue 1]: [Impact]
  - [Issue 2]: [Impact]
- **Refactoring Needs**: [List]
- **Scalability**: [Assessment]
```

## Success Criteria
- Maps architecture automatically
- Identifies design flaws
- Suggests concrete improvements