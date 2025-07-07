---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Session initialization with context setup, environment validation, and workflow preparation
---

# Session Initialization and Context Setup

## Context
This command performs systematic session initialization with comprehensive context setup and validation. Use this command at the start of each work session to ensure proper environment setup, context loading, and workflow preparation.

## Session Initialization Process

### Step 1: Environment Validation and Setup
**System Environment Check**
```bash
# Check system information
echo "=== System Information ==="
uname -a
python --version
git --version
node --version 2>/dev/null || echo "Node.js not installed"

# Check current directory and git status
echo "=== Current Working Directory ==="
pwd
ls -la

echo "=== Git Repository Status ==="
git status --porcelain
git branch --show-current
git log --oneline -5
```

**Development Environment Validation**
```bash
# Check Python environment
echo "=== Python Environment ==="
which python
python -c "import sys; print(f'Python path: {sys.executable}')"
python -c "import sys; print(f'Python version: {sys.version}')"

# Check virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
    echo "Virtual environment active: $VIRTUAL_ENV"
else
    echo "No virtual environment detected"
fi

# Check required dependencies
echo "=== Checking Dependencies ==="
pip list | grep -E "pytest|black|ruff|mypy" || echo "Some development tools missing"
```

### Step 2: Project Context Loading and Analysis
**Project Documentation Review**
```bash
# Load project planning documentation
if [ -f "PLANNING.md" ]; then
    echo "=== PLANNING.md Found - Loading Project Context ==="
    echo "Reading project architecture, goals, and constraints..."
    head -20 PLANNING.md
else
    echo "⚠️  PLANNING.md not found - consider creating project planning documentation"
fi

# Check task management
if [ -f "TASK.md" ]; then
    echo "=== TASK.md Found - Loading Current Tasks ==="
    echo "Reviewing current tasks and progress..."
    head -20 TASK.md
else
    echo "⚠️  TASK.md not found - creating task management file"
    cat > TASK.md << 'EOF'
# Task Management

## Current Tasks
- [ ] Initialize project
- [ ] Set up development environment
- [ ] Define project structure

## Completed Tasks
- [x] Session initialization started

## Notes
- Session started: $(date)
EOF
fi
```

**Codebase Structure Analysis**
```bash
# Analyze project structure
echo "=== Project Structure Analysis ==="
tree -I '.git|node_modules|__pycache__|*.pyc|.venv|venv' -L 3 || ls -la

# Check for key configuration files
echo "=== Configuration Files ==="
ls -la | grep -E "(config|requirements|package\.json|Dockerfile|docker-compose)"

# Analyze code organization
echo "=== Code Organization ==="
find . -name "*.py" | head -10
find . -name "*.js" | head -10
find . -name "*.md" | grep -v node_modules | head -10
```

### Step 3: Quality and Standards Validation
**Code Quality Baseline**
```bash
# Check code formatting status
echo "=== Code Quality Status ==="
if command -v black >/dev/null 2>&1; then
    echo "Checking code formatting with Black..."
    black . --check --diff || echo "Code formatting issues found"
else
    echo "⚠️  Black not installed"
fi

if command -v ruff >/dev/null 2>&1; then
    echo "Checking code style with Ruff..."
    ruff check . --statistics || echo "Code style issues found"
else
    echo "⚠️  Ruff not installed"
fi

# Check test status
if [ -d "tests" ]; then
    echo "=== Test Suite Status ==="
    find tests/ -name "*.py" | wc -l
    pytest --co -q | wc -l 2>/dev/null || echo "Pytest not available or configured"
else
    echo "⚠️  No tests directory found"
fi
```

**Security and Dependencies Check**
```bash
# Check for security issues
echo "=== Security Status ==="
if command -v bandit >/dev/null 2>&1; then
    bandit -r . -ll -f txt 2>/dev/null | head -10 || echo "No critical security issues found"
else
    echo "⚠️  Bandit security scanner not installed"
fi

# Check dependency status
echo "=== Dependency Status ==="
if [ -f "requirements.txt" ]; then
    pip check || echo "Dependency conflicts detected"
    
    if command -v safety >/dev/null 2>&1; then
        safety check --short-report || echo "Security vulnerabilities in dependencies"
    fi
else
    echo "⚠️  No requirements.txt found"
fi
```

