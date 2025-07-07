---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Comprehensive research methodology for technical analysis and knowledge discovery
---

# Deep Research and Analysis

## Context
This command implements systematic research methodology for comprehensive technical analysis, problem exploration, and knowledge discovery. Use this command to conduct thorough research that informs decision-making and implementation strategies.

## Deep Research Process

### Step 1: Research Scope Definition and Planning
**Research Objective Clarification**
- Define specific research questions and objectives
- Identify key areas requiring investigation
- Determine research depth and breadth requirements
- Set research timeline and milestones
- Document expected outcomes and deliverables

**Sequential Thinking Protocol**
- Use 15-20 thoughts to plan comprehensive research approach
- Question assumptions and identify knowledge gaps
- Consider multiple research angles and perspectives
- Plan information validation and verification strategies
- Document research methodology and approach

### Step 2: Primary Source Investigation
**Technical Documentation Analysis**
```bash
# Search internal documentation
find . -name "*.md" -o -name "*.rst" -o -name "*.txt" | xargs grep -l "research_topic"

# Analyze code comments and docstrings
grep -r "research_topic" --include="*.py" --include="*.js" --include="*.java" .

# Check configuration files
find . -name "*.json" -o -name "*.yaml" -o -name "*.toml" | xargs grep -l "research_topic"

# Review test files for usage patterns
find tests/ -name "*.py" | xargs grep -l "research_topic"
```

**Repository and Codebase Analysis**
- Examine existing implementations and patterns
- Analyze system architecture and design decisions
- Review historical changes and evolution
- Study test cases and usage examples
- Document current capabilities and limitations

### Step 3: External Research and Knowledge Gathering
**Industry Research and Best Practices**
```bash
# Research GitHub repositories
curl -s "https://api.github.com/search/repositories?q=research_topic&sort=stars" | jq '.items[:10] | .[] | {name, description, stars_count, html_url}'

# Check Stack Overflow discussions
curl -s "https://api.stackexchange.com/2.3/search?order=desc&sort=relevance&intitle=research_topic&site=stackoverflow" | jq '.items[:10] | .[] | {title, score, link}'

# Research documentation sites
# (Manual searches for official documentation)
```

**Academic and Technical Literature**
- Search academic papers and research publications
- Review technical blogs and industry articles
- Analyze case studies and implementation examples
- Study relevant RFCs and technical specifications
- Collect benchmark data and performance studies

### Step 4: Competitive Analysis and Benchmarking
**Competitive Solution Analysis**
- Research competitor implementations and approaches
- Analyze feature sets and capabilities
- Study user feedback and reviews
- Compare performance and scalability characteristics
- Document lessons learned and best practices

**Technology Stack Research**
- Research available technologies and frameworks
- Compare pros and cons of different approaches
- Analyze community support and ecosystem maturity
- Study performance characteristics and limitations
- Document integration and compatibility considerations

### Step 5: Synthesis and Pattern Recognition
**Information Organization and Analysis**
- Organize research findings by themes and categories
- Identify common patterns and emerging trends
- Analyze contradictions and differing perspectives
- Synthesize insights and draw conclusions
- Document gaps in current knowledge

**Risk and Opportunity Assessment**
- Identify potential risks and challenges
- Assess opportunities for innovation
- Evaluate resource requirements and constraints
- Consider timeline and implementation feasibility
- Document decision-making criteria and factors

### Step 6: Validation and Verification
**Information Verification Process**
- Cross-reference findings from multiple sources
- Validate technical claims and specifications
- Test assumptions through experimentation
- Seek expert opinions and peer review
- Document confidence levels and uncertainties

**Practical Validation**
```bash
# Create proof-of-concept implementations
mkdir research-poc/
cd research-poc/

# Test key technical approaches
python test_approach_1.py
python test_approach_2.py

# Benchmark performance characteristics
python -m timeit "test_function()"

# Validate integration possibilities
python test_integration.py
```

### Step 7: Research Documentation and Knowledge Transfer
**Comprehensive Research Report**
- Compile findings into structured report
- Include executive summary and recommendations
- Document methodology and sources
- Provide actionable insights and next steps
- Create knowledge repository for future reference

**Stakeholder Communication**
- Present findings to relevant stakeholders
- Facilitate discussion and decision-making
- Document decisions and rationale
- Create implementation roadmap
- Establish follow-up research needs

## Research Report Structure

### Executive Summary
```markdown
# Deep Research Report: [Research Topic]

## Executive Summary
- **Research Objective**: [Primary research question]
- **Research Duration**: [Start date - End date]
- **Key Findings**: [3-5 bullet points of main findings]
- **Recommendations**: [Primary recommendations]
- **Confidence Level**: [High/Medium/Low with justification]

## Research Scope
- **Primary Questions**: [List of research questions]
- **Secondary Areas**: [Additional areas investigated]
- **Methodology**: [Research approach and methods used]
- **Sources**: [Types of sources consulted]
- **Limitations**: [Research limitations and constraints]
```

