---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Systematic documentation analysis and knowledge extraction with comprehensive coverage assessment
---

# Documentation Scan and Analysis

## Context
This streamlined command enables systematic documentation analysis and extraction with comprehensive coverage assessment. Use this command to quickly analyze project documentation, extract key information, and identify knowledge gaps.

## Documentation Analysis Process

### Step 1: Documentation Discovery and Inventory
**Comprehensive Documentation Discovery**
```bash
# Find all documentation files
find . -type f \( -name "*.md" -o -name "*.rst" -o -name "*.txt" -o -name "*.adoc" \) ! -path "./.git/*" | sort

# Analyze documentation structure
tree -I '.git|node_modules|__pycache__|*.pyc' -a

# Check for README files at all levels
find . -name "README*" -o -name "readme*" | sort

# Identify configuration documentation
find . -name "*.json" -o -name "*.yaml" -o -name "*.yml" -o -name "*.toml" -o -name "*.ini" | head -20
```

**Documentation Categorization**
- Technical documentation (APIs, architecture)
- User documentation (guides, tutorials)
- Development documentation (setup, contributing)
- Configuration documentation (deployment, settings)
- Legal and compliance documentation

### Step 2: Content Analysis and Information Extraction
**Technical Documentation Assessment**
```bash
# Search for API documentation
grep -r -l "API\|endpoint\|swagger\|openapi" --include="*.md" .

# Find architecture documentation
grep -r -l "architecture\|design\|component\|system" --include="*.md" .

# Locate setup and installation guides
grep -r -l "install\|setup\|getting started\|quickstart" --include="*.md" .

# Check for troubleshooting information
grep -r -l "troubleshoot\|debug\|error\|issue\|problem" --include="*.md" .
```

**Content Quality Assessment**
- Evaluate documentation completeness and accuracy
- Check for outdated information and broken links
- Assess clarity and readability
- Identify missing sections and gaps
- Document maintenance and update needs

### Step 3: Knowledge Gap Identification
**Gap Analysis Process**
- Compare documentation against actual codebase
- Identify undocumented features and APIs
- Find missing configuration examples
- Locate areas needing better explanation
- Document user experience pain points

**Documentation Coverage Analysis**
```bash
# Check code documentation coverage
find . -name "*.py" | xargs grep -l "def \|class " | wc -l
find . -name "*.py" | xargs grep -l '"""' | wc -l

# Analyze comment density
find . -name "*.py" -exec grep -c "#" {} \; | awk '{sum+=$1} END {print "Total comments: " sum}'

# Check for docstring coverage
python -c "import pydoc; help(modules)" 2>/dev/null | grep -c "package"
```

### Step 4: Information Synthesis and Organization
**Knowledge Extraction**
- Extract key concepts and terminology
- Identify system components and relationships
- Document workflows and processes
- Catalog configuration options and settings
- Compile troubleshooting procedures

**Information Organization**
- Create structured knowledge map
- Organize information by topic and audience
- Prioritize documentation by importance
- Identify quick wins for improvement
- Plan comprehensive documentation strategy

### Step 5: Documentation Quality Assessment
**Quality Metrics Evaluation**
- Assess documentation freshness and accuracy
- Evaluate user-friendliness and accessibility
- Check for consistency across documents
- Validate examples and code snippets
- Test instructions and procedures

**Improvement Recommendations**
- Identify high-priority documentation needs
- Recommend structure and organization improvements
- Suggest content updates and additions
- Plan user experience enhancements
- Create maintenance and update schedule

### Step 6: Actionable Insights Generation
**Strategic Recommendations**
- Prioritize documentation improvements by impact
- Create roadmap for documentation enhancement
- Identify resources needed for improvements
- Plan integration with development workflow
- Establish documentation maintenance processes

**Implementation Planning**
- Create specific action items for improvements
- Assign ownership and timelines
- Define success metrics and validation criteria
- Plan user feedback collection
- Establish regular review and update cycles

### Step 7: Documentation Audit Report
**Comprehensive Documentation Assessment**
- Compile findings into structured report
- Provide executive summary and recommendations
- Document methodology and scope
- Create prioritized improvement plan
- Establish ongoing maintenance strategy

## Documentation Scan Report Structure

