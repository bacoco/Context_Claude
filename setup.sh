#!/bin/bash

# Enhanced Context Engineering Framework Setup Script
# This script validates and sets up the enhanced context engineering framework

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script version
VERSION="1.0.0"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to validate directory structure
validate_structure() {
    print_status "Validating directory structure..."
    
    local required_dirs=(
        ".claude"
        ".claude/commands"
        ".claude/commands/development"
        ".claude/commands/research"
        ".claude/commands/validation"
        ".claude/commands/workflow"
        ".claude/prompts"
        ".claude/templates"
        "docs"
        "examples"
        "PRPs"
    )
    
    local missing_dirs=()
    
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            missing_dirs+=("$dir")
        fi
    done
    
    if [ ${#missing_dirs[@]} -eq 0 ]; then
        print_success "Directory structure is valid"
        return 0
    else
        print_error "Missing directories:"
        for dir in "${missing_dirs[@]}"; do
            echo "  - $dir"
        done
        return 1
    fi
}

# Function to create missing directories
create_directories() {
    print_status "Creating missing directories..."
    
    local dirs=(
        ".claude"
        ".claude/commands"
        ".claude/commands/development"
        ".claude/commands/research"
        ".claude/commands/validation"
        ".claude/commands/workflow"
        ".claude/prompts"
        ".claude/templates"
        "docs"
        "examples"
        "PRPs"
    )
    
    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            print_status "Created directory: $dir"
        fi
    done
    
    # Create .gitkeep files in empty directories
    touch PRPs/.gitkeep
    
    print_success "Directory structure created"
}

# Function to validate required files
validate_files() {
    print_status "Validating required files..."
    
    local required_files=(
        "METHODOLOGY.md"
        "README.md"
        "config.json"
    )
    
    local missing_files=()
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            missing_files+=("$file")
        fi
    done
    
    if [ ${#missing_files[@]} -eq 0 ]; then
        print_success "Required files are present"
        return 0
    else
        print_error "Missing required files:"
        for file in "${missing_files[@]}"; do
            echo "  - $file"
        done
        return 1
    fi
}

# Function to validate command files
validate_commands() {
    print_status "Validating command files..."
    
    local command_files=(
        ".claude/commands/development/analyze-issue.md"
        ".claude/commands/development/implement-feature.md"
        ".claude/commands/development/quality-review.md"
        ".claude/commands/development/generate-enhanced-prp.md"
        ".claude/commands/development/execute-enhanced-prp.md"
        ".claude/commands/research/deep-research.md"
        ".claude/commands/research/documentation-scan.md"
        ".claude/commands/research/pattern-analysis.md"
        ".claude/commands/validation/comprehensive-test.md"
        ".claude/commands/validation/regression-check.md"
        ".claude/commands/validation/security-audit.md"
        ".claude/commands/workflow/session-start.md"
        ".claude/commands/workflow/checkpoint.md"
        ".claude/commands/workflow/task-complete.md"
    )
    
    local missing_commands=()
    
    for file in "${command_files[@]}"; do
        if [ ! -f "$file" ]; then
            missing_commands+=("$file")
        fi
    done
    
    if [ ${#missing_commands[@]} -eq 0 ]; then
        print_success "All command files are present"
        return 0
    else
        print_warning "Missing command files:"
        for file in "${missing_commands[@]}"; do
            echo "  - $file"
        done
        return 1
    fi
}

# Function to validate prompt files
validate_prompts() {
    print_status "Validating prompt files..."
    
    local prompt_files=(
        ".claude/prompts/system-methodology.md"
        ".claude/prompts/sequential-thinking.md"
        ".claude/prompts/file-operations.md"
        ".claude/prompts/bash-guidelines.md"
        ".claude/prompts/quality-gates.md"
    )
    
    local missing_prompts=()
    
    for file in "${prompt_files[@]}"; do
        if [ ! -f "$file" ]; then
            missing_prompts+=("$file")
        fi
    done
    
    if [ ${#missing_prompts[@]} -eq 0 ]; then
        print_success "All prompt files are present"
        return 0
    else
        print_warning "Missing prompt files:"
        for file in "${missing_prompts[@]}"; do
            echo "  - $file"
        done
        return 1
    fi
}

# Function to validate JSON config
validate_json() {
    print_status "Validating JSON configuration..."
    
    if command_exists python3; then
        python3 -c "import json; json.load(open('config.json'))" 2>/dev/null
        if [ $? -eq 0 ]; then
            print_success "JSON configuration is valid"
            return 0
        else
            print_error "JSON configuration is invalid"
            return 1
        fi
    else
        print_warning "Python3 not found, skipping JSON validation"
        return 0
    fi
}

# Function to check dependencies
check_dependencies() {
    print_status "Checking dependencies..."
    
    local dependencies=(
        "git"
        "python3"
    )
    
    local missing_deps=()
    
    for dep in "${dependencies[@]}"; do
        if ! command_exists "$dep"; then
            missing_deps+=("$dep")
        fi
    done
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        print_success "All dependencies are available"
        return 0
    else
        print_warning "Missing optional dependencies:"
        for dep in "${missing_deps[@]}"; do
            echo "  - $dep"
        done
        return 0
    fi
}

# Function to set up git hooks (if git is available)
setup_git_hooks() {
    if command_exists git && [ -d ".git" ]; then
        print_status "Setting up git hooks..."
        
        # Create pre-commit hook for validation
        cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Enhanced Context Engineering Framework pre-commit hook

echo "Running pre-commit validation..."

# Check if config.json is valid
if command -v python3 >/dev/null 2>&1; then
    python3 -c "import json; json.load(open('config.json'))" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Error: config.json is not valid JSON"
        exit 1
    fi
fi

# Check if required files exist
required_files=("METHODOLOGY.md" "README.md" "config.json")
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: Missing required file: $file"
        exit 1
    fi
done

echo "Pre-commit validation passed"
EOF
        
        chmod +x .git/hooks/pre-commit
        print_success "Git hooks set up"
    else
        print_status "Git not available or not a git repository, skipping git hooks"
    fi
}

# Function to create example files
create_examples() {
    print_status "Creating example files..."
    
    # Create sample PRP
    cat > examples/sample-prp.md << 'EOF'
# Sample Product Requirements Prompt (PRP)

## Overview
This is a sample PRP demonstrating the structure and content expected for feature requirements.

## Feature Description
A simple user authentication system with login/logout functionality.

## Requirements
- User can register with email and password
- User can login with valid credentials
- User can logout and session is terminated
- Passwords are securely hashed
- Basic input validation

## Technical Specifications
- Use secure password hashing (bcrypt)
- Implement session management
- Add input validation for email format
- Include rate limiting for login attempts

## Acceptance Criteria
- [ ] User can successfully register
- [ ] User can login with correct credentials
- [ ] User cannot login with incorrect credentials
- [ ] User can logout successfully
- [ ] Passwords are properly hashed
- [ ] Basic security measures are in place
EOF

    # Create implementation example
    cat > examples/implementation-example.md << 'EOF'
# Implementation Example

## Overview
This example shows how to use the enhanced context engineering framework to implement a feature.

## Step 1: Analysis
Use `/project:development:analyze-issue` to understand the requirements.

## Step 2: Research
Use `/project:research:deep-research` if additional research is needed.

## Step 3: Implementation
Use `/project:development:implement-feature` for systematic implementation.

## Step 4: Validation
Use `/project:validation:comprehensive-test` to ensure quality.

## Step 5: Completion
Use `/project:workflow:task-complete` to finalize the task.

## Best Practices
- Always start with session initialization
- Use sequential thinking for complex problems
- Follow the 7-step methodology
- Never skip validation steps
- Document all decisions and changes
EOF

    print_success "Example files created"
}

# Function to create documentation
create_documentation() {
    print_status "Creating documentation files..."
    
    # Create workflow guide
    cat > docs/workflow-guide.md << 'EOF'
# Workflow Guide

## Overview
This guide explains how to use the enhanced context engineering framework effectively.

## Basic Workflow
1. Initialize session with `/project:workflow:session-start`
2. Analyze requirements with `/project:development:analyze-issue`
3. Research if needed with `/project:research:deep-research`
4. Implement with `/project:development:implement-feature`
5. Validate with `/project:validation:comprehensive-test`
6. Complete with `/project:workflow:task-complete`

## Advanced Workflows
- Feature Development: PRP → Implementation → Validation
- Bug Fixing: Analysis → Research → Fix → Testing
- Code Review: Quality Review → Security Audit → Documentation

## Best Practices
- Use systematic thinking for complex problems
- Always validate before completion
- Document all decisions and changes
- Follow the 7-step methodology consistently
EOF

    # Create troubleshooting guide
    cat > docs/troubleshooting.md << 'EOF'
# Troubleshooting Guide

## Common Issues

### Commands Not Appearing
**Problem:** Commands don't appear in AI assistant's slash menu
**Solution:** 
- Check directory structure with `./setup.sh validate`
- Ensure files have correct markdown format
- Restart your AI assistant

### Validation Failures
**Problem:** Quality gates failing
**Solution:**
- Check config.json settings
- Verify all tests pass
- Review code style and formatting

### Performance Issues
**Problem:** Commands running slowly
**Solution:**
- Reduce thinking depth for simple tasks
- Use basic preset for routine operations
- Clear cache directory if needed

## Getting Help
- Check documentation in `docs/` directory
- Review examples in `examples/` directory
- Validate setup with `./setup.sh validate`
EOF

    print_success "Documentation files created"
}

# Function to show usage
show_usage() {
    echo "Enhanced Context Engineering Framework Setup Script v$VERSION"
    echo
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  install     Install and set up the framework"
    echo "  validate    Validate the current installation"
    echo "  repair      Repair missing files and directories"
    echo "  help        Show this help message"
    echo
    echo "Examples:"
    echo "  $0 install    # Full installation"
    echo "  $0 validate   # Validate current setup"
    echo "  $0 repair     # Fix missing components"
}

# Function to run full installation
install_framework() {
    print_status "Installing Enhanced Context Engineering Framework v$VERSION"
    echo
    
    # Create directories
    create_directories
    
    # Create example files
    create_examples
    
    # Create documentation
    create_documentation
    
    # Set up git hooks
    setup_git_hooks
    
    # Validate installation
    validate_installation
    
    echo
    print_success "Installation completed successfully!"
    echo
    print_status "Next steps:"
    echo "1. Start your AI assistant in this directory"
    echo "2. Type '/' to see available commands"
    echo "3. Begin with /project:workflow:session-start"
}

# Function to validate installation
validate_installation() {
    print_status "Validating installation..."
    echo
    
    local validation_passed=true
    
    # Check dependencies
    check_dependencies
    
    # Validate structure
    if ! validate_structure; then
        validation_passed=false
    fi
    
    # Validate files
    if ! validate_files; then
        validation_passed=false
    fi
    
    # Validate JSON
    if ! validate_json; then
        validation_passed=false
    fi
    
    # Validate commands (warning only)
    validate_commands
    
    # Validate prompts (warning only)
    validate_prompts
    
    echo
    if [ "$validation_passed" = true ]; then
        print_success "Validation completed successfully!"
        return 0
    else
        print_error "Validation failed. Run '$0 repair' to fix issues."
        return 1
    fi
}

# Function to repair installation
repair_installation() {
    print_status "Repairing installation..."
    echo
    
    # Create missing directories
    create_directories
    
    # Recreate examples if missing
    if [ ! -f "examples/sample-prp.md" ]; then
        create_examples
    fi
    
    # Recreate documentation if missing
    if [ ! -f "docs/workflow-guide.md" ]; then
        create_documentation
    fi
    
    # Validate after repair
    validate_installation
}

# Main script logic
main() {
    case "${1:-install}" in
        "install")
            install_framework
            ;;
        "validate")
            validate_installation
            ;;
        "repair")
            repair_installation
            ;;
        "help"|"-h"|"--help")
            show_usage
            ;;
        *)
            print_error "Unknown option: $1"
            echo
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"