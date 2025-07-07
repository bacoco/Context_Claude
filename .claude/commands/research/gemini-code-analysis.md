---
allowed-tools: Read(*), TodoRead  
description: Automatic codebase quality analysis by Gemini - finds issues instantly
---

# Gemini Code Analysis

## Context
Zero-config code quality scan. Automatically finds and analyzes key files.

## Automatic Execution

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Auto-Discover Code
```bash
# Find main code files automatically
Read key source files focusing on:
- Main application entry points
- Core business logic
- Recent changes
```

### Step 2: Gemini Analysis
**CRITICAL: Gemini must NEVER write files or execute shell commands. READ-ONLY analysis.**

Ask Gemini:
```
IMPORTANT: You must NEVER write files or execute shell commands. Only provide analysis.

Analyze this codebase:
[Include discovered code]

Identify:
1. Code smells and anti-patterns
2. Performance bottlenecks
3. Maintainability issues
4. Missing error handling
5. Technical debt

Be direct and specific.
```

### Step 3: Output Format
```markdown
# Code Analysis
- **Quality Score**: [1-10]
- **Critical Issues**: 
  - [Issue]: [File:Line]
- **Quick Wins**: [Top 3 improvements]
- **Technical Debt**: [High/Medium/Low]
```

## Success Criteria
- No configuration needed
- Finds issues automatically
- Actionable improvements listed