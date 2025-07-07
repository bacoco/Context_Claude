# Sequential Thinking Protocol

## Overview
A detailed tool for dynamic and reflective problem-solving through thoughts. This tool helps analyze problems through a flexible thinking process that can adapt and evolve. Each thought can build on, question, or revise previous insights as understanding deepens.

## When to Use Sequential Thinking

### Primary Use Cases
- Breaking down complex problems into steps
- Planning and design with room for revision
- Analysis that might need course correction
- Problems where the full scope might not be clear initially
- Problems that require a multi-step solution
- Tasks that need to maintain context over multiple steps
- Situations where irrelevant information needs to be filtered out

### Key Features
- You can adjust total_thoughts up or down as you progress
- You can question or revise previous thoughts
- You can add more thoughts even after reaching what seemed like the end
- You can express uncertainty and explore alternative approaches
- Not every thought needs to build linearly - you can branch or backtrack
- Generates a solution hypothesis
- Verifies the hypothesis based on the Chain of Thought steps
- Repeats the process until satisfied
- Provides a correct answer

## Parameters Explained

### Core Parameters
- **thought**: Your current thinking step, which can include:
  * Regular analytical steps
  * Revisions of previous thoughts
  * Questions about previous decisions
  * Realizations about needing more analysis
  * Changes in approach
  * Hypothesis generation
  * Hypothesis verification

### Control Parameters
- **next_thought_needed**: True if you need more thinking, even if at what seemed like the end
- **thought_number**: Current number in sequence (can go beyond initial total if needed)
- **total_thoughts**: Current estimate of thoughts needed (can be adjusted up/down)
- **is_revision**: A boolean indicating if this thought revises previous thinking
- **revises_thought**: If is_revision is true, which thought number is being reconsidered
- **branch_from_thought**: If branching, which thought number is the branching point
- **branch_id**: Identifier for the current branch (if any)
- **needs_more_thoughts**: If reaching end but realizing more thoughts needed

## Best Practices

### Process Guidelines
1. Start with an initial estimate of needed thoughts, but be ready to adjust
2. Feel free to question or revise previous thoughts
3. Don't hesitate to add more thoughts if needed, even at the "end"
4. Express uncertainty when present
5. Mark thoughts that revise previous thinking or branch into new paths
6. Ignore information that is irrelevant to the current step
7. Generate a solution hypothesis when appropriate
8. Verify the hypothesis based on the Chain of Thought steps
9. Repeat the process until satisfied with the solution
10. Provide a single, ideally correct answer as the final output
11. Only set next_thought_needed to false when truly done and a satisfactory answer is reached

### Thought Depth Recommendations
- **Simple problems**: 5-10 thoughts
- **Moderate complexity**: 10-15 thoughts
- **Complex problems**: 15-25 thoughts
- **Highly complex or multi-faceted**: 25+ thoughts

### Quality Indicators
- Thoughts build on each other logically
- Revisions improve understanding
- Branches explore viable alternatives
- Hypothesis is testable and specific
- Verification is thorough
- Final answer is clear and actionable

## Integration with 7-Step Methodology

Sequential thinking is particularly valuable during:
- **Step 1 (Understand)**: Breaking down complex requirements
- **Step 4 (Debug)**: Analyzing root causes systematically
- **Step 5 (Develop)**: Planning implementation approach
- **Step 6 (Verify)**: Thinking through test scenarios

## Example Thought Patterns

### Linear Progression
```
Thought 1: Understanding the problem space
Thought 2: Identifying key components
Thought 3: Analyzing relationships
Thought 4: Forming initial hypothesis
Thought 5: Verifying hypothesis
```

### Revision Pattern
```
Thought 1: Initial understanding
Thought 2: First approach
Thought 3: Realizing issue with approach (is_revision: true, revises_thought: 2)
Thought 4: New approach based on revised understanding
```

### Branching Pattern
```
Thought 1: Problem analysis
Thought 2: Identifying two possible causes
Thought 3a: Exploring first cause (branch_from_thought: 2, branch_id: "a")
Thought 3b: Exploring second cause (branch_from_thought: 2, branch_id: "b")
Thought 4: Synthesizing findings from both branches
```

## Remember
- Thinking depth directly correlates with solution quality
- Revisions are signs of good analysis, not mistakes
- Branching helps explore multiple solutions
- The goal is understanding, not just reaching an answer
- Quality thoughts lead to robust solutions