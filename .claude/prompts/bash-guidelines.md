# Bash Command Guidelines

## Overview
Run commands in a bash shell with persistent state across command calls and discussions. Access to common Linux and Python packages via apt and pip.

## Important Notes
- Command contents do NOT need XML escaping
- State persists across all command calls
- Avoid commands producing very large outputs
- Run long-lived commands in background (e.g., `sleep 10 &`)

## Common Useful Commands

### File and Directory Operations
- **find**: Locate files and directories
- **grep**: Search text patterns in files
- **ls**: List directory contents
- **cd**: Change directory
- **pwd**: Print working directory
- **cat**: Display file contents
- **head/tail**: Display first/last lines of files
- **wc**: Count lines, words, characters
- **sed**: Stream editor for file manipulation

### Process Management
- **ps**: List running processes
- **kill**: Terminate processes
- **jobs**: List background jobs
- **fg/bg**: Foreground/background job control

### File Permissions and Archives
- **chmod**: Change file permissions
- **chown**: Change file ownership
- **tar**: Archive and extract files
- **zip/unzip**: Compress and decompress files

### Network and Downloads
- **curl/wget**: Download files from URLs
- **ping**: Test network connectivity
- **netstat**: Network statistics

### Development Tools
- **git**: Version control operations
- **pip**: Python package management
- **python**: Run Python scripts
- **node**: Run Node.js scripts
- **npm**: Node.js package management
- **make**: Build automation

## Best Practices

### Path Management
1. Use absolute paths when possible
2. Verify current directory with `pwd`
3. Use `$HOME` for home directory references
4. Quote paths with spaces

### Output Handling
1. Check command output before proceeding
2. Use appropriate flags for human-readable output
3. Redirect large outputs to files
4. Use `head`/`tail` for sampling large files

### Error Handling
1. Check exit codes with `$?`
2. Use `set -e` for script error handling
3. Implement proper error messages
4. Clean up on failure

### Performance Considerations
1. Monitor resource usage for long-running commands
2. Use pipes and redirection effectively
3. Run intensive tasks in background
4. Set appropriate timeouts

## Example Usage Patterns

### File Search Operations
```bash
# Search for Python files
find /path -name "*.py" -type f

# Search in files with context
grep -r "pattern" /path/to/search -n -C 3

# Find files modified in last day
find . -type f -mtime -1
```

### Process Management
```bash
# Check running processes
ps aux | grep process_name

# Monitor resource usage
top -bn1 | head -20

# Kill process by name
pkill -f "process_pattern"
```

### File Analysis
```bash
# Count lines in files
wc -l filename

# Compare files
diff -u file1 file2

# Extract specific lines
sed -n '10,25p' /path/to/file
```

### Development Workflows
```bash
# Git operations
git status && git diff
git log --oneline -10

# Python environment
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Run tests
python -m pytest -v
```

### Archive Operations
```bash
# Create archive
tar -czf archive.tar.gz directory/

# Extract archive
tar -xzf archive.tar.gz

# List archive contents
tar -tzf archive.tar.gz
```

## Safety Guidelines

### Destructive Operations
1. Always confirm before using `rm -rf`
2. Use `mv` to backup before overwriting
3. Test patterns with `echo` first
4. Use `--dry-run` when available

### Resource Protection
1. Limit recursive operations depth
2. Set timeouts for network operations
3. Monitor disk space during operations
4. Use nice/ionice for intensive tasks

### Script Safety
```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, pipe failures
IFS=$'\n\t'        # Set safe Internal Field Separator
```

## Integration with 7-Step Methodology

### Step 2 (Explore)
```bash
find . -name "*.py" | head -20
grep -r "class Name" --include="*.py"
```

### Step 3 (Reproduce)
```bash
python test_reproduction.py
echo "Exit code: $?"
```

### Step 6 (Verify)
```bash
python -m pytest tests/ -v
./run_integration_tests.sh
```

## Command Checklist
- [ ] Path verified before operation
- [ ] Output checked for errors
- [ ] Resources monitored
- [ ] Cleanup implemented
- [ ] Errors handled gracefully
- [ ] Documentation updated

## Special Considerations

### Long-Running Commands
```bash
# Run in background
long_command &
echo "PID: $!"

# With nohup
nohup long_command > output.log 2>&1 &
```

### Output Management
```bash
# Suppress output
command > /dev/null 2>&1

# Capture output
output=$(command 2>&1)

# Tee for viewing and saving
command | tee output.log
```

## Remember
- State persists between commands
- Avoid very large outputs
- Use background for long tasks
- Check before destructive operations
- Document complex command sequences