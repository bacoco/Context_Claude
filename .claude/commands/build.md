---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Simple wrapper - Build your feature from the generated plan
---

# `/build` - Simple Build Command

Executes the development plan created by `/make-plan`.

## Usage

```bash
/build                    # Builds the latest plan
/build "specific-plan"    # Builds a specific plan
```

## How It Works

This command automatically:
1. Finds the most recent PRP (or specified one)
2. Executes systematic implementation
3. Runs all quality checks
4. Validates the result

## Implementation

```bash
# Step 1: Find the PRP to execute
# (Either latest in PRPs/ or user-specified)

# Step 2: Execute with full framework power
/project:development:execute-enhanced-prp

# The framework handles:
# - Code generation
# - Testing
# - Documentation
# - Quality gates
```

## What Happens

1. **Reads the Plan** - Loads your PRP document
2. **Sets Up Environment** - Prepares development setup
3. **Implements Features** - Writes code systematically
4. **Tests Everything** - Comprehensive validation
5. **Documents Results** - Updates all documentation

## Examples

```bash
# Build the latest plan
/build

# Build specific plan
/build "user-auth"
```

## Quality Assurance

Automatic checks:
- ✅ All tests pass
- ✅ Code quality standards
- ✅ Security validation
- ✅ Documentation complete

## Next Steps

After building:
```bash
gemini check         # Review the implementation
git status           # See what was created
npm test             # Run tests
```