### Executive Summary
```markdown
# Documentation Scan Report

## Executive Summary
- **Scan Date**: [Date]
- **Scope**: [Documentation scope and coverage]
- **Overall Assessment**: [High-level quality assessment]
- **Priority Recommendations**: [Top 3-5 recommendations]
- **Estimated Effort**: [Resource requirements for improvements]

## Documentation Inventory
### Total Documentation Files: [Count]
- **Markdown files**: [Count]
- **README files**: [Count]
- **API documentation**: [Count]
- **Configuration files**: [Count]
- **Other formats**: [Count]

## Quality Assessment Score: [Score]/100
- **Completeness**: [Score]/25
- **Accuracy**: [Score]/25
- **Clarity**: [Score]/25
- **Maintainability**: [Score]/25
```

### Detailed Analysis
```markdown
## Documentation Categories

### Technical Documentation
#### API Documentation
- **Status**: [Complete/Partial/Missing]
- **Quality**: [High/Medium/Low]
- **Coverage**: [Percentage of APIs documented]
- **Issues**: [Key issues identified]
- **Recommendations**: [Specific improvements needed]

#### Architecture Documentation
- **Status**: [Complete/Partial/Missing]
- **Quality**: [High/Medium/Low]
- **Currency**: [Up-to-date/Outdated]
- **Clarity**: [Clear/Confusing]
- **Recommendations**: [Specific improvements needed]

#### Setup and Installation
- **Status**: [Complete/Partial/Missing]
- **Accuracy**: [Verified/Needs Testing]
- **Completeness**: [All platforms covered]
- **User-friendliness**: [Easy/Difficult to follow]
- **Recommendations**: [Specific improvements needed]

### User Documentation
#### User Guides
- **Status**: [Complete/Partial/Missing]
- **Target Audience**: [Clearly defined/Unclear]
- **Examples**: [Comprehensive/Limited/Missing]
- **Tutorials**: [Available/Needed]
- **Recommendations**: [Specific improvements needed]

#### Troubleshooting Documentation
- **Status**: [Complete/Partial/Missing]
- **Common Issues**: [Well covered/Gaps identified]
- **Solutions**: [Clear/Confusing]
- **Search-ability**: [Easy to find/Difficult]
- **Recommendations**: [Specific improvements needed]

### Development Documentation
#### Contributing Guidelines
- **Status**: [Complete/Partial/Missing]
- **Code Standards**: [Documented/Unclear]
- **Review Process**: [Defined/Ad-hoc]
- **Testing Guidelines**: [Complete/Incomplete]
- **Recommendations**: [Specific improvements needed]

#### Development Setup
- **Status**: [Complete/Partial/Missing]
- **Dependencies**: [Clearly listed/Incomplete]
- **Environment Setup**: [Automated/Manual]
- **Testing Instructions**: [Clear/Confusing]
- **Recommendations**: [Specific improvements needed]

## Gap Analysis

### Critical Gaps
1. **Gap 1**: [Description of critical missing documentation]
   - **Impact**: [High/Medium/Low]
   - **Effort to Address**: [High/Medium/Low]
   - **Priority**: [High/Medium/Low]

2. **Gap 2**: [Description]
   - **Impact**: [High/Medium/Low]
   - **Effort to Address**: [High/Medium/Low]
   - **Priority**: [High/Medium/Low]

### Major Improvements Needed
1. **Improvement 1**: [Description]
   - **Current State**: [Description]
   - **Desired State**: [Description]
   - **Benefits**: [Expected benefits]

2. **Improvement 2**: [Description]
   - **Current State**: [Description]
   - **Desired State**: [Description]
   - **Benefits**: [Expected benefits]

### Quick Wins
1. **Quick Win 1**: [Low-effort, high-impact improvement]
2. **Quick Win 2**: [Low-effort, high-impact improvement]
3. **Quick Win 3**: [Low-effort, high-impact improvement]

## Recommendations

### Immediate Actions (0-30 days)
- [ ] [Action 1]: [Description and rationale]
- [ ] [Action 2]: [Description and rationale]
- [ ] [Action 3]: [Description and rationale]

### Short-term Improvements (1-3 months)
- [ ] [Improvement 1]: [Description and expected impact]
- [ ] [Improvement 2]: [Description and expected impact]
- [ ] [Improvement 3]: [Description and expected impact]

### Long-term Strategy (3-12 months)
- [ ] [Strategic Initiative 1]: [Description and vision]
- [ ] [Strategic Initiative 2]: [Description and vision]
- [ ] [Strategic Initiative 3]: [Description and vision]

## Implementation Plan

### Phase 1: Foundation (Month 1)
- **Objective**: [Establish documentation foundation]
- **Tasks**:
  - [ ] [Task 1]
  - [ ] [Task 2]
  - [ ] [Task 3]
- **Success Criteria**: [Measurable outcomes]

### Phase 2: Enhancement (Months 2-3)
- **Objective**: [Improve existing documentation]
- **Tasks**:
  - [ ] [Task 1]
  - [ ] [Task 2]
  - [ ] [Task 3]
- **Success Criteria**: [Measurable outcomes]

### Phase 3: Optimization (Months 4-6)
- **Objective**: [Optimize documentation experience]
- **Tasks**:
  - [ ] [Task 1]
  - [ ] [Task 2]
  - [ ] [Task 3]
- **Success Criteria**: [Measurable outcomes]

## Resource Requirements

### Personnel
- **Technical Writer**: [Time allocation needed]
- **Developers**: [Time allocation for reviews and updates]
- **Product Manager**: [Time allocation for strategy]
- **UX Designer**: [Time allocation for user experience]

### Tools and Infrastructure
- **Documentation Platform**: [Current/Recommended]
- **Automation Tools**: [For maintenance and updates]
- **Analytics Tools**: [For usage tracking]
- **Version Control**: [Integration requirements]

### Budget Considerations
- **Estimated Cost**: [Total estimated cost]
- **ROI Projection**: [Expected return on investment]
- **Timeline**: [Implementation timeline]
- **Risk Assessment**: [Risks and mitigation strategies]

## Success Metrics

### Quantitative Metrics
- **Documentation Coverage**: [Target percentage]
- **User Satisfaction**: [Survey scores]
- **Support Ticket Reduction**: [Percentage reduction]
- **Developer Onboarding Time**: [Time reduction]

### Qualitative Metrics
- **User Feedback**: [Positive feedback indicators]
- **Developer Experience**: [Improved workflow indicators]
- **Maintenance Efficiency**: [Easier maintenance indicators]
- **Knowledge Retention**: [Better team knowledge retention]

## Appendices

### A. Detailed File Inventory
[Complete list of all documentation files with status]

### B. Content Analysis Details
[Detailed analysis of key documentation sections]

### C. User Feedback Summary
[Summary of user feedback and pain points]

### D. Best Practices Recommendations
[Industry best practices and implementation guidance]
```

