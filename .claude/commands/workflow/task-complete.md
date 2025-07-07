---
allowed-tools: [TodoRead(*), TodoWrite(*), Read(*), Bash(*), LS(*), Grep(*)]
description: Mark task as complete with comprehensive 13-point verification
---

# Task Complete

## Context
This command performs comprehensive task completion verification using a 13-point checklist to ensure all aspects of the task have been properly addressed, tested, and documented.

## Systematic Process

### Step 1: Understand the Problem
- Review the original task description and requirements
- Identify all acceptance criteria and success metrics
- Verify understanding of what "complete" means for this task

### Step 2: Explore and Locate
- Check TodoRead for current task status and related items
- Locate all files modified or created for this task
- Identify test files and documentation that should exist

### Step 3: Reproduce and Validate
- Run reproduction scripts to confirm the issue is resolved
- Execute all test commands to verify functionality
- Validate that the solution meets original requirements

### Step 4: Debug and Diagnose
- Check for any remaining edge cases or issues
- Review error logs and test output for warnings
- Ensure no regression has been introduced

### Step 5: Develop and Implement
- Verify all code follows established patterns
- Ensure proper error handling is in place
- Confirm integration points work correctly

### Step 6: Verify and Test Rigorously
- Run complete test suite with coverage reporting
- Execute integration tests and end-to-end tests
- Validate performance and security requirements

### Step 7: Document and Summarize
- Update TodoWrite to mark task as complete
- Create completion summary with key outcomes
- Document any follow-up tasks discovered

## 13-Point Completion Checklist

### Code Quality
- [ ] All code follows project style guidelines
- [ ] No linting errors (ruff check passes)
- [ ] Type hints are complete and mypy passes

### Testing
- [ ] Unit tests achieve >85% coverage
- [ ] Integration tests pass completely
- [ ] Edge cases are tested and handled
- [ ] Reproduction scripts confirm fix

### Documentation
- [ ] Code has proper docstrings
- [ ] README is updated if needed
- [ ] API documentation is current
- [ ] TASK.md updated with completion

### Performance & Security
- [ ] No performance degradation
- [ ] Security best practices followed
- [ ] No sensitive data exposed

## Quality Gates
- [ ] All 13 checklist items verified
- [ ] No outstanding TODOs in code
- [ ] Peer review comments addressed
- [ ] Ready for production deployment

## Output Specifications
- Completion report in markdown format
- Updated TodoWrite with task marked complete
- List of any follow-up tasks identified
- Summary of changes and impact

## Usage Example
```
/project:enhanced-context:task-complete "Implement user authentication"
```

## Completion Report Template
```markdown
# Task Completion Report

## Task: [Task Name]
**Status**: ✅ Complete
**Date**: [Current Date]

## Summary
[Brief description of what was accomplished]

## Changes Made
- [File 1]: [Description of changes]
- [File 2]: [Description of changes]

## Tests Added
- [Test 1]: [Coverage area]
- [Test 2]: [Coverage area]

## Verification Results
- Unit Tests: ✅ Pass (Coverage: XX%)
- Integration Tests: ✅ Pass
- Linting: ✅ No issues
- Type Checking: ✅ No errors

## Follow-up Tasks
- [ ] [Any new tasks discovered]

## Lessons Learned
[Any insights or patterns discovered]
```