---
allowed-tools: Bash(*), Edit(*), Read(*)
description: Codebase pattern identification and analysis for architecture understanding and improvement recommendations
---

# Codebase Pattern Analysis

## Context
This command facilitates comprehensive codebase pattern identification and analysis to understand system architecture, discover recurring structures, and provide improvement recommendations. Use this command to gain deep insights into code organization and design patterns.

## Pattern Analysis Process

### Step 1: Codebase Structure Discovery
**High-Level Architecture Analysis**
```bash
# Analyze directory structure
tree -I '.git|node_modules|__pycache__|*.pyc|.venv' -L 3

# Count files by type and language
find . -type f -name "*.py" | wc -l
find . -type f -name "*.js" | wc -l
find . -type f -name "*.java" | wc -l
find . -type f -name "*.go" | wc -l

# Analyze file size distribution
find . -name "*.py" -exec wc -l {} + | sort -n | tail -20

# Check for configuration files
find . -name "requirements*.txt" -o -name "package.json" -o -name "Dockerfile" -o -name "docker-compose.yml"
```

**Dependency and Import Analysis**
```bash
# Python import patterns
grep -r "^import\|^from" --include="*.py" . | head -20
grep -r "^import\|^from" --include="*.py" . | cut -d: -f2 | sort | uniq -c | sort -nr | head -10

# JavaScript import patterns
grep -r "^import\|require(" --include="*.js" . | head -20

# Check for circular dependencies
python -c "import ast; import os; [print(f) for f in os.listdir('.') if f.endswith('.py')]"
```

### Step 2: Design Pattern Identification
**Common Design Patterns Detection**
```bash
# Singleton pattern detection
grep -r "class.*Singleton\|_instance\|__new__" --include="*.py" .

# Factory pattern detection
grep -r "class.*Factory\|create_.*\|make_.*" --include="*.py" .

# Observer pattern detection
grep -r "class.*Observer\|notify\|subscribe\|listener" --include="*.py" .

# Strategy pattern detection
grep -r "class.*Strategy\|algorithm\|execute" --include="*.py" .

# Decorator pattern detection
grep -r "@\|decorator\|wrapper" --include="*.py" .
```

**Architectural Pattern Analysis**
```bash
# MVC pattern identification
find . -name "*controller*" -o -name "*model*" -o -name "*view*" | head -10

# Microservices pattern indicators
find . -name "docker-compose.yml" -o -name "Dockerfile" -o -name "*service*"
grep -r "api\|endpoint\|route" --include="*.py" . | wc -l

# Database access patterns
grep -r "SELECT\|INSERT\|UPDATE\|DELETE" --include="*.py" .
grep -r "session\|query\|execute" --include="*.py" . | head -10
```

### Step 3: Code Organization Pattern Analysis
**Module and Package Structure**
```bash
# Analyze package structure
find . -name "__init__.py" | head -20
find . -name "__init__.py" -exec dirname {} \; | sort

# Check for common modules
ls -la | grep -E "utils|helpers|common|shared|core"
find . -name "*util*" -o -name "*helper*" -o -name "*common*"

# Configuration management patterns
find . -name "*config*" -o -name "*settings*" -o -name "*.env*"
grep -r "os.environ\|getenv\|config" --include="*.py" . | head -10
```

**Code Duplication Analysis**
```bash
# Find similar function names
grep -r "def " --include="*.py" . | cut -d: -f2 | sort | uniq -c | sort -nr | head -20

# Look for repeated code blocks
grep -r "TODO\|FIXME\|HACK" --include="*.py" .

# Check for magic numbers and strings
grep -r "[0-9]\{3,\}" --include="*.py" . | head -10
grep -r "\".*\"" --include="*.py" . | grep -v "def\|class\|import" | head -10
```

