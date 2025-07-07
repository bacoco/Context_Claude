# Context Engineering Framework

Build better software with AI-assisted development. Based on [Cole Medin's](https://github.com/coleam00/context-engineering-intro) proven Context Engineering methodology.

## Two Commands to Build Anything

```bash
/make-plan "your feature description"    # AI creates detailed plan
/build                                   # Execute the plan
```

That's it. No complicated workflows. See [COMMANDS.md](COMMANDS.md) for all available commands.

## Optional: Verify with Gemini

```bash
gemini check    # AI automatically reviews your work
```

## Example: Build a Todo App

```bash
# 1. Create the plan
/make-plan "todo app with add, complete, and delete features"

# 2. (Optional) Verify the plan
gemini check

# 3. Build it
/build
```

The AI handles all the complexity. You just describe what you want.

## How It Works

1. **Context Engineering**: Provides comprehensive context to AI for better results
2. **Systematic Approach**: Follows proven software development practices
3. **Quality Built-in**: Automatic testing and validation
4. **Gemini Verification**: Optional second AI review for critical features

## Why This Framework?

- **Simple**: Just two commands instead of complex workflows
- **Reliable**: Based on proven methodologies, not "vibes"
- **Fast**: AI does the heavy lifting while maintaining quality
- **Flexible**: Works for any type of software project

---

<details>
<summary><b>Installation & Setup</b></summary>

### Prerequisites
- Claude Code (with code execution capabilities)
- Python 3.8+ (for validation scripts)
- Git (for version control)
- Gemini (optional, for verification)

### Quick Install
```bash
# Clone the repository
git clone https://github.com/bacoco/Context_Claude.git
cd Context_Claude

# Run setup
./setup.sh

# Start Claude Code
claude-code .
```

### First Time Setup
1. The framework sets up automatically on first use
2. Custom configurations go in `.claude/settings.json`
3. See [SETUP.md](SETUP.md) for detailed configuration

</details>

<details>
<summary><b>Complete Command Reference</b></summary>

### 🚀 Simple Commands (Recommended)
| Command | What it does | Wraps |
|---------|--------------|-------|
| `/make-plan "description"` | Creates development plan | `/project:development:generate-enhanced-prp` |
| `/build` | Executes the plan | `/project:development:execute-enhanced-prp` |
| `gemini check` | Smart auto-review | Auto-detects needed check |

### 📂 All Available Commands

#### Development Commands
- `/project:development:analyze-issue` - Structured issue analysis
- `/project:development:generate-enhanced-prp` - Generate detailed PRP
- `/project:development:execute-enhanced-prp` - Execute PRP with validation
- `/project:development:implement-feature` - Systematic implementation
- `/project:development:quality-review` - Multi-level QA process

#### Research Commands
- `/project:research:deep-research` - Comprehensive technical research
- `/project:research:documentation-scan` - Systematic doc analysis
- `/project:research:pattern-analysis` - Codebase pattern discovery

#### Validation Commands
- `/project:validation:comprehensive-test` - 6-level testing protocol
- `/project:validation:regression-check` - Regression prevention
- `/project:validation:security-audit` - Security validation

#### Workflow Commands
- `/project:workflow:session-start` - Initialize work session
- `/project:workflow:checkpoint` - Progress validation
- `/project:workflow:task-complete` - Task completion verification

#### Gemini Commands
- `/gemini-check` - Smart auto-detection (NEW)
- `/gemini-review` - Force plan review
- `/gemini-code` - Force code quality check
- `/gemini-security` - Force security audit
- `/gemini-arch` - Force architecture review
- `/gemini-risk` - Force risk assessment
- `/gemini` - Custom analysis with prompt

</details>

<details>
<summary><b>Contributing & Support</b></summary>

- **Issues**: [GitHub Issues](https://github.com/bacoco/Context_Claude/issues)
- **Docs**: [Full Documentation](docs/)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)

### Acknowledgments
Built upon Cole Medin's Context Engineering methodology. See [ACKNOWLEDGMENTS.md](ACKNOWLEDGMENTS.md) for full attribution.

</details>

---

**Ready to build?** Just type `/make-plan "your idea"` and let AI do the work.