### Step 4: Workflow and Tool Configuration
**Development Tools Setup**
```bash
# Configure git if needed
echo "=== Git Configuration ==="
git config user.name || echo "⚠️  Git user.name not configured"
git config user.email || echo "⚠️  Git user.email not configured"

# Check pre-commit hooks
if [ -f ".pre-commit-config.yaml" ]; then
    echo "Pre-commit configuration found"
    pre-commit --version >/dev/null 2>&1 || echo "⚠️  Pre-commit not installed"
else
    echo "⚠️  No pre-commit configuration found"
fi

# Check editor configuration
if [ -f ".editorconfig" ]; then
    echo "EditorConfig found"
else
    echo "⚠️  No .editorconfig found - consider adding for consistent formatting"
fi
```

**IDE and Development Environment**
```bash
# Check VS Code configuration
if [ -d ".vscode" ]; then
    echo "=== VS Code Configuration ==="
    ls -la .vscode/
else
    echo "⚠️  No VS Code configuration found"
fi

# Check AI assistant configuration
if [ -d ".claude" ]; then
    echo "=== AI Assistant Framework Configuration ==="
    ls -la .claude/
    echo "Commands available:"
    find .claude/commands/ -name "*.md" 2>/dev/null | sort || echo "No commands found"
else
    echo "⚠️  No .claude configuration found"
fi
```

### Step 5: Session State and Context Preparation
**Session Context Creation**
```bash
# Create session context file
SESSION_ID=$(date +%Y%m%d-%H%M%S)
mkdir -p .session
cat > .session/context-${SESSION_ID}.md << EOF
# Session Context: ${SESSION_ID}

## Session Information
- **Start Time**: $(date)
- **Working Directory**: $(pwd)
- **Git Branch**: $(git branch --show-current 2>/dev/null || echo "Not a git repository")
- **Python Version**: $(python --version 2>&1)
- **Virtual Environment**: ${VIRTUAL_ENV:-"Not activated"}

## Project Status
- **Last Commit**: $(git log -1 --oneline 2>/dev/null || echo "No commits")
- **Working Tree**: $(git status --porcelain | wc -l) modified files
- **Stash Status**: $(git stash list | wc -l) stashed changes

## Environment Status
- **Dependencies**: $(pip list | wc -l) packages installed
- **Test Status**: $(find tests/ -name "*.py" 2>/dev/null | wc -l) test files
- **Documentation**: $(find . -name "*.md" | wc -l) markdown files

## Session Goals
- [ ] Define session objectives
- [ ] Review current tasks
- [ ] Plan implementation approach
- [ ] Set up monitoring and validation

## Notes
- Session context saved to .session/context-${SESSION_ID}.md
- Use /project:workflow:checkpoint to save progress
- Use /project:workflow:task-complete when finished
EOF

echo "Session context created: .session/context-${SESSION_ID}.md"
```

**Workflow Preparation**
- Set up workspace for efficient development
- Configure monitoring and logging
- Prepare debugging and testing environment
- Establish quality gates and validation criteria
- Create session objectives and success criteria

### Step 6: Session Objectives and Planning
**Session Goal Definition**
- Review current project status and priorities
- Define specific session objectives and deliverables
- Identify dependencies and blockers
- Plan implementation approach and methodology
- Set quality standards and validation criteria

**Task Prioritization and Planning**
- Review open tasks and issues
- Prioritize work based on impact and urgency
- Break down complex tasks into manageable steps
- Estimate effort and timeline for session goals
- Plan validation and testing approach

### Step 7: Session Readiness Validation
**Readiness Checklist Validation**
- Environment is properly configured
- Required tools and dependencies are available
- Project context is loaded and understood
- Session objectives are clearly defined
- Quality standards and criteria are established

**Final Session Setup**
- Activate appropriate development environment
- Set up monitoring and logging
- Configure IDE and development tools
- Prepare debugging and testing setup
- Document session start and objectives

## Session Initialization Report

