---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Advanced Product Requirements Prompt generation with comprehensive research and systematic analysis
---

# Enhanced Product Requirements Prompt (PRP) Generation

## Context
This command generates comprehensive Product Requirements Prompts using systematic research methodology and the proven 7-step approach. Use this command to create detailed, well-researched PRPs that serve as the foundation for successful feature implementation.

## PRP Generation Process

### Step 1: Requirements Understanding and Analysis
**Initial Requirements Gathering**
- Analyze the initial feature request or problem statement
- Identify primary and secondary stakeholders
- Define the business context and objectives
- Understand user needs and pain points
- Document assumptions and constraints

**Sequential Thinking Protocol**
- Use 15-20 thoughts to thoroughly understand the requirements
- Question the underlying problem and potential solutions
- Consider alternative approaches and their trade-offs
- Explore user scenarios and edge cases
- Document areas requiring further research

### Step 2: Comprehensive Research and Discovery
**Domain Research**
- Research industry best practices and standards
- Investigate existing solutions and their approaches
- Analyze competitor implementations and features
- Study relevant technologies and frameworks
- Collect market research and user feedback

**Technical Research**
```bash
# Search for existing implementations
grep -r "similar_feature" --include="*.py" .
find . -name "*.md" -exec grep -l "related_topic" {} \;

# Research external resources
curl -s "https://api.github.com/search/repositories?q=similar_feature" | jq '.items[].html_url'

# Analyze documentation
find docs/ -name "*.md" -exec grep -l "related_concept" {} \;
```

**Stakeholder Research**
- Interview key stakeholders and users
- Gather feedback from existing user base
- Analyze user behavior and usage patterns
- Research accessibility and compliance requirements
- Document regulatory and legal considerations

### Step 3: Current State Analysis and Validation
**System Analysis**
- Analyze current system architecture and capabilities
- Identify existing components that can be leveraged
- Document current limitations and constraints
- Assess integration points and dependencies
- Evaluate performance and scalability considerations

**Gap Analysis**
- Compare current state with desired future state
- Identify functional and technical gaps
- Assess resource requirements and constraints
- Evaluate timeline and implementation complexity
- Document risks and mitigation strategies

### Step 4: Solution Architecture and Design
**Solution Design**
- Design the overall solution architecture
- Define component interactions and data flows
- Plan user interface and experience design
- Consider scalability and performance requirements
- Document security and compliance considerations

**Technical Specifications**
- Define API specifications and data models
- Plan database schema and data management
- Design error handling and recovery mechanisms
- Consider monitoring and logging requirements
- Document integration and deployment strategies

### Step 5: Detailed Requirements Development
**Functional Requirements**
- Define detailed functional specifications
- Create user stories and acceptance criteria
- Document user workflows and interactions
- Specify business rules and validation logic
- Define reporting and analytics requirements

**Non-Functional Requirements**
- Performance and scalability requirements
- Security and compliance specifications
- Accessibility and usability standards
- Reliability and availability targets
- Maintainability and support requirements

### Step 6: Validation and Verification Planning
**Testing Strategy**
- Define comprehensive testing approach
- Plan unit, integration, and system testing
- Design user acceptance testing scenarios
- Consider performance and load testing
- Document security testing requirements

**Quality Assurance Planning**
- Define quality metrics and targets
- Plan code review and approval processes
- Consider accessibility and compliance testing
- Document maintenance and support procedures
- Plan monitoring and alerting strategies

### Step 7: PRP Documentation and Review
**PRP Compilation**
- Compile comprehensive PRP document
- Include all research findings and references
- Document implementation roadmap and timeline
- Create stakeholder review and approval process
- Prepare for implementation handoff

**Stakeholder Review**
- Present PRP to key stakeholders
- Gather feedback and incorporate revisions
- Obtain necessary approvals and sign-offs
- Document final requirements and specifications
- Create implementation kickoff plan

## PRP Document Structure

### Executive Summary
```markdown
# Product Requirements Prompt: [Feature Name]

## Executive Summary
- **Feature**: [Feature Name]
- **Priority**: [High/Medium/Low]
- **Estimated Effort**: [T-shirt size or story points]
- **Target Release**: [Release version/date]
- **Stakeholders**: [List of key stakeholders]

## Problem Statement
[Clear description of the problem this feature solves]

## Business Objectives
- [Primary business objective]
- [Secondary business objectives]
- [Success metrics and KPIs]

## User Impact
- [Primary user benefits]
- [User experience improvements]
- [User adoption expectations]
```

### Detailed Requirements
```markdown
## Functional Requirements

### Core Features
#### Feature 1: [Feature Name]
- **Description**: [Detailed description]
- **User Story**: As a [user type], I want [functionality] so that [benefit]
- **Acceptance Criteria**:
  - [ ] [Specific criteria 1]
  - [ ] [Specific criteria 2]
  - [ ] [Specific criteria 3]
- **Priority**: [Must Have/Should Have/Could Have]

#### Feature 2: [Feature Name]
[Similar structure as above]

### User Interface Requirements
- **Design Principles**: [List of design principles]
- **Accessibility Standards**: [WCAG compliance level]
- **Responsive Design**: [Mobile/tablet/desktop requirements]
- **Interaction Patterns**: [Common UI patterns to follow]

### Integration Requirements
- **Internal Systems**: [List of internal system integrations]
- **External APIs**: [List of external API integrations]
- **Data Flow**: [Description of data flow between systems]
- **Authentication**: [Authentication and authorization requirements]

## Non-Functional Requirements

### Performance Requirements
- **Response Time**: [Target response times]
- **Throughput**: [Expected transaction volume]
- **Scalability**: [Scaling requirements and limits]
- **Resource Utilization**: [Memory, CPU, storage requirements]

### Security Requirements
- **Authentication**: [Authentication mechanisms]
- **Authorization**: [Access control requirements]
- **Data Protection**: [Data encryption and security measures]
- **Compliance**: [Regulatory compliance requirements]

### Reliability Requirements
- **Availability**: [Uptime requirements]
- **Fault Tolerance**: [Error handling and recovery]
- **Backup and Recovery**: [Data backup and recovery procedures]
- **Monitoring**: [Monitoring and alerting requirements]
```

