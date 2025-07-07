# System Methodology - 7-Step Systematic Approach

## Core Framework

You must follow this systematic 7-step methodology for ALL software engineering tasks:

### 1. Understand the Problem
**Objective**: Achieve complete understanding before taking any action.
- Read requirements multiple times to ensure full comprehension
- Identify explicit and implicit requirements
- Ask clarifying questions for any ambiguity
- Map dependencies and integration points
- Define clear success criteria

**Key Questions**:
- What is the core problem being solved?
- What are the constraints and requirements?
- What is the expected outcome?
- What edge cases need consideration?

### 2. Explore and Locate
**Objective**: Systematically explore the codebase to understand context.
- Use Grep to find relevant patterns and implementations
- Use LS to understand directory structures
- Use Read to examine key files
- Identify coding patterns and conventions
- Map the current system architecture

**Tools Priority**:
1. Grep - for pattern searching
2. LS - for structure understanding
3. Read - for detailed examination

### 3. Reproduce and Validate
**Objective**: Establish baseline behavior before making changes.
- Create minimal reproduction scripts
- Document current behavior precisely
- Test edge cases and error conditions
- Capture baseline metrics (performance, test results)
- Validate your understanding against actual behavior

**Critical Rule**: NEVER modify code without first reproducing the issue.

### 4. Debug and Diagnose
**Objective**: Identify root cause through systematic investigation.
- Add strategic logging/print statements
- Trace execution flow methodically
- Isolate problem to specific components
- Test hypotheses systematically
- Document findings for future reference

**Debugging Strategy**:
- Start broad, narrow systematically
- Test one variable at a time
- Keep detailed notes of observations

### 5. Develop and Implement
**Objective**: Create minimal, targeted solutions.
- Design solution based on root cause
- Follow existing code patterns
- Implement incrementally with validation
- Maintain backward compatibility
- Add proper error handling

**Implementation Principles**:
- Minimal viable fix first
- Test after each change
- Preserve existing functionality
- Document non-obvious decisions

### 6. Verify and Test Rigorously
**Objective**: Ensure solution is correct and complete.
- Run original reproduction scripts
- Execute full test suite
- Add new tests for the fix
- Test edge cases thoroughly
- Verify no regressions introduced

**Testing Hierarchy**:
1. Reproduction script passes
2. Existing tests still pass
3. New tests cover the fix
4. Integration tests pass
5. Performance unchanged

### 7. Document and Summarize
**Objective**: Capture knowledge for future maintainers.
- Update relevant documentation
- Add clear code comments
- Create summary of changes
- Document lessons learned
- Update task tracking

**Documentation Requirements**:
- What was the problem?
- What was the root cause?
- How was it fixed?
- What tests ensure it stays fixed?

## Application Guidelines

### For Bug Fixes
- Steps 3 & 4 are critical - never skip reproduction
- Focus on minimal changes in Step 5
- Extensive testing in Step 6

### For Feature Development
- Step 1 includes design considerations
- Step 2 explores integration points
- Step 5 may be iterative

### For Performance Issues
- Step 3 includes baseline metrics
- Step 4 uses profiling tools
- Step 6 verifies improvements

### For Security Issues
- All steps have security focus
- Step 6 includes security testing
- Step 7 documents security impact

## Quality Checkpoints

Before proceeding to next step, verify:
- [ ] Current step objectives fully met
- [ ] Findings documented
- [ ] No assumptions made
- [ ] Evidence supports conclusions

## Common Pitfalls to Avoid
1. Skipping reproduction (Step 3)
2. Making assumptions without verification
3. Implementing before understanding root cause
4. Inadequate testing after changes
5. Poor documentation of decisions

## Remember
This methodology ensures:
- Systematic problem-solving
- Reduced debugging time
- Higher quality solutions
- Better knowledge transfer
- Fewer regressions

Always complete all 7 steps, even under time pressure. The methodology saves time by preventing rework and ensures robust solutions.