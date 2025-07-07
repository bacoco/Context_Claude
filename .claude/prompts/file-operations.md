# File Operations Guidelines

## Overview
Custom editing tool for viewing, creating and editing files. State is persistent across command calls and discussions with the user.

## Core Capabilities

### View Operations
- If `path` is a file, `view` displays the result of applying `cat -n`
- If `path` is a directory, `view` lists non-hidden files and directories up to 2 levels deep
- Long outputs will be truncated and marked with `<TRUNCATED>`

### File Management Operations
- **create**: Create a new file with specified content
- **str_replace**: Replace exact string matches in files
- **remove**: Delete files or directories
- **copy**: Copy files or directories
- **move**: Move or rename files or directories

## Critical Rules

### Create Command
- The `create` command **cannot** be used if the specified `path` already exists as a file
- **IMPORTANT**: If you know that the `path` already exists, you must remove it first and then perform the `create` operation

### String Replace Command
- The `old_str` parameter must match **EXACTLY** one or more consecutive lines from the original file
- **Be mindful of whitespaces** - they must match exactly
- If the `old_str` parameter is not unique in the file, the replacement will not be performed
- Make sure to include enough context in `old_str` to make it unique
- The `new_str` parameter should contain the edited lines that should replace the `old_str`

## Best Practices

### Pre-Operation Verification
1. Always verify file paths before operations
2. Use `view` to inspect files before editing
3. Check if file exists before using `create`
4. Understand directory structure before moving/copying

### Safe Editing Practices
1. Make backups of important files before major changes
2. Test changes in small increments
3. Use precise string matching for replacements
4. Verify changes after each operation

### String Replacement Strategy
1. Include enough context to ensure uniqueness
2. Copy exact whitespace from original
3. Include complete lines (don't split mid-line)
4. Consider using multiple smaller replacements for complex changes

## Common Patterns

### Safe File Creation
```python
# First check if file exists
view("path/to/file.py")
# If it exists, remove it
remove("path/to/file.py")
# Then create new file
create("path/to/file.py", "content")
```

### Precise String Replacement
```python
# View file first to see exact content
view("file.py")
# Use exact match including whitespace
str_replace("file.py", 
    "def old_function():\n    return 'old'",
    "def new_function():\n    return 'new'"
)
```

### Multi-Line Replacement
```python
# Include multiple complete lines for uniqueness
str_replace("config.py",
    "# Configuration settings\nDEBUG = False\nTIMEOUT = 30",
    "# Configuration settings\nDEBUG = True\nTIMEOUT = 60"
)
```

## Error Prevention

### Common Mistakes to Avoid
1. Using `create` on existing files (use remove first)
2. Partial line matches in `str_replace`
3. Missing whitespace in string matches
4. Not verifying paths before operations
5. Making assumptions about file content

### Debugging Failed Operations
1. Use `view` to see exact file content
2. Check for hidden characters or spaces
3. Ensure complete line matches
4. Verify unique string selection
5. Check file permissions

## Integration with 7-Step Methodology

### Step 2 (Explore): Use view extensively
### Step 3 (Reproduce): Create test scripts carefully
### Step 5 (Develop): Make incremental edits
### Step 6 (Verify): View files after changes
### Step 7 (Document): Update documentation files

## File Operation Checklist
- [ ] Path verified before operation
- [ ] File viewed before editing
- [ ] Exact string match confirmed
- [ ] Whitespace preserved exactly
- [ ] Changes verified after operation
- [ ] Backups made if needed
- [ ] Error handling considered

## Remember
- Precision is critical in file operations
- Always verify before modifying
- State persists across operations
- Small, incremental changes are safer
- Documentation prevents future issues