### Implementation Guidance
```markdown
## Technical Implementation

### Architecture Overview
- **System Architecture**: [High-level architecture description]
- **Component Diagram**: [Visual representation of components]
- **Data Flow Diagram**: [Data flow between components]
- **Technology Stack**: [Recommended technologies]

### Database Design
- **Data Models**: [Entity relationship diagrams]
- **Schema Changes**: [Required database schema changes]
- **Migration Strategy**: [Data migration approach]
- **Performance Considerations**: [Indexing and optimization]

### API Specifications
- **Endpoints**: [List of API endpoints with specifications]
- **Request/Response Formats**: [Data formats and schemas]
- **Error Handling**: [Error response formats and codes]
- **Rate Limiting**: [API rate limiting requirements]

## Testing Strategy

### Test Levels
- **Unit Testing**: [Unit test requirements and coverage]
- **Integration Testing**: [Integration test scenarios]
- **System Testing**: [End-to-end test scenarios]
- **User Acceptance Testing**: [UAT criteria and scenarios]

### Test Data and Environment
- **Test Data**: [Test data requirements and setup]
- **Test Environment**: [Test environment specifications]
- **Automation**: [Test automation requirements]
- **Performance Testing**: [Load and stress testing scenarios]

## Implementation Roadmap

### Phase 1: Foundation (Weeks 1-2)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

### Phase 2: Core Features (Weeks 3-4)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

### Phase 3: Integration and Testing (Weeks 5-6)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

### Phase 4: Deployment and Monitoring (Week 7)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

## Risk Assessment

### Technical Risks
- **Risk 1**: [Description] → [Mitigation strategy]
- **Risk 2**: [Description] → [Mitigation strategy]
- **Risk 3**: [Description] → [Mitigation strategy]

### Business Risks
- **Risk 1**: [Description] → [Mitigation strategy]
- **Risk 2**: [Description] → [Mitigation strategy]
- **Risk 3**: [Description] → [Mitigation strategy]

## Success Metrics

### Key Performance Indicators
- **Adoption Rate**: [Target user adoption percentage]
- **Usage Metrics**: [Expected usage volume and patterns]
- **Performance Metrics**: [Response time and throughput targets]
- **Quality Metrics**: [Error rate and reliability targets]

### Acceptance Criteria
- [ ] All functional requirements implemented
- [ ] All non-functional requirements met
- [ ] All test scenarios passed
- [ ] Stakeholder approval received
- [ ] Documentation complete

## Appendices

### Research References
- [List of research sources and references]
- [Industry best practices and standards]
- [Competitor analysis and benchmarks]
- [User feedback and survey results]

### Mockups and Diagrams
- [User interface mockups]
- [System architecture diagrams]
- [Data flow diagrams]
- [Process flow diagrams]

### Stakeholder Feedback
- [Feedback from stakeholder interviews]
- [Review comments and resolutions]
- [Approval signatures and dates]
- [Change request history]
```

## Quality Assurance Checklist

### Research Quality
- [ ] Comprehensive domain research completed
- [ ] Stakeholder interviews conducted
- [ ] Technical feasibility validated
- [ ] Competitive analysis performed
- [ ] User feedback incorporated

### Requirements Quality
- [ ] Functional requirements clearly defined
- [ ] Non-functional requirements specified
- [ ] Acceptance criteria are measurable
- [ ] Edge cases and error scenarios covered
- [ ] Integration requirements documented

### Documentation Quality
- [ ] PRP document is comprehensive and clear
- [ ] All sections are complete and accurate
- [ ] Stakeholder review completed
- [ ] Technical specifications are detailed
- [ ] Implementation guidance is actionable

### Validation Quality
- [ ] Requirements are testable and verifiable
- [ ] Success metrics are defined
- [ ] Risk assessment is comprehensive
- [ ] Implementation roadmap is realistic
- [ ] Stakeholder approval obtained

## Output Requirements

### File Locations
- Save PRP as `PRPs/PRP-YYYY-MM-DD-{feature-name}.md`
- Save research notes as `PRPs/research-{feature-name}.md`
- Save stakeholder feedback as `PRPs/feedback-{feature-name}.md`
- Update `TASK.md` with PRP completion status

### Deliverables
- Complete PRP document with all sections
- Research summary and references
- Stakeholder feedback and approvals
- Implementation roadmap and timeline
- Risk assessment and mitigation plan

## Success Criteria
- **Completeness**: All sections are thoroughly documented
- **Clarity**: Requirements are clear and unambiguous
- **Feasibility**: Implementation approach is realistic
- **Stakeholder Approval**: All stakeholders have reviewed and approved
- **Implementation Ready**: Development team can begin implementation

Use this command to generate comprehensive, well-researched PRPs that serve as the foundation for successful feature implementation.