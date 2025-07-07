---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Systematic regression prevention workflow and validation ensuring changes don't break existing functionality
---

# Regression Prevention and Validation

## Context
This command implements systematic regression prevention workflow and comprehensive validation to ensure that new changes don't break existing functionality. Use this command to maintain system stability and prevent the introduction of bugs when making changes.

## Regression Check Process

### Step 1: Baseline Establishment and Documentation
**Current System State Capture**
```bash
# Capture current system baseline
git status
git log --oneline -10

# Document current test results
pytest tests/ --tb=no -q > baseline-test-results.txt
python -m pytest --co -q | wc -l > baseline-test-count.txt

# Capture current performance baselines
pytest tests/performance/ --benchmark-only --benchmark-json=baseline-performance.json

# Document current code metrics
radon cc . --total-average > baseline-complexity.txt
radon mi . --total-average > baseline-maintainability.txt
```

**System Behavior Documentation**
- Document critical system functionalities
- Capture current performance characteristics
- Record system configuration and dependencies
- Establish test coverage baseline
- Document known limitations and edge cases

### Step 2: Test Suite Validation and Enhancement
**Existing Test Suite Analysis**
```bash
# Analyze test coverage completeness
pytest --cov=. --cov-report=html --cov-report=term-missing
coverage report --show-missing --skip-covered

# Identify untested critical paths
grep -r "TODO.*test\|FIXME.*test" tests/
find . -name "*.py" | xargs grep -l "def " | while read file; do
    echo "File: $file"
    grep "def " "$file" | grep -v "__"
done
```

**Test Quality Assessment**
```bash
# Check test isolation and reliability
pytest tests/ --cache-clear --tb=short

# Test for flakiness
pytest tests/ --count=5 --maxfail=1 -x

# Validate test data consistency
pytest tests/ --setup-show --tb=short

# Check test execution time consistency
pytest tests/ --durations=0 --tb=no
```

### Step 3: Change Impact Analysis
**Code Change Assessment**
```bash
# Analyze changes since last release
git diff --name-only HEAD~1
git diff --stat HEAD~1

# Identify affected modules and dependencies
python -c "
import ast
import os
changed_files = os.popen('git diff --name-only HEAD~1').read().split()
for file in changed_files:
    if file.endswith('.py'):
        print(f'Changed file: {file}')
"

# Check for breaking API changes
git diff HEAD~1 -- "*.py" | grep -E "^-.*def |^-.*class " || echo "No API changes detected"
```

**Dependency Impact Analysis**
```bash
# Check for dependency changes
git diff HEAD~1 requirements.txt setup.py pyproject.toml || echo "No dependency changes"

# Validate import changes
git diff HEAD~1 -- "*.py" | grep -E "^[\+\-].*import " || echo "No import changes"

# Check configuration changes
git diff HEAD~1 -- "*.json" "*.yaml" "*.yml" "*.toml" "*.ini" || echo "No config changes"
```

### Step 4: Comprehensive Regression Testing
**Core Functionality Regression Tests**
```bash
# Run all existing tests with verbose output
pytest tests/ -v --tb=short --maxfail=5

# Run tests for specifically affected modules
git diff --name-only HEAD~1 | grep "\.py$" | sed 's/src\///; s/\.py$//' | while read module; do
    if [ -f "tests/test_${module}.py" ]; then
        echo "Testing module: $module"
        pytest "tests/test_${module}.py" -v
    fi
done
```

**Integration and System Tests**
```bash
# Run integration tests
pytest tests/integration/ -v --tb=short

# Run system-level tests
pytest tests/system/ -v --tb=short

# Run end-to-end tests
pytest tests/e2e/ -v --tb=short --timeout=300
```

**API and Interface Regression Tests**
```bash
# Test API backwards compatibility
pytest tests/api/ -v --strict-markers

# Test database schema compatibility
pytest tests/database/migrations/ -v

# Test configuration compatibility
pytest tests/config/ -v
```

### Step 5: Performance Regression Analysis
**Performance Baseline Comparison**
```bash
# Run performance tests and compare with baseline
pytest tests/performance/ --benchmark-only --benchmark-compare=baseline-performance.json

# Memory usage regression check
python -m memory_profiler tests/performance/memory_regression.py

# Database query performance check
pytest tests/performance/database/ --benchmark-compare=baseline-db.json

# API response time regression check
pytest tests/performance/api/ --benchmark-autosave
```

**Resource Usage Validation**
```bash
# CPU usage regression test
time python -m pytest tests/performance/cpu_intensive.py

# Disk I/O regression test
pytest tests/performance/io_operations.py --benchmark-only

# Network latency impact assessment
pytest tests/performance/network/ --timeout=60
```

