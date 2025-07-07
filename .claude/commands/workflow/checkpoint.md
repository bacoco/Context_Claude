---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Progress validation and checkpoint creation with state preservation and next steps planning
---

# Progress Checkpoint and Validation

## Context
This command provides comprehensive progress validation and checkpoint creation capabilities with state preservation and systematic next steps planning. Use this command periodically during development to track progress, validate work quality, and plan next steps.

## Checkpoint Process

### Step 1: Current Work State Assessment
**Work Progress Analysis**
```bash
# Check current git status and changes
echo "=== Current Work Status ==="
git status --porcelain
git diff --stat
git log --oneline -5

# Count changes since last checkpoint
CHANGED_FILES=$(git diff --name-only | wc -l)
ADDED_LINES=$(git diff --numstat | awk '{sum+=$1} END {print sum}')
REMOVED_LINES=$(git diff --numstat | awk '{sum+=$2} END {print sum}')

echo "Files changed: $CHANGED_FILES"
echo "Lines added: $ADDED_LINES"
echo "Lines removed: $REMOVED_LINES"

# Check for uncommitted work
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Uncommitted changes present"
else
    echo "✅ Working tree clean"
fi
```

**Task Progress Review**
```bash
# Review current tasks in TASK.md
if [ -f "TASK.md" ]; then
    echo "=== Task Progress Review ==="
    echo "Current tasks status:"
    grep -E "^- \[[ x]\]" TASK.md | head -10
    
    TOTAL_TASKS=$(grep -c "^- \[" TASK.md)
    COMPLETED_TASKS=$(grep -c "^- \[x\]" TASK.md)
    PERCENTAGE=$((COMPLETED_TASKS * 100 / TOTAL_TASKS))
    
    echo "Progress: $COMPLETED_TASKS/$TOTAL_TASKS tasks completed ($PERCENTAGE%)"
else
    echo "⚠️  No TASK.md found for progress tracking"
fi

# Check session objectives if available
if [ -f ".session/context-*.md" ]; then
    echo "=== Session Objectives Review ==="
    LATEST_SESSION=$(ls .session/context-*.md | tail -1)
    grep -A 10 "## Session Goals" "$LATEST_SESSION" || echo "No session goals found"
fi
```

### Step 2: Code Quality Validation
**Quality Metrics Assessment**
```bash
# Run code quality checks
echo "=== Code Quality Assessment ==="

# Check code formatting
if command -v black >/dev/null 2>&1; then
    echo "Checking code formatting..."
    black . --check --diff | head -20 || echo "Code formatting issues found"
else
    echo "⚠️  Black not available"
fi

# Check code style
if command -v ruff >/dev/null 2>&1; then
    echo "Checking code style..."
    ruff check . --statistics || echo "Style issues found"
else
    echo "⚠️  Ruff not available"
fi

# Type checking
if command -v mypy >/dev/null 2>&1; then
    echo "Running type checks..."
    mypy . --show-error-codes | head -10 || echo "Type checking issues found"
else
    echo "⚠️  MyPy not available"
fi
```

**Test Suite Validation**
```bash
# Run tests and check coverage
echo "=== Test Suite Validation ==="

if command -v pytest >/dev/null 2>&1; then
    echo "Running test suite..."
    pytest --tb=short -q
    
    echo "Checking test coverage..."
    pytest --cov=. --cov-report=term-missing --tb=no -q | tail -10
    
    # Count tests
    TOTAL_TESTS=$(pytest --co -q | wc -l)
    echo "Total tests: $TOTAL_TESTS"
else
    echo "⚠️  Pytest not available"
fi

# Check for test files
TEST_FILES=$(find tests/ -name "*.py" 2>/dev/null | wc -l)
echo "Test files: $TEST_FILES"
```

