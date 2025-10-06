# Prompt Generation for HumanEval Problems

The `get_prompts_q_qython.py` module provides functions to generate prompts for solving HumanEval problems using either Qython or native q/kdb+.

## Overview

This module helps you create properly formatted prompts that can be used with Claude Code to solve HumanEval problems. It includes:
- Problem text formatting
- Mode-specific implementation notes (Qython vs q)
- Complete prompts ready for Claude

## Functions

### `get_problem_prompt(problem_num, mode='qython', port=5001)`

Get a complete prompt for solving a HumanEval problem.

**Parameters:**
- `problem_num` (int): Problem number (0-163)
- `mode` (str): Either 'qython' or 'q' (default: 'qython')
- `port` (int): Port number for q server (default: 5001)

**Returns:** Complete prompt string ready for Claude, or None if problem not found

**Example:**
```python
from get_prompts_q_qython import get_problem_prompt

# Get Qython prompt
prompt = get_problem_prompt(0, mode='qython')
print(prompt)

# Get q/kdb+ prompt
prompt = get_problem_prompt(42, mode='q', port=5002)
print(prompt)
```

### `get_problem_text(problem_num, mode='qython')`

Get formatted problem text with implementation notes (without the full prompt).

**Parameters:**
- `problem_num` (int): Problem number (0-163)
- `mode` (str): Either 'qython' or 'q' (default: 'qython')

**Returns:** Formatted problem description string, or None if not found

**Example:**
```python
from get_prompts_q_qython import get_problem_text

# Get just the problem description
text = get_problem_text(0, mode='qython')
print(text)
```

### `get_implementation_notes(mode='qython')`

Get mode-specific implementation notes and guidelines.

**Parameters:**
- `mode` (str): Either 'qython' or 'q' (default: 'qython')

**Returns:** List of implementation note strings

**Example:**
```python
from get_prompts_q_qython import get_implementation_notes

notes = get_implementation_notes(mode='q')
for note in notes:
    print(note)
```

## Command Line Usage

The module can also be used from the command line:

```bash
# Get Qython prompt for problem 0
python get_prompts_q_qython.py 0

# Get q/kdb+ prompt for problem 42
python get_prompts_q_qython.py 42 --mode q

# Specify custom port
python get_prompts_q_qython.py 0 --mode qython --port 5002
```

## Prompt Format

### Qython Prompts

Qython prompts include:
- Problem statement with Python reference code
- Qython-specific implementation notes
- Instructions to connect to q server and use Qython tools
- File naming convention: `problem_solution_{N}.qy`

### Q Prompts

Q prompts include:
- Problem statement labeled as "PYTHON REFERENCE"
- Q/kdb+-specific implementation notes
- Instructions for using native q tools
- Important semicolon usage reminder for IPC
- File naming convention: `problem_solution_{N}.q`

## Integration with humaneval_parser

This module imports from `humaneval_parser.py` and uses the `load_problems()` function to retrieve problem data from the corpus files.

## See Also

- `humaneval_parser.py` - Core parser for reading HumanEval corpus
- `corpus_qython.md` - Qython version of HumanEval problems
- `corpus_q.md` - Q version with translated tests
