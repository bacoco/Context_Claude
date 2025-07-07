#!/bin/bash

# Enhanced Context Engineering Framework - Setup Validator
# This script performs comprehensive validation of the framework installation

set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters for summary
TOTAL_CHECKS=0
PASSED_CHECKS=0
WARNINGS=0
ERRORS=0

# Function to print colored output
print_header() {
    echo -e "\n${BLUE}==== $1 ====${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
    ((PASSED_CHECKS++))
    ((TOTAL_CHECKS++))
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
    ((ERRORS++))
    ((TOTAL_CHECKS++))
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    ((WARNINGS++))
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Header
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║     Enhanced Context Engineering Framework Validator          ║"
echo "║                    Version 2.0                                ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check 1: Directory Structure
print_header "Checking Directory Structure"

directories=(
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

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        print_success "Directory exists: $dir"
    else
        print_error "Missing directory: $dir"
    fi
done

# Check 2: Core Files
print_header "Checking Core Files"

core_files=(
    "METHODOLOGY.md"
    "README.md"
    "config.json"
    "setup.sh"
    "LICENSE"
    ".gitignore"
    "GETTING_STARTED.md"
)

for file in "${core_files[@]}"; do
    if [ -f "$file" ]; then
        print_success "Core file exists: $file"
    else
        print_error "Missing core file: $file"
    fi
done

# Check 3: Command Files
print_header "Checking Command Files"

# Development commands
dev_commands=(
    "analyze-issue.md"
    "implement-feature.md"
    "quality-review.md"
    "generate-enhanced-prp.md"
    "execute-enhanced-prp.md"
)

for cmd in "${dev_commands[@]}"; do
    if [ -f ".claude/commands/development/$cmd" ]; then
        print_success "Development command: $cmd"
    else
        print_error "Missing development command: $cmd"
    fi
done

# Research commands
research_commands=(
    "deep-research.md"
    "documentation-scan.md"
    "pattern-analysis.md"
)

for cmd in "${research_commands[@]}"; do
    if [ -f ".claude/commands/research/$cmd" ]; then
        print_success "Research command: $cmd"
    else
        print_error "Missing research command: $cmd"
    fi
done

# Validation commands
validation_commands=(
    "comprehensive-test.md"
    "regression-check.md"
    "security-audit.md"
)

for cmd in "${validation_commands[@]}"; do
    if [ -f ".claude/commands/validation/$cmd" ]; then
        print_success "Validation command: $cmd"
    else
        print_error "Missing validation command: $cmd"
    fi
done

# Workflow commands
workflow_commands=(
    "session-start.md"
    "checkpoint.md"
    "task-complete.md"
)

for cmd in "${workflow_commands[@]}"; do
    if [ -f ".claude/commands/workflow/$cmd" ]; then
        print_success "Workflow command: $cmd"
    else
        print_error "Missing workflow command: $cmd"
    fi
done

# Check 4: Prompt Files
print_header "Checking Prompt Files"

prompt_files=(
    "system-methodology.md"
    "sequential-thinking.md"
    "file-operations.md"
    "bash-guidelines.md"
    "quality-gates.md"
)

for prompt in "${prompt_files[@]}"; do
    if [ -f ".claude/prompts/$prompt" ]; then
        print_success "Prompt file: $prompt"
    else
        print_error "Missing prompt file: $prompt"
    fi
done

# Check 5: Template Files
print_header "Checking Template Files"

template_files=(
    "prp-template.md"
    "issue-template.md"
)

for template in "${template_files[@]}"; do
    if [ -f ".claude/templates/$template" ]; then
        print_success "Template file: $template"
    else
        print_error "Missing template file: $template"
    fi
done

# Check 6: Documentation Files
print_header "Checking Documentation"

doc_files=(
    "workflow-guide.md"
    "troubleshooting.md"
)

for doc in "${doc_files[@]}"; do
    if [ -f "docs/$doc" ]; then
        print_success "Documentation: $doc"
    else
        print_error "Missing documentation: $doc"
    fi
done

# Check 7: Example Files
print_header "Checking Examples"

example_files=(
    "sample-prp.md"
    "implementation-example.md"
)

for example in "${example_files[@]}"; do
    if [ -f "examples/$example" ]; then
        print_success "Example file: $example"
    else
        print_error "Missing example: $example"
    fi
done

# Check 8: Configuration Validation
print_header "Validating Configuration"

if [ -f "config.json" ]; then
    # Check if jq is available
    if command -v jq &> /dev/null; then
        if jq empty config.json 2>/dev/null; then
            print_success "config.json is valid JSON"
            
            # Check for required fields
            if jq -e '.validation_level' config.json > /dev/null 2>&1; then
                print_success "config.json has validation_level"
            else
                print_warning "config.json missing validation_level field"
            fi
            
            if jq -e '.test_coverage_minimum' config.json > /dev/null 2>&1; then
                coverage=$(jq -r '.test_coverage_minimum' config.json)
                if [ "$coverage" -ge 80 ]; then
                    print_success "Test coverage minimum is $coverage% (≥80%)"
                else
                    print_warning "Test coverage minimum is $coverage% (recommended ≥80%)"
                fi
            else
                print_warning "config.json missing test_coverage_minimum field"
            fi
        else
            print_error "config.json is not valid JSON"
        fi
    else
        print_warning "jq not installed - skipping JSON validation"
    fi
fi

# Check 9: File Permissions
print_header "Checking File Permissions"

if [ -x "setup.sh" ]; then
    print_success "setup.sh is executable"
else
    print_error "setup.sh is not executable"
    print_info "Run: chmod +x setup.sh"
fi

if [ -f "validate_setup.sh" ] && [ -x "validate_setup.sh" ]; then
    print_success "validate_setup.sh is executable"
elif [ -f "validate_setup.sh" ]; then
    print_warning "validate_setup.sh exists but is not executable"
    print_info "Run: chmod +x validate_setup.sh"
fi

# Check 10: Command File Format
print_header "Validating Command File Format"

# Check a sample command file for proper format
sample_cmd=".claude/commands/development/analyze-issue.md"
if [ -f "$sample_cmd" ]; then
    if grep -q "^---$" "$sample_cmd" && grep -q "^allowed-tools:" "$sample_cmd"; then
        print_success "Command files have proper frontmatter format"
    else
        print_error "Command files missing proper frontmatter"
    fi
else
    print_warning "Cannot validate command format - sample file missing"
fi

# Check 11: Git Repository (optional)
print_header "Checking Version Control"

if [ -d ".git" ]; then
    print_success "Git repository initialized"
    
    # Check if .gitignore is properly configured
    if grep -q "PRPs/\*.md" .gitignore 2>/dev/null; then
        print_success ".gitignore configured for PRPs"
    else
        print_warning ".gitignore may need PRPs pattern"
    fi
else
    print_info "Not a git repository (optional)"
fi

# Check 12: Dependencies
print_header "Checking Dependencies"

# Python
if command -v python3 &> /dev/null; then
    python_version=$(python3 --version 2>&1 | cut -d' ' -f2)
    print_success "Python installed: $python_version"
else
    print_warning "Python 3 not found (required for some features)"
fi

# Summary
print_header "Validation Summary"

echo -e "\nTotal Checks: $TOTAL_CHECKS"
echo -e "${GREEN}Passed: $PASSED_CHECKS${NC}"
echo -e "${YELLOW}Warnings: $WARNINGS${NC}"
echo -e "${RED}Errors: $ERRORS${NC}"

# Overall Status
echo
if [ $ERRORS -eq 0 ]; then
    if [ $WARNINGS -eq 0 ]; then
        echo -e "${GREEN}✅ All checks passed! The framework is properly installed.${NC}"
        exit 0
    else
        echo -e "${YELLOW}⚠️  Setup is functional but has warnings. Review above for improvements.${NC}"
        exit 0
    fi
else
    echo -e "${RED}❌ Setup has errors that need to be fixed. Run ./setup.sh to fix issues.${NC}"
    exit 1
fi