### Detailed Findings
```markdown
## Technical Analysis

### Current State Assessment
- **Existing Solutions**: [Analysis of current solutions]
- **Capabilities**: [Current system capabilities]
- **Limitations**: [Identified limitations and constraints]
- **Performance**: [Performance characteristics and benchmarks]

### Technology Landscape
- **Available Technologies**: [Comprehensive technology overview]
- **Framework Analysis**: [Framework comparison and evaluation]
- **Tool Ecosystem**: [Supporting tools and libraries]
- **Community Support**: [Community size and activity levels]

### Competitive Analysis
- **Competitor Solutions**: [Analysis of competitor approaches]
- **Market Trends**: [Industry trends and directions]
- **Best Practices**: [Identified best practices and patterns]
- **Innovation Opportunities**: [Areas for potential innovation]

## Implementation Considerations

### Technical Requirements
- **Architecture**: [Recommended architecture approaches]
- **Performance**: [Performance requirements and considerations]
- **Scalability**: [Scalability factors and limitations]
- **Security**: [Security considerations and requirements]

### Resource Requirements
- **Development Effort**: [Estimated development effort]
- **Infrastructure**: [Infrastructure requirements]
- **Skills and Expertise**: [Required skills and knowledge]
- **Timeline**: [Realistic implementation timeline]

### Risk Assessment
- **Technical Risks**: [Technical challenges and risks]
- **Resource Risks**: [Resource availability and constraints]
- **Timeline Risks**: [Schedule risks and dependencies]
- **Mitigation Strategies**: [Risk mitigation approaches]

## Recommendations

### Primary Recommendations
1. **Recommendation 1**: [Detailed recommendation with justification]
2. **Recommendation 2**: [Detailed recommendation with justification]
3. **Recommendation 3**: [Detailed recommendation with justification]

### Alternative Approaches
- **Option A**: [Description, pros, cons, effort]
- **Option B**: [Description, pros, cons, effort]
- **Option C**: [Description, pros, cons, effort]

### Implementation Roadmap
#### Phase 1: [Phase Name] (Timeline)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

#### Phase 2: [Phase Name] (Timeline)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

#### Phase 3: [Phase Name] (Timeline)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

## Supporting Evidence

### Research Sources
#### Primary Sources
- [Source 1]: [Description and relevance]
- [Source 2]: [Description and relevance]
- [Source 3]: [Description and relevance]

#### Secondary Sources
- [Source 1]: [Description and relevance]
- [Source 2]: [Description and relevance]
- [Source 3]: [Description and relevance]

### Experimental Results
- **Experiment 1**: [Description, methodology, results]
- **Experiment 2**: [Description, methodology, results]
- **Experiment 3**: [Description, methodology, results]

### Expert Opinions
- **Expert 1**: [Name, credentials, key insights]
- **Expert 2**: [Name, credentials, key insights]
- **Expert 3**: [Name, credentials, key insights]

## Appendices

### A. Detailed Technical Specifications
[Comprehensive technical details and specifications]

### B. Benchmark Results
[Performance benchmarks and test results]

### C. Code Examples and Prototypes
[Sample code and proof-of-concept implementations]

### D. Reference Materials
[Complete list of all sources and references]
```

## Research Quality Checklist

### Information Gathering Quality
- [ ] Multiple reliable sources consulted
- [ ] Primary and secondary sources balanced
- [ ] Recent and historical information included
- [ ] Technical accuracy verified
- [ ] Bias and limitations acknowledged

### Analysis Quality
- [ ] Systematic analysis methodology applied
- [ ] Patterns and trends identified
- [ ] Contradictions and uncertainties addressed
- [ ] Practical implications considered
- [ ] Recommendations are actionable

### Documentation Quality
- [ ] Clear and comprehensive report structure
- [ ] Executive summary provides key insights
- [ ] Supporting evidence is well-organized
- [ ] Conclusions are well-supported
- [ ] Future research needs identified

### Stakeholder Value
- [ ] Addresses original research questions
- [ ] Provides actionable recommendations
- [ ] Considers implementation constraints
- [ ] Identifies risks and opportunities
- [ ] Enables informed decision-making

## Research Methodology Guidelines

### Source Evaluation Criteria
- **Authority**: Is the source authoritative and credible?
- **Accuracy**: Is the information factually correct?
- **Currency**: Is the information current and up-to-date?
- **Relevance**: Is the information relevant to research objectives?
- **Objectivity**: Is the information unbiased and balanced?

### Information Validation Process
1. **Cross-Reference**: Verify information across multiple sources
2. **Expert Review**: Seek expert validation when possible
3. **Practical Testing**: Test claims through experimentation
4. **Peer Review**: Have findings reviewed by colleagues
5. **Documentation**: Document validation process and results

## Output Requirements

### File Locations
- Save research report as `research-YYYY-MM-DD-{topic}.md`
- Save supporting data as `research-data-{topic}/`
- Save code examples as `research-examples-{topic}/`
- Update `TASK.md` with research completion

### Deliverables
- Comprehensive research report
- Executive summary for stakeholders
- Technical specifications and recommendations
- Implementation roadmap and timeline
- Risk assessment and mitigation strategies

## Success Criteria
- **Completeness**: All research objectives addressed
- **Quality**: High-quality, credible sources used
- **Actionability**: Recommendations are practical and implementable
- **Clarity**: Report is clear and well-organized
- **Value**: Research provides significant decision-making value

Use this command to conduct thorough, systematic research that provides the foundation for informed technical decisions and successful implementations.