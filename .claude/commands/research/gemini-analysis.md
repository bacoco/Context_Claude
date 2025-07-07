---
allowed-tools: Read(*), TodoRead
description: Gemini AI analysis for Claude plans and code review with strict read-only access
---

# Gemini Analysis Command

## Context
This command enables Gemini AI to analyze Claude's plans and perform code reviews while maintaining strict read-only access. Gemini is restricted from writing code or executing shell commands, focusing solely on analysis, critique, and recommendations.

## Command Syntax Examples
```bash
# Analyze Claude's current plan
gemini --prompt "Analyze Claude's plan for implementing user authentication"

# Request specific critique
gemini --prompt "What are potential security issues with this approach?"

# Global code analysis
gemini --code-review "Analyze the overall architecture and suggest improvements"

# Pattern analysis
gemini --prompt "Identify design patterns and anti-patterns in the codebase"
```

## Gemini Analysis Process

### Step 0: Check Gemini Availability
```bash
# If Gemini is not available, skip this verification
gemini --version || { echo "Gemini not installed - skipping verification"; exit 0; }
```

### Step 1: Save Claude's Current State
**Capture Current Plan and Progress**
- Use TodoRead to capture all current todos and their status
- Document the current implementation plan
- Save any relevant context or decisions made
- Create a comprehensive snapshot of Claude's work

**Plan Documentation Format**
```markdown
# Claude's Implementation Plan
## Date: [YYYY-MM-DD HH:MM]
## Task: [Current task description]

### Todo List Status
[Current todos with status and priorities]

### Implementation Approach
[Detailed description of Claude's planned approach]

### Key Decisions
[Important technical decisions made]

### Progress Summary
[What has been completed vs pending]
```

### Step 2: Prepare Analysis Context
**Gather Relevant Code Context**
- Identify files related to the current task
- Read relevant code sections for context
- Collect architecture documentation
- Gather any existing technical specifications

**Context Categories**
1. **Architecture Context**: Overall system design and structure
2. **Implementation Context**: Specific code being worked on
3. **Standards Context**: Coding standards and best practices
4. **Requirements Context**: Business and technical requirements

### Step 3: Formulate Gemini Query
**Query Types and Templates**

**Plan Analysis Template**
```
Given Claude's plan to [task description]:
[Include saved plan details]

Please analyze this approach considering:
1. Technical feasibility and complexity
2. Potential risks or pitfalls
3. Alternative approaches
4. Best practices alignment
5. Scalability and maintainability
```

**Code Review Template**
```
Review the following codebase/implementation:
[Include relevant code context]

Focus on:
1. Architecture patterns and design decisions
2. Code quality and maintainability
3. Performance considerations
4. Security vulnerabilities
5. Testing strategy adequacy
```

**Risk Assessment Template**
```
Assess the following implementation approach:
[Include plan and code context]

Identify:
1. Technical risks and mitigation strategies
2. Potential edge cases not considered
3. Integration challenges
4. Long-term maintenance concerns
5. Security implications
```

### Step 4: Execute Gemini Analysis
**Analysis Execution Guidelines**
- Present clear, focused questions to Gemini
- Provide sufficient context without overwhelming
- Request specific, actionable feedback
- Focus on analysis, not implementation

**Analysis Focus Areas**
1. **Architecture Review**
   - Design pattern appropriateness
   - Component coupling and cohesion
   - Scalability considerations
   - Technology stack alignment

2. **Code Quality Analysis**
   - Readability and maintainability
   - Complexity assessment
   - Performance implications
   - Testing coverage adequacy

3. **Security Review**
   - Vulnerability identification
   - Best practice compliance
   - Data protection measures
   - Authentication/authorization adequacy

4. **Best Practices Alignment**
   - Industry standard compliance
   - Framework-specific conventions
   - Documentation completeness
   - Error handling strategies

### Step 5: Process Gemini Feedback
**Feedback Categories**
1. **Critical Issues**: Must be addressed immediately
2. **Important Recommendations**: Should be incorporated
3. **Nice-to-Have Suggestions**: Consider for future iterations
4. **Alternative Approaches**: Different ways to solve the problem
5. **Learning Opportunities**: Educational insights for improvement

**Feedback Integration Process**
- Categorize feedback by priority
- Identify actionable items
- Create follow-up tasks if needed
- Document decisions on feedback adoption
- Update implementation plan accordingly

