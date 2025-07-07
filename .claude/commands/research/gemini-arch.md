---
allowed-tools: Read(*), TodoRead
description: Quick architecture review
---

# `/gemini-arch` - Architecture Review

Check system design and structure. No setup.

## How it works

1. **Check Gemini** (skip if unavailable)
```bash
gemini --version || echo "Skipping - Gemini not available"
```

2. **Map architecture**
- Directory structure
- Main components
- Database design
- API patterns

3. **Ask Gemini**
```
Review architecture for:
- Design patterns
- Component coupling
- Scalability issues
- Maintainability

Suggest practical improvements.
```

## Example Output
```
Design: Fair
Issues:
- Monolithic structure - hard to scale
- Database in controllers - use repositories
- No caching layer
Refactor:
1. Extract services
2. Add repository pattern
3. Implement Redis cache
```

## Usage
Type: `/gemini-arch` or say "gemini review architecture"