### Step 4: Naming and Convention Analysis
**Naming Convention Patterns**
```bash
# Class naming patterns
grep -r "^class " --include="*.py" . | cut -d: -f2 | head -20

# Function naming patterns
grep -r "^def " --include="*.py" . | cut -d: -f2 | head -20

# Variable naming patterns
grep -r "^\s*[a-zA-Z_][a-zA-Z0-9_]*\s*=" --include="*.py" . | head -20

# Constant naming patterns
grep -r "^[A-Z_][A-Z0-9_]*\s*=" --include="*.py" .
```

**Documentation Pattern Analysis**
```bash
# Docstring patterns
grep -r '"""' --include="*.py" . | wc -l
grep -r "def " --include="*.py" . | wc -l

# Comment density analysis
find . -name "*.py" -exec grep -c "#" {} \; | awk '{sum+=$1; count++} END {print "Average comments per file: " sum/count}'

# Type hint usage
grep -r ": [A-Z]" --include="*.py" . | wc -l
grep -r "-> " --include="*.py" . | wc -l
```

### Step 5: Performance and Quality Pattern Analysis
**Performance Pattern Identification**
```bash
# Database query patterns
grep -r "select\|join\|where" --include="*.py" . -i | head -10
grep -r "session\|connection\|transaction" --include="*.py" .

# Caching pattern usage
grep -r "cache\|redis\|memcache" --include="*.py" .

# Async pattern usage
grep -r "async\|await\|asyncio" --include="*.py" .

# Loop and iteration patterns
grep -r "for.*in\|while\|map\|filter" --include="*.py" . | head -10
```

**Error Handling Pattern Analysis**
```bash
# Exception handling patterns
grep -r "try:\|except\|finally:" --include="*.py" .
grep -r "raise\|Exception" --include="*.py" . | head -10

# Logging patterns
grep -r "logging\|logger\|log\." --include="*.py" .
grep -r "print(" --include="*.py" . | head -10

# Validation patterns
grep -r "validate\|check\|verify" --include="*.py" . | head -10
```

### Step 6: Anti-Pattern and Code Smell Detection
**Common Anti-Pattern Detection**
```bash
# God class detection (large classes)
grep -A 1000 "^class " --include="*.py" . | grep -c "def " | sort -nr | head -10

# Long method detection
awk '/^def / {start=NR} /^def / && start {print FILENAME ":" start "-" (NR-1) ": " (NR-start) " lines"} END {if(start) print FILENAME ":" start "-" NR ": " (NR-start) " lines"}' $(find . -name "*.py") | sort -k3 -nr | head -10

# Deep nesting detection
grep -n "    " --include="*.py" . | grep "        " | grep "            " | head -10

# Magic number detection
grep -r "[^a-zA-Z_][0-9]\{3,\}[^a-zA-Z_]" --include="*.py" . | head -10
```

**Code Quality Issues**
```bash
# Dead code indicators
grep -r "pass$\|TODO\|FIXME\|XXX" --include="*.py" .

# Unused imports (basic detection)
python -m py_compile *.py 2>&1 | grep "imported but unused"

# Complex boolean expressions
grep -r "and.*or\|or.*and" --include="*.py" . | head -10

# Long parameter lists
grep -r "def.*," --include="*.py" . | grep -o "," | wc -l
```

### Step 7: Pattern Documentation and Recommendations
**Pattern Categorization and Analysis**
- Identify positive patterns to promote and standardize
- Document anti-patterns and provide refactoring guidance
- Create pattern library for team reference
- Recommend architectural improvements
- Suggest code quality enhancements

**Implementation Roadmap Creation**
- Prioritize pattern improvements by impact and effort
- Create refactoring plan with timeline
- Define coding standards and guidelines
- Plan knowledge transfer and training
- Establish code review and quality gates

## Pattern Analysis Report Structure