### Step 6: Generate Analysis Report
**Analysis Report Structure**
```markdown
# Gemini Analysis Report
## Analysis Date: [Date and Time]
## Subject: [What was analyzed]
## Analysis Type: [Plan Review/Code Review/Risk Assessment]

### Executive Summary
- **Overall Assessment**: [High-level evaluation]
- **Key Findings**: [3-5 most important points]
- **Risk Level**: [Low/Medium/High]
- **Recommendation**: [Proceed/Revise/Reconsider]

### Detailed Analysis

#### Strengths Identified
1. [Positive aspect 1]
2. [Positive aspect 2]
3. [Positive aspect 3]

#### Areas of Concern
1. **[Concern 1]**
   - Issue: [Description]
   - Impact: [Potential consequences]
   - Recommendation: [How to address]

2. **[Concern 2]**
   - Issue: [Description]
   - Impact: [Potential consequences]
   - Recommendation: [How to address]

#### Alternative Approaches
1. **[Alternative 1]**
   - Description: [Alternative approach]
   - Pros: [Advantages]
   - Cons: [Disadvantages]
   - When to use: [Circumstances]

#### Best Practices Alignment
- **Followed**: [Best practices being followed]
- **Missing**: [Best practices not followed]
- **Recommendations**: [How to improve alignment]

### Security Considerations
- **Identified Risks**: [Security concerns found]
- **Mitigation Strategies**: [How to address risks]
- **Compliance Notes**: [Regulatory/standard compliance]

### Performance Implications
- **Current Approach**: [Performance characteristics]
- **Optimization Opportunities**: [How to improve]
- **Scalability Assessment**: [Long-term viability]

### Actionable Recommendations
1. **Immediate Actions**
   - [ ] [Action item 1]
   - [ ] [Action item 2]

2. **Short-term Improvements**
   - [ ] [Improvement 1]
   - [ ] [Improvement 2]

3. **Long-term Considerations**
   - [ ] [Consideration 1]
   - [ ] [Consideration 2]

### Conclusion
[Summary of analysis with clear next steps]
```

## Usage Patterns

### Pattern 1: Pre-Implementation Review
Use before starting major features:
```bash
# Save current plan
gemini --prompt "Review Claude's plan for implementing OAuth2 authentication. Identify potential security risks and suggest improvements."
```

### Pattern 2: Mid-Development Checkpoint
During development for course correction:
```bash
# Analyze current progress
gemini --prompt "Analyze the partial implementation of the payment system. Are there any architectural concerns with the current approach?"
```

### Pattern 3: Post-Implementation Audit
After completion for quality assurance:
```bash
# Comprehensive review
gemini --code-review "Review the completed user management module for security vulnerabilities, performance issues, and maintainability concerns."
```

### Pattern 4: Architecture Decision Review
For major architectural decisions:
```bash
# Architecture analysis
gemini --prompt "Evaluate the decision to use microservices for this application. Consider the team size, project scope, and maintenance requirements."
```

## Restrictions and Guidelines

### Gemini Restrictions
- **NO Code Writing**: Gemini must not generate implementation code
- **NO Shell Commands**: Gemini must not execute or suggest specific shell commands
- **NO File Modifications**: Gemini has read-only access
- **NO Direct Implementation**: Focus on analysis and recommendations only

### Analysis Guidelines
- **Be Specific**: Provide concrete examples and clear reasoning
- **Be Constructive**: Offer alternatives, not just criticism
- **Be Practical**: Consider real-world constraints and trade-offs
- **Be Thorough**: Cover all relevant aspects of the analysis

## Quality Checklist

### Pre-Analysis
- [ ] Claude's current plan saved and documented
- [ ] Relevant code context gathered
- [ ] Clear analysis objectives defined
- [ ] Appropriate Gemini prompt crafted

### During Analysis
- [ ] Gemini staying within read-only bounds
- [ ] Feedback is specific and actionable
- [ ] Analysis covers all requested areas
- [ ] Alternative approaches considered

### Post-Analysis
- [ ] Analysis report properly formatted
- [ ] Actionable items clearly identified
- [ ] Feedback prioritized appropriately
- [ ] Next steps documented

## Output Requirements

### File Locations
- Save analysis reports as `analysis/gemini-[type]-YYYY-MM-DD-HH-MM.md`
- Store Claude's plans as `analysis/claude-plan-YYYY-MM-DD-HH-MM.md`
- Keep feedback logs in `analysis/feedback-log.md`

### Integration with Claude Workflow
- Analysis results should inform Claude's next steps
- Critical issues should update todo priorities
- Approved approaches should be documented
- Lessons learned should be captured for future reference

## Success Criteria
- **Valuable Insights**: Analysis provides actionable improvements
- **Risk Mitigation**: Potential issues identified before implementation
- **Quality Improvement**: Code quality enhanced through feedback
- **Efficiency Gain**: Better approaches identified saving time/resources
- **Knowledge Transfer**: Team learns from analysis insights

Use this command to leverage Gemini's analytical capabilities while maintaining strict control over code modifications and system changes.