### Step 6: Security Regression Validation
**Security Control Verification**
```bash
# Security vulnerability regression check
bandit -r . -f json -o current-security.json
diff baseline-security.json current-security.json || echo "Security changes detected"

# Authentication/authorization regression test
pytest tests/security/auth/ -v

# Input validation regression test
pytest tests/security/input_validation/ -v

# Access control regression test
pytest tests/security/permissions/ -v
```

**Dependency Security Check**
```bash
# Check for new security vulnerabilities in dependencies
safety check --json --output=current-safety.json
diff baseline-safety.json current-safety.json || echo "New security issues detected"

# Audit package dependencies
pip-audit --format=json --output=current-audit.json
```

### Step 7: Regression Report and Validation
**Comprehensive Regression Analysis**
- Compare current results with established baselines
- Identify any performance degradation or functional regression
- Validate that new functionality doesn't break existing features
- Document any acceptable changes and their justification
- Create regression prevention recommendations

**Quality Assurance Validation**
- Ensure all critical functionality remains intact
- Validate performance characteristics are within acceptable ranges
- Confirm security controls are not compromised
- Verify backwards compatibility is maintained
- Document any breaking changes and migration paths

## Regression Test Report Structure

### Executive Summary
```markdown
# Regression Test Report

## Executive Summary
- **Test Date**: [Date]
- **Changes Analyzed**: [Number of files changed]
- **Regression Status**: [PASS/FAIL/WARNING]
- **Critical Issues Found**: [Count]
- **Performance Impact**: [Improved/Neutral/Degraded]

## Change Impact Summary
- **Files Modified**: [Count]
- **Lines Added**: [Count]
- **Lines Removed**: [Count]
- **API Changes**: [Breaking/Non-breaking/None]
- **Dependency Changes**: [Major/Minor/None]

## Test Results Overview
- **Total Tests**: [Count]
- **Passed**: [Count]
- **Failed**: [Count]
- **Skipped**: [Count]
- **Test Coverage**: [Current]% (Baseline: [Previous]%)
```