### Executive Summary
```markdown
# Codebase Pattern Analysis Report

## Executive Summary
- **Analysis Date**: [Date]
- **Codebase Size**: [Lines of code, file count]
- **Primary Language**: [Main programming language]
- **Architecture Style**: [Monolithic/Microservices/Hybrid]
- **Overall Code Quality**: [Score]/100

## Key Findings
- **Positive Patterns**: [3-5 beneficial patterns identified]
- **Areas for Improvement**: [3-5 critical improvement areas]
- **Code Quality Score**: [Score with breakdown]
- **Technical Debt**: [High/Medium/Low with examples]

## Recommendations Priority
1. **High Priority**: [Critical issues requiring immediate attention]
2. **Medium Priority**: [Important improvements for next iteration]
3. **Low Priority**: [Nice-to-have enhancements for future]
```

### Detailed Pattern Analysis
```markdown
## Architecture Patterns

### Overall Architecture
- **Style**: [Monolithic/Microservices/Layered/etc.]
- **Organization**: [Package/module structure assessment]
- **Separation of Concerns**: [Well separated/Mixed concerns]
- **Modularity**: [High/Medium/Low with evidence]

### Design Patterns Found
#### Positive Patterns
1. **[Pattern Name]**
   - **Usage**: [Where and how it's used]
   - **Benefits**: [Advantages observed]
   - **Quality**: [Implementation quality]
   - **Recommendation**: [Continue/Improve/Standardize]

2. **[Pattern Name]**
   - **Usage**: [Where and how it's used]
   - **Benefits**: [Advantages observed]
   - **Quality**: [Implementation quality]
   - **Recommendation**: [Continue/Improve/Standardize]

#### Anti-Patterns Detected
1. **[Anti-Pattern Name]**
   - **Occurrences**: [Number of instances found]
   - **Impact**: [High/Medium/Low]
   - **Examples**: [Specific file/line references]
   - **Refactoring Strategy**: [How to address]

2. **[Anti-Pattern Name]**
   - **Occurrences**: [Number of instances found]
   - **Impact**: [High/Medium/Low]
   - **Examples**: [Specific file/line references]
   - **Refactoring Strategy**: [How to address]

## Code Organization Patterns

### File and Directory Structure
- **Consistency**: [Consistent/Inconsistent with examples]
- **Naming Conventions**: [Clear/Confusing patterns]
- **Module Cohesion**: [High/Medium/Low]
- **Package Dependencies**: [Clean/Complex/Circular]

### Code Reuse Patterns
- **Utility Functions**: [Well organized/Scattered/Missing]
- **Common Functionality**: [Properly abstracted/Duplicated]
- **Configuration Management**: [Centralized/Scattered]
- **Constants and Enums**: [Well defined/Magic values used]

## Quality Patterns

### Error Handling
- **Consistency**: [Consistent approach/Mixed patterns]
- **Coverage**: [Comprehensive/Gaps identified]
- **Logging**: [Appropriate/Insufficient/Excessive]
- **User Experience**: [Good error messages/Poor feedback]

### Testing Patterns
- **Test Organization**: [Well structured/Disorganized]
- **Coverage**: [High/Medium/Low - [X]%]
- **Test Quality**: [Comprehensive/Basic/Poor]
- **Test Patterns**: [Good practices/Anti-patterns found]

### Documentation Patterns
- **Code Documentation**: [Well documented/Sparse/Missing]
- **API Documentation**: [Complete/Partial/Missing]
- **Inline Comments**: [Helpful/Excessive/Insufficient]
- **Type Hints**: [Comprehensive/Partial/Missing]

## Performance Patterns

### Database Access
- **Query Patterns**: [Efficient/N+1 problems/Inefficient]
- **Connection Management**: [Proper pooling/Resource leaks]
- **Caching**: [Effective caching/No caching/Over-caching]
- **Transactions**: [Proper usage/Missing/Excessive]

### Memory and Resources
- **Memory Management**: [Good practices/Potential leaks]
- **Resource Cleanup**: [Proper cleanup/Resource leaks]
- **Algorithm Efficiency**: [Optimal/Suboptimal/Poor choices]
- **Data Structures**: [Appropriate/Inefficient choices]

## Security Patterns

### Input Validation
- **User Input**: [Properly validated/Vulnerabilities found]
- **Data Sanitization**: [Comprehensive/Gaps identified]
- **Authorization**: [Proper checks/Missing checks]
- **Authentication**: [Secure implementation/Vulnerabilities]

### Best Practices
- **Secret Management**: [Secure/Hardcoded secrets found]
- **SQL Injection Prevention**: [Protected/Vulnerable queries]
- **XSS Prevention**: [Proper escaping/Vulnerabilities]
- **CSRF Protection**: [Implemented/Missing]

## Improvement Recommendations

### Immediate Actions (0-30 days)
1. **Critical Issue 1**: [Description and solution]
   - **Impact**: [High/Medium/Low]
   - **Effort**: [High/Medium/Low]
   - **Priority**: Critical

2. **Critical Issue 2**: [Description and solution]
   - **Impact**: [High/Medium/Low]
   - **Effort**: [High/Medium/Low]
   - **Priority**: Critical

### Short-term Improvements (1-3 months)
1. **Improvement 1**: [Description and benefits]
2. **Improvement 2**: [Description and benefits]
3. **Improvement 3**: [Description and benefits]

### Long-term Enhancements (3-12 months)
1. **Enhancement 1**: [Strategic improvement]
2. **Enhancement 2**: [Architecture evolution]
3. **Enhancement 3**: [Quality framework establishment]

## Implementation Roadmap

### Phase 1: Critical Fixes (Month 1)
- [ ] [Fix critical anti-patterns]
- [ ] [Address security vulnerabilities]
- [ ] [Resolve performance bottlenecks]

### Phase 2: Code Quality (Months 2-3)
- [ ] [Implement coding standards]
- [ ] [Improve test coverage]
- [ ] [Enhance documentation]

### Phase 3: Architecture Enhancement (Months 4-6)
- [ ] [Refactor major components]
- [ ] [Improve modularity]
- [ ] [Enhance error handling]

## Metrics and Success Criteria

### Quality Metrics
- **Code Quality Score**: [Current] → [Target]
- **Test Coverage**: [Current]% → [Target]%
- **Documentation Coverage**: [Current]% → [Target]%
- **Security Score**: [Current] → [Target]

### Process Metrics
- **Code Review Coverage**: [Target]%
- **Automated Quality Gates**: [Implementation plan]
- **Refactoring Progress**: [Tracking mechanism]
- **Team Training**: [Knowledge transfer plan]
```

