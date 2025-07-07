---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Systematic PRP-driven implementation with comprehensive validation and quality assurance protocols
---

# Enhanced PRP Execution and Implementation

## Context
This command implements features using Product Requirements Prompts (PRPs) through systematic execution with built-in quality gates and comprehensive validation. Use this command to reliably implement features based on well-defined PRPs.

## PRP Execution Process

### Step 1: PRP Analysis and Understanding
**PRP Validation and Analysis**
- Load and thoroughly review the target PRP document
- Validate PRP completeness and clarity
- Identify all functional and non-functional requirements
- Extract acceptance criteria and success metrics
- Document any ambiguities or missing information

**Implementation Planning**
- Break down PRP into implementable tasks
- Identify dependencies and prerequisites
- Plan implementation sequence and milestones
- Estimate effort and timeline for each component
- Create detailed implementation roadmap

**Sequential Thinking Protocol**
- Use 20-25 thoughts to analyze the PRP comprehensively
- Question requirements for completeness and feasibility
- Consider implementation approaches and alternatives
- Identify potential risks and mitigation strategies
- Plan validation and testing approach

### Step 2: Environment Setup and Architecture
**Development Environment Preparation**
```bash
# Set up development environment
python -m venv venv_linux
source venv_linux/bin/activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Set up pre-commit hooks
pre-commit install

# Create feature branch
git checkout -b feature/prp-implementation-$(date +%Y-%m-%d)
```

**Architecture and Design Implementation**
- Review and implement the proposed architecture
- Set up database schemas and data models
- Configure API endpoints and routing
- Implement authentication and authorization
- Set up monitoring and logging infrastructure

### Step 3: Baseline Establishment and Validation
**Current State Documentation**
- Document current system behavior and performance
- Create baseline metrics and benchmarks
- Establish test data and scenarios
- Document existing limitations and constraints
- Create rollback and recovery procedures

**Baseline Testing**
```bash
# Run existing test suite
pytest tests/ -v --cov=. --cov-report=html

# Performance benchmarking
pytest tests/performance/ --benchmark-only

# Security baseline
bandit -r . -f json -o baseline-security.json

# Code quality baseline
ruff check . --format=json > baseline-quality.json
```

### Step 4: Incremental Implementation with Validation
**Test-Driven Development Approach**
- Write comprehensive test cases based on PRP requirements
- Implement features incrementally with continuous validation
- Ensure each increment passes all tests before proceeding
- Maintain clean, documented, and maintainable code
- Follow established coding patterns and conventions

**Implementation Standards and Quality**
```bash
# Code quality validation
black . --check
ruff check .
mypy . --strict

# Test execution and coverage
pytest -v --cov=. --cov-report=term-missing --cov-fail-under=85

# Security validation
bandit -r . --severity-level=high

# Performance validation
pytest tests/performance/ --benchmark-compare=baseline.json
```

**Incremental Validation Protocol**
- Validate each feature against PRP acceptance criteria
- Test integration points and dependencies
- Verify performance meets non-functional requirements
- Check security controls and compliance
- Document any deviations from PRP specifications

### Step 5: Comprehensive Feature Implementation
**Core Feature Development**
- Implement all functional requirements from PRP
- Add comprehensive error handling and validation
- Implement security controls and authentication
- Add monitoring, logging, and observability
- Create user interface components as specified

**Integration and API Development**
- Implement API endpoints per PRP specifications
- Add request/response validation and sanitization
- Implement rate limiting and throttling
- Add comprehensive error handling and status codes
- Create API documentation and examples

**Database and Data Management**
- Implement database schema changes
- Add data validation and integrity constraints
- Implement backup and recovery procedures
- Add database migrations and version control
- Optimize queries and indexing strategies

### Step 6: Multi-Level Testing and Validation
**Unit Testing (85% Minimum Coverage)**
```bash
# Comprehensive unit testing
pytest tests/unit/ -v --cov=. --cov-report=html --cov-fail-under=85

# Test quality validation
pytest tests/unit/ --cov-report=term-missing --cov-branch

# Mutation testing (optional)
mutpy --target=src --unit-test=tests/unit/
```

**Integration Testing**
```bash
# API integration testing
pytest tests/integration/api/ -v

# Database integration testing
pytest tests/integration/database/ -v

# Third-party service integration
pytest tests/integration/services/ -v

# End-to-end workflow testing
pytest tests/integration/e2e/ -v
```

**System and Performance Testing**
```bash
# Load testing
locust -f tests/load/locustfile.py --host=http://localhost:8000

# Stress testing
pytest tests/stress/ -v

# Security testing
pytest tests/security/ -v
zap-baseline.py -t http://localhost:8000
```

**User Acceptance Testing**
- Execute all UAT scenarios from PRP
- Validate user workflows and interactions
- Test accessibility and usability requirements
- Verify business logic and rules
- Document any issues or deviations

