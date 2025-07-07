---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Structured issue analysis using systematic 7-step methodology
---

# Structured Issue Analysis

## Context
This command implements comprehensive issue analysis following the proven 7-step software engineering methodology. Use this command to systematically understand bugs, feature requests, and technical problems before implementation.

## Issue Analysis Process

### Step 1: Understand the Problem
**Comprehensive Problem Analysis**
- Read the issue description multiple times to fully grasp the problem
- Identify all stakeholders and their requirements
- Define the scope and boundaries of the issue
- List all assumptions and constraints
- Create a problem statement in your own words

**Sequential Thinking Protocol**
- Use 10-15 thoughts to analyze the problem comprehensively
- Question initial assumptions and explore alternative interpretations
- Consider edge cases and potential complications
- Document all uncertainties for further investigation

### Step 2: Explore and Locate
**Systematic Repository Exploration**
- Use `find` and `grep` commands to locate relevant files
- Identify all source code files related to the issue
- Find existing tests that might be affected
- Locate documentation and configuration files
- Map out the component architecture

**Pattern Recognition**
- Identify similar issues in the codebase
- Look for existing solutions or workarounds
- Find related feature implementations
- Document coding patterns and conventions

### Step 3: Reproduce and Validate
**Baseline Establishment (CRITICAL)**
- Create a reproduction script that demonstrates the issue
- Establish current behavior with clear examples
- Document the exact steps to reproduce
- Capture error messages and stack traces
- Test reproduction across different environments

**Validation Criteria**
- Confirm the issue exists as described
- Verify the impact and severity assessment
- Test related functionality for side effects
- Document any discrepancies from the reported behavior

### Step 4: Debug and Diagnose
**Root Cause Analysis**
- Trace the execution flow to identify the problem source
- Use debugging tools and logging to understand the issue
- Create debugging scripts with strategic instrumentation
- Analyze system state and variable values at key points
- Identify the exact line or component causing the issue

**Impact Assessment**
- Determine what functionality is affected
- Assess the severity and urgency of the issue
- Identify potential security implications
- Consider performance and scalability impacts

### Step 5: Develop Analysis Summary
**Solution Strategy Development**
- Outline 2-3 potential solution approaches
- Evaluate the pros and cons of each approach
- Consider implementation complexity and risks
- Estimate effort and timeline for each option
- Recommend the best solution approach

**Risk Assessment**
- Identify potential risks and mitigation strategies
- Consider backward compatibility implications
- Assess testing requirements and coverage needs
- Document any architectural changes required

### Step 6: Verification Planning
**Test Strategy Definition**
- Define comprehensive testing approach
- Identify all test cases needed to validate the fix
- Plan regression testing to prevent new issues
- Consider integration testing requirements
- Document acceptance criteria

**Quality Assurance Planning**
- Define code review requirements
- Plan security assessment if applicable
- Consider performance testing needs
- Document compliance requirements

### Step 7: Documentation and Handoff
**Analysis Documentation**
- Create detailed analysis report
- Document all findings and recommendations
- Provide clear implementation guidance
- Include troubleshooting information
- Update relevant project documentation

**Knowledge Transfer**
- Share findings with relevant team members
- Update issue tracking with analysis results
- Create or update troubleshooting guides
- Document lessons learned for future reference

## Output Requirements

### Analysis Report Structure
```markdown
# Issue Analysis Report

## Issue Summary
- **Issue ID**: [ID]
- **Title**: [Title]
- **Priority**: [High/Medium/Low]
- **Severity**: [Critical/Major/Minor]

## Problem Statement
[Clear, concise problem description]

## Root Cause Analysis
[Detailed explanation of the underlying cause]

## Affected Components
- [List of affected files/modules]
- [Impact assessment for each component]

## Reproduction Steps
1. [Step-by-step reproduction guide]
2. [Expected vs actual behavior]
3. [Error messages and logs]

## Solution Approaches
### Option 1: [Approach Name]
- **Description**: [Details]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]
- **Effort**: [Estimate]

### Option 2: [Approach Name]
- **Description**: [Details]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]
- **Effort**: [Estimate]

## Recommended Solution
[Detailed recommendation with justification]

## Implementation Plan
- [ ] Phase 1: [Tasks]
- [ ] Phase 2: [Tasks]
- [ ] Phase 3: [Tasks]

## Testing Strategy
- [ ] Unit tests required
- [ ] Integration tests needed
- [ ] Regression tests planned
- [ ] Performance tests considered

## Risks and Mitigation
- **Risk 1**: [Description] → [Mitigation]
- **Risk 2**: [Description] → [Mitigation]

## Dependencies
- [External dependencies]
- [Internal dependencies]
- [Team dependencies]

## Acceptance Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Next Steps
1. [Immediate actions]
2. [Follow-up tasks]
3. [Long-term considerations]
```

### File Locations
- Save analysis report as `analysis-YYYY-MM-DD-{issue-id}.md`
- Save reproduction script as `reproduce-{issue-id}.py` or `.sh`
- Update `TASK.md` with analysis completion
- Create GitHub issue comment with summary

## Validation Checklist
- [ ] Problem statement is clear and complete
- [ ] Root cause has been identified and verified
- [ ] Reproduction script works reliably
- [ ] Solution approaches are well-researched
- [ ] Implementation plan is realistic
- [ ] Testing strategy is comprehensive
- [ ] Risks have been identified and mitigated
- [ ] Documentation is complete and accurate
- [ ] Stakeholders have been informed
- [ ] Ready for implementation phase

## Success Metrics
- **Completeness**: All aspects of the issue are understood
- **Accuracy**: Root cause correctly identified
- **Reproducibility**: Issue can be reliably reproduced
- **Clarity**: Analysis is clear and actionable
- **Feasibility**: Solution approaches are realistic

Use this command to ensure thorough understanding before any implementation work begins.