## Analysis Quality Checklist

### Pattern Identification
- [ ] Comprehensive codebase scan completed
- [ ] Multiple pattern types analyzed
- [ ] Both positive and negative patterns identified
- [ ] Evidence collected for all findings
- [ ] Impact assessment provided for each pattern

### Recommendation Quality
- [ ] Actionable recommendations provided
- [ ] Prioritization based on impact and effort
- [ ] Implementation timeline realistic
- [ ] Resource requirements estimated
- [ ] Success criteria defined

### Report Quality
- [ ] Clear executive summary provided
- [ ] Detailed findings well-organized
- [ ] Evidence supports conclusions
- [ ] Recommendations are practical
- [ ] Implementation roadmap included

## Output Requirements

### File Locations
- Save analysis report as `docs/pattern-analysis-YYYY-MM-DD.md`
- Save detailed findings as `docs/pattern-details-{date}.json`
- Save code examples as `docs/pattern-examples/`
- Update `TASK.md` with analysis completion

### Deliverables
- Comprehensive pattern analysis report
- Prioritized improvement recommendations
- Implementation roadmap with timeline
- Code quality metrics and benchmarks
- Best practices documentation

## Success Criteria
- **Comprehensive Coverage**: All major patterns identified and analyzed
- **Actionable Insights**: Clear, prioritized recommendations provided
- **Quality Improvement**: Path to higher code quality established
- **Team Value**: Analysis provides value for development team decisions
- **Measurable Outcomes**: Success metrics and tracking defined

Use this command to gain deep insights into codebase patterns and create actionable improvement plans.