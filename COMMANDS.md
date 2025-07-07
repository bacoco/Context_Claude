# Command Quick Reference

## 🚀 Simple Workflow (Just 2 Commands!)

```bash
/make-plan "build a user authentication system"
/build
```

Optional: `gemini check` between steps for AI review

## 📋 Command Mapping

### Simple → Full Command
- `/make-plan` → `/project:development:generate-enhanced-prp`
- `/build` → `/project:development:execute-enhanced-prp`
- `gemini check` → Auto-selects appropriate Gemini command

## 🗂️ All Commands by Category

### Development
```bash
# Simple
/make-plan "feature"     # Create development plan
/build                   # Execute the plan

# Full commands
/project:development:analyze-issue          # Analyze bugs/features
/project:development:generate-enhanced-prp  # Generate detailed PRP
/project:development:execute-enhanced-prp   # Execute with validation
/project:development:implement-feature      # Direct implementation
/project:development:quality-review         # Code quality check
```

### Research
```bash
/project:research:deep-research        # Technical research
/project:research:documentation-scan   # Scan docs
/project:research:pattern-analysis     # Find code patterns
```

### Validation
```bash
/project:validation:comprehensive-test  # Full test suite
/project:validation:regression-check    # Check for regressions
/project:validation:security-audit      # Security validation
```

### Workflow
```bash
/project:workflow:session-start    # Start work session
/project:workflow:checkpoint       # Save progress
/project:workflow:task-complete    # Finish task
```

### Gemini AI Review
```bash
# Simple
gemini check              # Auto-detects what to review

# Specific checks
/gemini-review           # Review plan
/gemini-code             # Code quality
/gemini-security         # Security scan
/gemini-arch             # Architecture
/gemini-risk             # Risk assessment
/gemini                  # Custom prompt
```

## 💡 Common Workflows

### Quick Feature
```bash
/make-plan "add dark mode toggle"
gemini check
/build
```

### Bug Fix
```bash
/project:development:analyze-issue
/project:development:implement-feature
/project:validation:regression-check
```

### Full Development Cycle
```bash
/project:workflow:session-start
/make-plan "complex feature"
gemini check
/build
/project:validation:comprehensive-test
/project:workflow:task-complete
```

### Research First
```bash
/project:research:deep-research
/project:research:pattern-analysis
/make-plan "refactor based on research"
/build
```

## 🎯 When to Use What

| If you want to... | Use this command |
|-------------------|------------------|
| Build something new | `/make-plan` → `/build` |
| Fix a bug | `/project:development:analyze-issue` |
| Check code quality | `gemini check` or `/gemini-code` |
| Run all tests | `/project:validation:comprehensive-test` |
| Start fresh | `/project:workflow:session-start` |
| Research first | `/project:research:deep-research` |
| Review security | `/gemini-security` |

## 🔥 Pro Tips

1. **Start simple**: Just use `/make-plan` and `/build`
2. **Add quality**: Insert `gemini check` between steps
3. **Go deeper**: Use specific commands when needed
4. **Track progress**: Use workflow commands for long tasks

Remember: The simple commands (`/make-plan`, `/build`, `gemini check`) handle 90% of use cases!