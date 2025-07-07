# Enhanced Context Engineering Framework - Troubleshooting Guide

## Table of Contents
1. [Common Issues](#common-issues)
2. [Command Problems](#command-problems)
3. [Quality Gate Failures](#quality-gate-failures)
4. [Performance Issues](#performance-issues)
5. [Integration Problems](#integration-problems)
6. [Debug Techniques](#debug-techniques)
7. [FAQ](#frequently-asked-questions)

## Common Issues

### Framework Not Loading
#### Symptoms
- Commands not recognized
- Namespace not available
- Configuration errors

#### Solutions
1. **Verify Installation**
   ```bash
   # Check if setup completed
   ./setup.sh --verify
   
   # Validate configuration
   cat config.json | jq .
   ```

2. **Check AI Assistant Configuration**
   - Ensure namespace is registered
   - Verify command paths are correct
   - Confirm permissions on files

3. **Reinstall Framework**
   ```bash
   # Clean installation
   ./setup.sh --clean
   ./setup.sh --install
   ```

### Session State Issues
#### Symptoms
- Lost context between commands
- State not persisting
- Checkpoints failing

#### Solutions
1. **Reset Session**
   ```
   /project:enhanced-context:session-start --force-new
   ```

2. **Recover from Checkpoint**
   ```
   /project:enhanced-context:checkpoint --restore-latest
   ```

3. **Manual State Recovery**
   - Check `.claude/state/` directory
   - Restore from backup if available
   - Rebuild context from PRPs

## Command Problems

### Command Not Found
#### Error Message
```
Command 'project:enhanced-context:command-name' not found
```

#### Troubleshooting Steps
1. **Verify Command Exists**
   ```bash
   ls -la .claude/commands/**/*.md | grep command-name
   ```

2. **Check Command Syntax**
   - Ensure correct namespace prefix
   - Verify command name spelling
   - Check parameter format

3. **Validate Command File**
   ```bash
   # Check file format
   head -n 5 .claude/commands/category/command-name.md
   ```

### Command Execution Failures
#### Common Causes
1. **Missing Tools**
   - Tool not in allowed-tools list
   - Tool syntax incorrect
   - Tool permissions insufficient

2. **Parameter Issues**
   - Required parameters missing
   - Parameter format incorrect
   - Invalid parameter values

3. **State Dependencies**
   - Previous step not completed
   - Required files missing
   - Context not established

#### Resolution Process
```bash
# 1. Check command requirements
grep "allowed-tools:" .claude/commands/category/command.md

# 2. Verify prerequisites
/project:enhanced-context:session-start --check-deps

# 3. Run with debug mode
/project:enhanced-context:command --debug
```

## Quality Gate Failures

### Test Coverage Below Threshold
#### Error
```
Quality Gate Failed: Test coverage 72% < required 85%
```

#### Solutions
1. **Identify Uncovered Code**
   ```bash
   pytest --cov --cov-report=term-missing
   ```

2. **Add Missing Tests**
   - Focus on critical paths
   - Cover edge cases
   - Test error conditions

3. **Review Test Strategy**
   - Ensure meaningful tests
   - Avoid test duplication
   - Focus on behavior, not implementation

### Linting Errors
#### Common Issues
1. **Style Violations**
   ```bash
   # Auto-fix style issues
   ruff check --fix .
   black .
   ```

2. **Type Errors**
   ```bash
   # Check type hints
   mypy . --strict
   ```

3. **Import Problems**
   - Check circular imports
   - Verify module structure
   - Update import paths

### Security Audit Failures
#### Critical Vulnerabilities
1. **Dependency Issues**
   ```bash
   # Update vulnerable packages
   pip install --upgrade package-name
   
   # Audit dependencies
   pip-audit
   ```

2. **Code Vulnerabilities**
   ```bash
   # Run security scan
   bandit -r . -ll
   ```

3. **Sensitive Data Exposure**
   - Check for hardcoded secrets
   - Review logging statements
   - Validate input sanitization

## Performance Issues

### Slow Command Execution
#### Diagnosis
1. **Profile Command**
   ```bash
   time /project:enhanced-context:command
   ```

2. **Check Resource Usage**
   ```bash
   top -p $(pgrep -f enhanced-context)
   ```

3. **Review Logs**
   ```bash
   tail -f .claude/logs/performance.log
   ```

#### Optimization Strategies
1. **Cache Research Results**
   - Store in PRPs
   - Use checkpoint system
   - Implement result caching

2. **Optimize File Operations**
   - Use grep before read
   - Limit file scanning depth
   - Batch operations

3. **Parallel Execution**
   - Run independent tasks concurrently
   - Use background processes
   - Implement async operations

### Memory Issues
#### Symptoms
- Out of memory errors
- System slowdown
- Process termination

#### Solutions
1. **Limit Scope**
   ```bash
   # Reduce search depth
   /project:enhanced-context:pattern-analysis --max-depth 3
   ```

2. **Clean Temporary Files**
   ```bash
   # Remove cache
   rm -rf .claude/cache/*
   
   # Clean logs
   find .claude/logs -mtime +7 -delete
   ```

3. **Increase Resources**
   - Allocate more memory
   - Use swap space
   - Optimize system settings

## Integration Problems

### Git Integration Issues
#### Merge Conflicts
1. **With Framework Files**
   ```bash
   # Preserve local framework
   git checkout --ours .claude/
   git add .claude/
   ```

2. **With Generated Files**
   ```bash
   # Regenerate after merge
   /project:enhanced-context:checkpoint --rebuild
   ```

### CI/CD Pipeline Failures
#### Test Environment Issues
1. **Missing Dependencies**
   ```yaml
   # Add to CI config
   - run: ./setup.sh --ci-mode
   ```

2. **Permission Problems**
   ```bash
   # Fix permissions
   chmod +x .claude/scripts/*
   ```

### IDE Integration
#### Command Completion Not Working
1. **VSCode**
   ```json
   // settings.json
   {
     "ai.namespace": "enhanced-context",
     "ai.commandPath": ".claude/commands"
   }
   ```

2. **IntelliJ**
   - Install AI assistant plugin
   - Configure project settings
   - Rebuild project index

## Debug Techniques

### Enable Debug Mode
```bash
# Set debug environment
export ECF_DEBUG=true
export ECF_LOG_LEVEL=DEBUG

# Run with verbose output
/project:enhanced-context:command --verbose
```

### Trace Execution
```bash
# Enable execution tracing
set -x

# Run command
/project:enhanced-context:analyze-issue "test"

# Disable tracing
set +x
```

### Check Logs
```bash
# View recent logs
tail -n 100 .claude/logs/latest.log

# Search for errors
grep -i error .claude/logs/*.log

# Monitor in real-time
tail -f .claude/logs/latest.log
```

### Validate State
```python
# Check session state
import json
with open('.claude/state/session.json') as f:
    state = json.load(f)
    print(json.dumps(state, indent=2))
```

## Frequently Asked Questions

### Q: How do I reset everything and start fresh?
```bash
# Complete reset
rm -rf .claude/state/*
rm -rf .claude/cache/*
./setup.sh --reset
/project:enhanced-context:session-start --clean
```

### Q: Can I use the framework offline?
Yes, but with limitations:
- Local commands work normally
- External research commands fail
- Documentation scans limited to local files
- No web-based validations

### Q: How do I customize quality thresholds?
Edit `config.json`:
```json
{
  "quality": {
    "coverage_threshold": 90,
    "complexity_threshold": 10,
    "lint_strict": true
  }
}
```

### Q: What if a command hangs?
1. **Check timeout settings**
   ```bash
   # Increase timeout
   export ECF_COMMAND_TIMEOUT=300
   ```

2. **Kill hanging process**
   ```bash
   # Find process
   ps aux | grep enhanced-context
   
   # Kill it
   kill -9 [PID]
   ```

3. **Clean up state**
   ```bash
   /project:enhanced-context:checkpoint --cleanup
   ```

### Q: How do I report framework bugs?
1. **Collect Debug Information**
   ```bash
   ./debug-info.sh > debug-report.txt
   ```

2. **Create Issue**
   - Use issue template
   - Include debug report
   - Provide reproduction steps

3. **Submit PR**
   - Fork repository
   - Create fix branch
   - Follow contribution guidelines

## Advanced Troubleshooting

### Corrupted State Recovery
```python
#!/usr/bin/env python3
# recover_state.py
import json
import os
from pathlib import Path

def recover_state():
    state_dir = Path('.claude/state')
    backup_dir = Path('.claude/backups')
    
    # Find latest backup
    backups = sorted(backup_dir.glob('state_*.json'))
    if backups:
        latest = backups[-1]
        print(f"Recovering from {latest}")
        
        # Restore state
        import shutil
        shutil.copy(latest, state_dir / 'session.json')
        print("State recovered successfully")
    else:
        print("No backups found")

if __name__ == "__main__":
    recover_state()
```

### Custom Debug Commands
```bash
# Create debug script
cat > debug-ecf.sh << 'EOF'
#!/bin/bash
echo "=== ECF Debug Information ==="
echo "Version: $(cat .claude/VERSION)"
echo "Config: $(cat config.json | jq -c .)"
echo "Commands: $(find .claude/commands -name "*.md" | wc -l)"
echo "State: $(ls -la .claude/state/)"
echo "Recent errors:"
grep -i error .claude/logs/*.log | tail -10
EOF

chmod +x debug-ecf.sh
```

## Summary
Most issues can be resolved by:
1. Checking configuration
2. Verifying prerequisites
3. Running with debug mode
4. Consulting logs
5. Resetting state if needed

For persistent issues, use the debug techniques provided and consult the project repository for updates and known issues.