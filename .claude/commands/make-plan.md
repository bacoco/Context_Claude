---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Simple wrapper - Create a development plan from your description
---

# `/make-plan` - Simple Planning Command

Transforms your idea into a detailed development plan using the full power of the framework.

## Usage

```bash
/make-plan "your feature description"
```

## How It Works

This command automatically:
1. Creates an initial requirements document
2. Runs the comprehensive PRP generation process
3. Produces a complete development plan

## Implementation

```bash
# Step 1: Create initial file with user's description
echo "# Feature Request

$USER_DESCRIPTION

## Context
- Framework: Context Engineering
- Approach: Systematic development
- Quality: Built-in validation

## Requirements
[To be analyzed and expanded]
" > INITIAL.md

# Step 2: Generate comprehensive PRP
/project:development:generate-enhanced-prp

# The framework handles everything else!
```

## Examples

```bash
/make-plan "user authentication with JWT"
/make-plan "REST API for blog posts"  
/make-plan "real-time chat feature"
```

## Output

Creates a detailed PRP document in `PRPs/` ready for `/build`.

## Next Steps

```bash
gemini check    # Optional review
/build          # Execute the plan
```