### Session Status Summary
```markdown
# Session Initialization Report

## Session Information
- **Session ID**: [Generated ID]
- **Start Time**: [Timestamp]
- **Duration**: [Setup time]
- **Status**: [SUCCESS/ISSUES/FAILED]

## Environment Status
### Development Environment ✅/⚠️/❌
- **Python Version**: [Version]
- **Virtual Environment**: [Active/Not Active]
- **Git Repository**: [Clean/Modified/Issues]
- **Dependencies**: [OK/Issues/Missing]

### Project Context ✅/⚠️/❌
- **PLANNING.md**: [Found/Missing]
- **TASK.md**: [Found/Created/Missing]
- **Configuration**: [Complete/Partial/Missing]
- **Documentation**: [Complete/Partial/Missing]

### Quality Tools ✅/⚠️/❌
- **Code Formatting**: [OK/Issues/Not configured]
- **Linting**: [OK/Issues/Not configured]
- **Testing**: [OK/Issues/Not configured]
- **Security**: [OK/Issues/Not configured]

## Session Objectives
### Primary Goals
- [ ] [Objective 1]
- [ ] [Objective 2]
- [ ] [Objective 3]

### Secondary Goals
- [ ] [Nice to have 1]
- [ ] [Nice to have 2]
- [ ] [Nice to have 3]

## Quality Standards
- **Code Quality**: [Standards and tools]
- **Testing**: [Requirements and coverage]
- **Documentation**: [Standards and completeness]
- **Security**: [Requirements and validation]

## Issues Identified
### Critical Issues (Must Fix)
1. [Issue 1]: [Description and impact]
2. [Issue 2]: [Description and impact]

### Minor Issues (Nice to Fix)
1. [Issue 1]: [Description]
2. [Issue 2]: [Description]

## Next Steps
1. [Action 1]: [Description]
2. [Action 2]: [Description]
3. [Action 3]: [Description]

## Session Context
- **Context File**: .session/context-[SESSION_ID].md
- **Working Branch**: [Branch name]
- **Last Checkpoint**: [Previous checkpoint if any]
```

## Session Initialization Checklist

### Pre-Session Setup
- [ ] Navigate to correct project directory
- [ ] Activate appropriate virtual environment
- [ ] Verify git repository status
- [ ] Check system requirements
- [ ] Load project documentation

### Environment Validation
- [ ] Python environment configured correctly
- [ ] Required dependencies installed
- [ ] Development tools available
- [ ] Git configuration valid
- [ ] Project structure verified

### Context Loading
- [ ] PLANNING.md reviewed
- [ ] TASK.md updated with current status
- [ ] Previous session context reviewed
- [ ] Project status understood
- [ ] Quality standards confirmed

### Session Planning
- [ ] Session objectives defined
- [ ] Work priorities established
- [ ] Implementation approach planned
- [ ] Quality criteria set
- [ ] Success metrics defined

### Tool Configuration
- [ ] IDE/editor configured
- [ ] Debugging environment ready
- [ ] Testing framework configured
- [ ] Version control ready
- [ ] Monitoring and logging set up

## Quick Commands Reference

### Essential Commands for Session
```bash
# Environment check
python --version && git status

# Quality check
black . --check && ruff check .

# Test status
pytest --co -q

# Dependency check
pip check && safety check

# Project structure
tree -I '.git|__pycache__|.venv' -L 2
```

### Session Management
```bash
# Create checkpoint
/project:workflow:checkpoint

# Task completion
/project:workflow:task-complete

# Session context
cat .session/context-*.md
```

## Success Criteria
- **Environment Ready**: All tools and dependencies available
- **Context Loaded**: Project understanding established
- **Goals Defined**: Clear session objectives set
- **Quality Standards**: Standards and criteria established
- **Workflow Prepared**: Ready for productive development

## Output Requirements

### File Locations
- Save session context as `.session/context-{SESSION_ID}.md`
- Update `TASK.md` with session start
- Create session log as `.session/log-{SESSION_ID}.txt`
- Update project status documentation

### Session Artifacts
- Session initialization report
- Environment validation results
- Context loading summary
- Objective and planning documentation
- Quality standards checklist

Use this command to ensure proper session initialization and productive development workflow setup.