## Quality Assessment Criteria

### Completeness (25 points)
- [ ] All major features documented (10 points)
- [ ] Setup and installation covered (5 points)
- [ ] API/interface documentation complete (5 points)
- [ ] Troubleshooting information available (5 points)

### Accuracy (25 points)
- [ ] Information is current and up-to-date (10 points)
- [ ] Examples work as documented (10 points)
- [ ] No contradictory information (5 points)

### Clarity (25 points)
- [ ] Clear structure and organization (10 points)
- [ ] Appropriate for target audience (10 points)
- [ ] Good use of examples and visuals (5 points)

### Maintainability (25 points)
- [ ] Version controlled and tracked (10 points)
- [ ] Regular update process defined (5 points)
- [ ] Clear ownership and responsibility (5 points)
- [ ] Integrated with development workflow (5 points)

## Output Requirements

### File Locations
- Save scan report as `docs/documentation-scan-YYYY-MM-DD.md`
- Save detailed inventory as `docs/doc-inventory-{date}.json`
- Save improvement plan as `docs/doc-improvement-plan.md`
- Update `TASK.md` with scan completion

### Deliverables
- Comprehensive documentation scan report
- Prioritized improvement recommendations
- Implementation roadmap and timeline
- Resource requirements and budget estimates
- Success metrics and measurement plan

## Success Criteria
- **Comprehensive Coverage**: All documentation identified and analyzed
- **Actionable Insights**: Clear, prioritized recommendations provided
- **Implementation Ready**: Detailed plan with timelines and resources
- **Stakeholder Value**: Report provides clear business value
- **Measurable Outcomes**: Success metrics and tracking defined

Use this command to quickly assess documentation quality and create actionable improvement plans.