# Problem Resolution Plan (PRP) Template

## Problem Identification
**Issue ID**: [Issue number or identifier]
**Date**: [Current date]
**Severity**: [Critical/High/Medium/Low]
**Component**: [Affected system component]

## Problem Statement
[Clear, concise description of the problem in 2-3 sentences]

## Symptoms
- [ ] [Observable symptom 1]
- [ ] [Observable symptom 2]
- [ ] [Observable symptom 3]

## Initial Analysis
### Known Information
- [Fact 1 about the problem]
- [Fact 2 about the problem]
- [Fact 3 about the problem]

### Unknown Information
- [Question 1 that needs investigation]
- [Question 2 that needs investigation]
- [Question 3 that needs investigation]

## Research Phase
### Information Gathering Plan
1. **Code Analysis**
   - Files to examine: [List specific files]
   - Patterns to search: [List search patterns]
   - Dependencies to check: [List dependencies]

2. **Documentation Review**
   - Relevant docs: [List documentation to review]
   - API references: [List APIs to understand]
   - Examples to study: [List example code]

3. **Historical Context**
   - Related issues: [List similar past issues]
   - Recent changes: [List recent relevant commits]
   - Team knowledge: [List people to consult]

## Reproduction Strategy
### Environment Setup
```bash
# Commands to set up reproduction environment
```

### Reproduction Steps
1. [Step 1 with expected behavior]
2. [Step 2 with expected behavior]
3. [Step 3 showing the bug]

### Validation Criteria
- [ ] Bug reproduced consistently
- [ ] Minimal reproduction case created
- [ ] Edge cases identified

## Root Cause Analysis
### Hypothesis 1: [Title]
**Description**: [Detailed explanation]
**Evidence For**: [Supporting evidence]
**Evidence Against**: [Contradicting evidence]
**Test Method**: [How to verify]

### Hypothesis 2: [Title]
**Description**: [Detailed explanation]
**Evidence For**: [Supporting evidence]
**Evidence Against**: [Contradicting evidence]
**Test Method**: [How to verify]

## Solution Design
### Proposed Solution
[Detailed description of the fix approach]

### Implementation Plan
1. **Phase 1**: [Initial implementation]
   - Files to modify: [List files]
   - Key changes: [List changes]
   - Tests to add: [List tests]

2. **Phase 2**: [Validation and testing]
   - Unit tests: [List unit tests]
   - Integration tests: [List integration tests]
   - Performance tests: [List performance tests]

3. **Phase 3**: [Documentation and cleanup]
   - Docs to update: [List documentation]
   - Comments to add: [List code comments]
   - Cleanup tasks: [List cleanup items]

### Alternative Approaches
1. **Alternative 1**: [Brief description]
   - Pros: [List advantages]
   - Cons: [List disadvantages]

2. **Alternative 2**: [Brief description]
   - Pros: [List advantages]
   - Cons: [List disadvantages]

## Risk Assessment
### Potential Risks
1. **Risk**: [Risk description]
   - **Impact**: [High/Medium/Low]
   - **Mitigation**: [How to prevent/handle]

2. **Risk**: [Risk description]
   - **Impact**: [High/Medium/Low]
   - **Mitigation**: [How to prevent/handle]

### Rollback Plan
[Steps to rollback if issues arise]

## Testing Strategy
### Test Coverage
- [ ] Unit tests for new functionality
- [ ] Integration tests for affected flows
- [ ] Regression tests for existing features
- [ ] Performance tests if applicable
- [ ] Security tests if applicable

### Test Cases
1. **Test Case 1**: [Name]
   - **Input**: [Test input]
   - **Expected**: [Expected output]
   - **Validates**: [What this tests]

2. **Test Case 2**: [Name]
   - **Input**: [Test input]
   - **Expected**: [Expected output]
   - **Validates**: [What this tests]

## Success Criteria
- [ ] Original bug no longer reproducible
- [ ] All tests passing
- [ ] No performance degradation
- [ ] No new bugs introduced
- [ ] Documentation updated
- [ ] Code review approved

## Implementation Checklist
### Pre-Implementation
- [ ] PRP reviewed and approved
- [ ] Development environment ready
- [ ] Backup of affected systems

### During Implementation
- [ ] Follow 7-step methodology
- [ ] Regular commits with clear messages
- [ ] Continuous testing during development

### Post-Implementation
- [ ] All tests passing
- [ ] Documentation complete
- [ ] Peer review conducted
- [ ] Deployment plan ready

## Monitoring Plan
### Post-Deployment Monitoring
- Metrics to track: [List key metrics]
- Alert thresholds: [Define alert conditions]
- Review schedule: [When to review success]

## Lessons Learned
[To be filled after implementation]
- What went well:
- What could be improved:
- Knowledge to share:

---
**Status**: [Planning/In Progress/Complete]
**Last Updated**: [Date and time]
**Author**: [Your name/handle]