### Step 3: Security and Dependencies Check
**Security Validation**
```bash
echo "=== Security Validation ==="

# Security scan
if command -v bandit >/dev/null 2>&1; then
    echo "Running security scan..."
    bandit -r . -ll -f txt | head -10 || echo "Security issues found"
else
    echo "⚠️  Bandit not available"
fi

# Dependency security check
if command -v safety >/dev/null 2>&1; then
    echo "Checking dependency security..."
    safety check --short-report || echo "Vulnerable dependencies found"
else
    echo "⚠️  Safety not available"
fi

# Check for hardcoded secrets
echo "Checking for potential secrets..."
grep -r "password\|secret\|key.*=" --include="*.py" . | head -5 || echo "No obvious secrets found"
```

**Dependency Health Check**
```bash
echo "=== Dependency Health ==="

# Check pip dependencies
if [ -f "requirements.txt" ]; then
    echo "Checking dependency conflicts..."
    pip check || echo "Dependency conflicts detected"
    
    echo "Checking for outdated packages..."
    pip list --outdated | head -10 || echo "All packages up to date"
else
    echo "⚠️  No requirements.txt found"
fi
```

### Step 4: Performance and Resource Analysis
**Performance Metrics**
```bash
echo "=== Performance Analysis ==="

# Basic performance checks
if [ -d "tests/performance" ]; then
    echo "Running performance tests..."
    pytest tests/performance/ --benchmark-only --benchmark-sort=mean | tail -10 || echo "No performance tests found"
fi

# Memory usage check for Python scripts
echo "Checking memory usage patterns..."
find . -name "*.py" | head -5 | while read file; do
    python -c "
import sys
import os
print(f'File: $file')
try:
    with open('$file', 'r') as f:
        lines = len(f.readlines())
    print(f'Lines: {lines}')
except: pass
"
done
```

**Resource Usage Assessment**
```bash
# Check file sizes and complexity
echo "=== Resource Usage ==="

# Largest files
echo "Largest Python files:"
find . -name "*.py" -exec wc -l {} + | sort -n | tail -5

# Code complexity (if radon available)
if command -v radon >/dev/null 2>&1; then
    echo "Code complexity analysis:"
    radon cc . --total-average --min=B | head -5
else
    echo "⚠️  Radon not available for complexity analysis"
fi
```

### Step 5: Documentation and Knowledge Capture
**Documentation Status Check**
```bash
echo "=== Documentation Status ==="

# Check for documentation files
DOC_FILES=$(find . -name "*.md" | wc -l)
echo "Documentation files: $DOC_FILES"

# Check docstring coverage
if command -v interrogate >/dev/null 2>&1; then
    echo "Checking docstring coverage..."
    interrogate . --verbose | tail -5
else
    echo "⚠️  Interrogate not available for docstring checking"
fi

# Check for README updates needed
if [ -f "README.md" ]; then
    echo "README.md last modified: $(stat -c %y README.md 2>/dev/null || stat -f %Sm README.md)"
else
    echo "⚠️  No README.md found"
fi
```

**Knowledge and Decision Documentation**
```bash
# Check for important comments and TODOs
echo "=== Knowledge Capture ==="

echo "Recent TODOs and FIXMEs:"
grep -r "TODO\|FIXME\|XXX" --include="*.py" . | head -5 || echo "No TODOs found"

echo "Important comments added:"
git diff --cached | grep "^+.*#" | head -5 || echo "No new comments in staged changes"
```