### Detailed Regression Analysis
```markdown
## Functional Regression Analysis

### Core Functionality
- **Status**: [PASS/FAIL]
- **Tests Passed**: [Count]/[Total]
- **New Failures**: [Count]
- **Fixed Issues**: [Count]
- **Critical Path Tests**: [All passing/Issues found]

### API Compatibility
- **Backwards Compatibility**: [Maintained/Broken]
- **New API Endpoints**: [Count]
- **Modified Endpoints**: [Count]
- **Deprecated Features**: [Count]
- **Breaking Changes**: [List if any]

### Database/Storage
- **Schema Changes**: [Compatible/Breaking]
- **Data Migration**: [Required/Not required]
- **Query Performance**: [Improved/Neutral/Degraded]
- **Data Integrity**: [Maintained/Issues found]

## Performance Regression Analysis

### Response Time Analysis
- **API Response Time**: [Current] vs [Baseline] ([+/-X]%)
- **Database Query Time**: [Current] vs [Baseline] ([+/-X]%)
- **Page Load Time**: [Current] vs [Baseline] ([+/-X]%)
- **Background Process Time**: [Current] vs [Baseline] ([+/-X]%)

### Resource Usage Analysis
- **Memory Usage**: [Current] vs [Baseline] ([+/-X]%)
- **CPU Usage**: [Current] vs [Baseline] ([+/-X]%)
- **Disk I/O**: [Current] vs [Baseline] ([+/-X]%)
- **Network Usage**: [Current] vs [Baseline] ([+/-X]%)

### Load Testing Results
- **Concurrent User Capacity**: [Current] vs [Baseline]
- **Requests per Second**: [Current] vs [Baseline]
- **Error Rate Under Load**: [Current]% vs [Baseline]%
- **Resource Scaling**: [Better/Same/Worse]

## Security Regression Analysis

### Vulnerability Assessment
- **New Vulnerabilities**: [Count]
- **Fixed Vulnerabilities**: [Count]
- **Security Score**: [Current] vs [Baseline]
- **Critical Security Issues**: [Count]

### Access Control
- **Authentication Tests**: [Pass/Fail]
- **Authorization Tests**: [Pass/Fail]
- **Session Management**: [Pass/Fail]
- **Input Validation**: [Pass/Fail]

### Dependency Security
- **New Security Advisories**: [Count]
- **Outdated Dependencies**: [Count]
- **License Compatibility**: [Pass/Fail]
- **Supply Chain Security**: [Pass/Fail]

## Code Quality Regression

### Metrics Comparison
- **Code Complexity**: [Current] vs [Baseline]
- **Maintainability Index**: [Current] vs [Baseline]
- **Technical Debt**: [Increased/Decreased/Same]
- **Code Duplication**: [Current]% vs [Baseline]%

### Quality Standards
- **Coding Standards**: [Pass/Fail]
- **Documentation Coverage**: [Current]% vs [Baseline]%
- **Type Hint Coverage**: [Current]% vs [Baseline]%
- **Test Quality**: [Improved/Same/Degraded]

## Identified Regressions

### Critical Regressions (Must Fix)
1. **Regression 1**: [Description]
   - **Impact**: [Impact on users/system]
   - **Root Cause**: [Analysis of cause]
   - **Affected Areas**: [Components affected]
   - **Fix Required**: [Recommended solution]

### Major Regressions (Should Fix)
1. **Regression 1**: [Description]
   - **Impact**: [Impact description]
   - **Workaround**: [Temporary solution if available]
   - **Fix Timeline**: [Estimated time to fix]

### Minor Issues (Nice to Fix)
1. **Issue 1**: [Description]
   - **Impact**: [Low impact description]
   - **Priority**: [Low/Future release]

## Performance Improvements Identified
1. **Improvement 1**: [Description]
2. **Improvement 2**: [Description]
3. **Improvement 3**: [Description]

## Recommendations

### Immediate Actions Required
- [ ] [Critical fix 1]
- [ ] [Critical fix 2]
- [ ] [Critical fix 3]

### Performance Optimizations
- [ ] [Optimization 1]
- [ ] [Optimization 2]
- [ ] [Optimization 3]

### Test Coverage Improvements
- [ ] [Coverage improvement 1]
- [ ] [Coverage improvement 2]
- [ ] [Coverage improvement 3]

## Rollback Procedures

### Rollback Criteria
- [Criterion 1]: [When to rollback]
- [Criterion 2]: [Performance threshold]
- [Criterion 3]: [Security threshold]

### Rollback Steps
1. [Step 1]: [Action required]
2. [Step 2]: [Verification needed]
3. [Step 3]: [Notification required]

## Deployment Decision

### Go/No-Go Assessment
**Decision**: [GO/NO-GO/GO WITH CONDITIONS]

**Justification**: [Detailed reasoning for decision]

**Conditions** (if applicable):
- [Condition 1]
- [Condition 2]
- [Condition 3]

### Risk Assessment
- **High Risk Areas**: [List of high-risk components]
- **Mitigation Strategies**: [Risk mitigation plans]
- **Monitoring Requirements**: [Post-deployment monitoring]
- **Rollback Plan**: [Prepared/Not prepared]

## Next Steps
1. [Action item 1]
2. [Action item 2]
3. [Action item 3]
```

## Regression Prevention Checklist

### Pre-Change Analysis
- [ ] Baseline metrics captured
- [ ] Impact analysis completed
- [ ] Test coverage validated
- [ ] Performance benchmarks established
- [ ] Security baseline documented

### Testing Execution
- [ ] All existing tests pass
- [ ] New functionality tested
- [ ] Integration tests completed
- [ ] Performance tests executed
- [ ] Security tests passed

### Quality Validation
- [ ] No critical regressions identified
- [ ] Performance within acceptable limits
- [ ] Security controls maintained
- [ ] Code quality standards met
- [ ] Documentation updated

### Deployment Readiness
- [ ] All regressions addressed
- [ ] Stakeholder approval received
- [ ] Rollback plan prepared
- [ ] Monitoring configured
- [ ] Support team notified

## Success Criteria
- **Zero Critical Regressions**: No critical functionality broken
- **Performance Maintained**: Performance within 5% of baseline
- **Security Preserved**: No new critical security vulnerabilities
- **Quality Maintained**: Code quality metrics within acceptable ranges
- **Test Coverage**: Coverage maintained or improved

## Output Requirements

### File Locations
- Save regression report as `tests/regression/regression-report-YYYY-MM-DD.md`
- Save baseline comparison as `tests/regression/baseline-comparison.json`
- Save performance analysis as `tests/regression/performance-analysis.json`
- Update `TASK.md` with regression check completion

### Deliverables
- Comprehensive regression analysis report
- Performance impact assessment
- Security regression validation
- Deployment readiness recommendation
- Rollback procedures and criteria

Use this command to ensure changes don't introduce regressions and maintain system stability and quality.