### Step 7: Deployment Preparation and Documentation
**Deployment Readiness Validation**
- Validate all PRP requirements are implemented
- Ensure all tests pass and quality gates are met
- Verify security scans are clean
- Confirm performance benchmarks are achieved
- Complete documentation and knowledge transfer

**Documentation Updates**
- Update API documentation with new endpoints
- Create/update user documentation and guides
- Document configuration and deployment procedures
- Create troubleshooting and support documentation
- Update architectural and system documentation

**Deployment Preparation**
```bash
# Build and package application
docker build -t feature-implementation .

# Run deployment tests
pytest tests/deployment/ -v

# Generate deployment artifacts
python setup.py sdist bdist_wheel

# Create deployment scripts
./scripts/prepare-deployment.sh
```

## PRP Implementation Checklist

### Phase 1: Planning and Setup
- [ ] PRP thoroughly analyzed and understood
- [ ] Implementation plan created and validated
- [ ] Development environment set up
- [ ] Feature branch created
- [ ] Baseline established and documented

### Phase 2: Architecture and Design
- [ ] System architecture implemented
- [ ] Database schema created and tested
- [ ] API specifications implemented
- [ ] Security controls configured
- [ ] Monitoring and logging set up

### Phase 3: Feature Implementation
- [ ] All functional requirements implemented
- [ ] Non-functional requirements met
- [ ] Error handling comprehensive
- [ ] Security controls in place
- [ ] Code quality standards met

### Phase 4: Testing and Validation
- [ ] Unit tests written and passing (85% coverage)
- [ ] Integration tests completed
- [ ] System tests executed
- [ ] Performance tests passed
- [ ] Security tests clean
- [ ] User acceptance tests completed

### Phase 5: Deployment and Documentation
- [ ] Deployment scripts prepared
- [ ] Documentation updated
- [ ] Configuration management ready
- [ ] Monitoring configured
- [ ] Rollback procedures tested

## Quality Gates and Validation

### Pre-Implementation Gates
- [ ] PRP is complete and approved
- [ ] Implementation plan is realistic
- [ ] Development environment is ready
- [ ] Dependencies are available
- [ ] Test strategy is defined

### Implementation Gates
- [ ] Code follows established patterns
- [ ] Security best practices implemented
- [ ] Performance requirements met
- [ ] Error handling comprehensive
- [ ] Documentation updated continuously

### Post-Implementation Gates
- [ ] All PRP requirements implemented
- [ ] All tests passing (85% coverage minimum)
- [ ] Security scan clean
- [ ] Performance benchmarks achieved
- [ ] Documentation complete
- [ ] Stakeholder approval received

## Implementation Report Template

```markdown
# PRP Implementation Report

## Executive Summary
- **PRP**: [PRP Name and Reference]
- **Implementation Date**: [Date]
- **Developer**: [Name]
- **Status**: [Complete/In Progress/Blocked]

## Requirements Implementation Status
### Functional Requirements
- [Requirement 1]: ✅ Complete
- [Requirement 2]: ✅ Complete
- [Requirement 3]: ⏳ In Progress

### Non-Functional Requirements
- **Performance**: ✅ Meets targets
- **Security**: ✅ All controls implemented
- **Scalability**: ✅ Tested and validated
- **Reliability**: ✅ Error handling complete

## Implementation Details
### Architecture Changes
- [List of architectural changes made]
- [New components added]
- [Existing components modified]

### Database Changes
- [Schema modifications]
- [Migration scripts created]
- [Data validation implemented]

### API Changes
- [New endpoints added]
- [Existing endpoints modified]
- [Documentation updated]

## Testing Results
### Test Coverage
- **Unit Tests**: [Coverage Percentage]
- **Integration Tests**: [Number of tests]
- **System Tests**: [Number of scenarios]
- **Performance Tests**: [Results summary]

### Quality Metrics
- **Code Quality Score**: [Score]/100
- **Security Scan**: [Status]
- **Performance Benchmarks**: [Results]
- **Documentation Coverage**: [Percentage]

## Deployment Information
### Deployment Requirements
- [Configuration changes needed]
- [Infrastructure requirements]
- [Migration procedures]

### Monitoring and Alerting
- [Monitoring setup]
- [Alert configurations]
- [Dashboard creation]

## Known Issues and Limitations
- [Any known issues or limitations]
- [Workarounds or temporary solutions]
- [Future improvements needed]

## Lessons Learned
- [Key lessons from implementation]
- [Best practices identified]
- [Recommendations for future PRPs]
```

## Success Criteria
- **Completeness**: All PRP requirements implemented
- **Quality**: All quality gates passed
- **Testing**: 85% minimum test coverage achieved
- **Performance**: Non-functional requirements met
- **Security**: Security controls implemented and validated
- **Documentation**: Complete and accurate documentation

## File Locations
- Save implementation report as `PRPs/implementation-{prp-name}-{date}.md`
- Save test results as `PRPs/test-results-{prp-name}.json`
- Update `TASK.md` with implementation status
- Create pull request with comprehensive description

Use this command to systematically implement features based on well-defined PRPs with comprehensive validation and quality assurance.