### Step 6: State Preservation and Checkpoint Creation
**Create Checkpoint Snapshot**
```bash
# Create checkpoint directory
CHECKPOINT_ID=$(date +%Y%m%d-%H%M%S)
mkdir -p .checkpoints
CHECKPOINT_DIR=".checkpoints/checkpoint-${CHECKPOINT_ID}"
mkdir -p "$CHECKPOINT_DIR"

echo "=== Creating Checkpoint: $CHECKPOINT_ID ==="

# Save current state information
cat > "${CHECKPOINT_DIR}/state.md" << EOF
# Checkpoint: $CHECKPOINT_ID

## Timestamp
- **Created**: $(date)
- **Git Commit**: $(git rev-parse HEAD 2>/dev/null || echo "No commits")
- **Git Branch**: $(git branch --show-current 2>/dev/null || echo "Not a git repo")

## Work Status
- **Files Changed**: $(git diff --name-only | wc -l)
- **Lines Added**: $(git diff --numstat | awk '{sum+=$1} END {print sum}')
- **Lines Removed**: $(git diff --numstat | awk '{sum+=$2} END {print sum}')
- **Uncommitted Changes**: $(git status --porcelain | wc -l) files

## Progress Summary
- **Task Completion**: $(grep -c "^- \[x\]" TASK.md 2>/dev/null || echo "0")/$(grep -c "^- \[" TASK.md 2>/dev/null || echo "0") tasks
- **Test Count**: $(pytest --co -q | wc -l 2>/dev/null || echo "0") tests
- **Documentation Files**: $(find . -name "*.md" | wc -l) files

## Quality Metrics
- **Code Quality**: $(ruff check . --statistics 2>/dev/null | grep "0 errors" && echo "PASS" || echo "ISSUES")
- **Test Status**: $(pytest --tb=no -q >/dev/null 2>&1 && echo "PASS" || echo "ISSUES")
- **Security**: $(bandit -r . -ll -f txt >/dev/null 2>&1 && echo "CLEAN" || echo "ISSUES")

## Next Steps Identified
[To be filled by checkpoint process]

EOF

# Save git status
git status > "${CHECKPOINT_DIR}/git-status.txt"
git diff --stat > "${CHECKPOINT_DIR}/changes-summary.txt"

# Save test results if available
if command -v pytest >/dev/null 2>&1; then
    pytest --tb=no -q > "${CHECKPOINT_DIR}/test-results.txt" 2>&1 || echo "Test issues detected"
fi

echo "Checkpoint saved to: $CHECKPOINT_DIR"
```

**Progress Documentation Update**
```bash
# Update TASK.md with checkpoint information
if [ -f "TASK.md" ]; then
    echo "" >> TASK.md
    echo "## Checkpoint: $(date)" >> TASK.md
    echo "- Progress checkpoint created at $(date)" >> TASK.md
    echo "- Checkpoint ID: $CHECKPOINT_ID" >> TASK.md
    echo "- Status: [Add current status]" >> TASK.md
    echo "" >> TASK.md
fi
```

### Step 7: Next Steps Planning and Recommendations
**Analysis and Recommendations**
- Analyze current progress against session objectives
- Identify bottlenecks and areas needing attention
- Plan next development phases and priorities
- Recommend quality improvements and optimizations
- Document lessons learned and best practices

**Next Steps Strategy**
- Define immediate next actions (next 1-2 hours)
- Plan short-term objectives (next session)
- Identify long-term goals and milestones
- Document dependencies and blockers
- Create actionable task breakdown

## Checkpoint Report Structure

### Progress Summary
```markdown
# Checkpoint Report: [CHECKPOINT_ID]

## Executive Summary
- **Checkpoint Time**: [Timestamp]
- **Overall Progress**: [Percentage]% complete
- **Quality Status**: [GOOD/ISSUES/CRITICAL]
- **Next Milestone**: [Description]
- **Estimated Completion**: [Timeline]

## Work Accomplished
### Code Changes
- **Files Modified**: [Count]
- **Lines Added**: [Count]
- **Lines Removed**: [Count]
- **Features Implemented**: [List]
- **Bugs Fixed**: [List]

### Quality Improvements
- **Tests Added**: [Count]
- **Documentation Updated**: [Yes/No]
- **Code Quality**: [Improved/Maintained/Degraded]
- **Security Issues**: [Resolved/New/None]

## Current Status Assessment
### Task Progress
- **Completed Tasks**: [Count]/[Total] ([Percentage]%)
- **In Progress**: [List of current tasks]
- **Blocked**: [List of blocked tasks]
- **Next Priority**: [Immediate next task]

### Quality Metrics
- **Test Coverage**: [Percentage]%
- **Code Quality Score**: [Score]
- **Security Status**: [Clean/Issues]
- **Documentation Coverage**: [Good/Partial/Poor]

### Technical Health
- **Build Status**: [Passing/Failing]
- **Dependencies**: [Up-to-date/Outdated/Conflicts]
- **Performance**: [Good/Degraded/Critical]
- **Resource Usage**: [Optimal/High/Critical]

## Issues and Blockers
### Critical Issues
1. **[Issue 1]**: [Description and impact]
2. **[Issue 2]**: [Description and impact]

### Minor Issues
1. **[Issue 1]**: [Description]
2. **[Issue 2]**: [Description]

### Blockers
1. **[Blocker 1]**: [Description and dependency]
2. **[Blocker 2]**: [Description and dependency]

## Recommendations
### Immediate Actions (Next 1-2 Hours)
- [ ] [Action 1]: [Description and reason]
- [ ] [Action 2]: [Description and reason]
- [ ] [Action 3]: [Description and reason]

### Short-term Priorities (Next Session)
- [ ] [Priority 1]: [Description and timeline]
- [ ] [Priority 2]: [Description and timeline]
- [ ] [Priority 3]: [Description and timeline]

### Quality Improvements
- [ ] [Improvement 1]: [Technical debt or quality issue]
- [ ] [Improvement 2]: [Performance or maintainability]
- [ ] [Improvement 3]: [Documentation or testing]

## Risk Assessment
### Technical Risks
- **Risk 1**: [Description] - [Mitigation plan]
- **Risk 2**: [Description] - [Mitigation plan]

### Schedule Risks
- **Risk 1**: [Description] - [Mitigation plan]
- **Risk 2**: [Description] - [Mitigation plan]

## Next Steps Plan
### Phase 1: Immediate (Next 2 hours)
1. [Step 1]: [Detailed action]
2. [Step 2]: [Detailed action]
3. [Step 3]: [Detailed action]

### Phase 2: Short-term (Next session)
1. [Step 1]: [Planned activity]
2. [Step 2]: [Planned activity]
3. [Step 3]: [Planned activity]

### Phase 3: Medium-term (Next week)
1. [Step 1]: [Strategic objective]
2. [Step 2]: [Strategic objective]
3. [Step 3]: [Strategic objective]

## Resources and Support Needed
- **Technical Resources**: [Tools, libraries, infrastructure]
- **Knowledge Resources**: [Documentation, training, expertise]
- **Time Resources**: [Realistic time estimates]
- **External Dependencies**: [Third-party requirements]

## Success Criteria for Next Checkpoint
- [ ] [Criterion 1]: [Measurable outcome]
- [ ] [Criterion 2]: [Measurable outcome]
- [ ] [Criterion 3]: [Measurable outcome]
- [ ] [Criterion 4]: [Quality standard]
```

## Checkpoint Quality Gates

### Mandatory Validations
- [ ] Code compiles and runs without critical errors
- [ ] Basic tests pass (if tests exist)
- [ ] No critical security vulnerabilities introduced
- [ ] Working tree state is documented
- [ ] Progress against objectives is measured

### Quality Validations
- [ ] Code style standards maintained
- [ ] Test coverage maintained or improved
- [ ] Documentation updated for changes
- [ ] Performance impact assessed
- [ ] Dependencies remain healthy

### Progress Validations
- [ ] Session objectives progress tracked
- [ ] Blockers and issues identified
- [ ] Next steps clearly defined
- [ ] Timeline and estimates updated
- [ ] Stakeholder communication planned

## Success Criteria
- **State Preserved**: Current work state fully documented
- **Progress Measured**: Clear progress metrics established
- **Quality Maintained**: Code quality standards upheld
- **Issues Identified**: Problems documented with solutions
- **Next Steps Planned**: Clear action plan for continuation

## Output Requirements

### File Locations
- Save checkpoint report as `.checkpoints/checkpoint-{CHECKPOINT_ID}/report.md`
- Save state information as `.checkpoints/checkpoint-{CHECKPOINT_ID}/state.md`
- Update `TASK.md` with checkpoint information
- Create next steps document as `.checkpoints/checkpoint-{CHECKPOINT_ID}/next-steps.md`

### Checkpoint Artifacts
- Comprehensive progress report
- Current state snapshot
- Quality assessment results
- Issue and blocker documentation
- Next steps action plan

Use this command to track progress, validate quality, and plan next development phases systematically.