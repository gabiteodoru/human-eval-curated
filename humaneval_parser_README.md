# HumanEval Parser

Python library for reading and working with the HumanEval corpus.

## Installation

No installation required - just import the module:

```python
import sys
sys.path.append('/path/to/human-eval-curated')
from humaneval_parser import load_problems, get_problem
```

## Quick Start

### Load All Problems

```python
from humaneval_parser import load_problems

# Load all 164 problems from the default corpus
problems = load_problems()

# Access a specific problem
problem_0 = problems[0]
print(problem_0['prompt'])
print(problem_0['test'])
```

### Load a Single Problem

```python
from humaneval_parser import get_problem

# Get problem 0
problem = get_problem(0)

print(f"Task: {problem['task_id']}")
print(f"Entry point: {problem['entry_point']}")
print(f"\n{problem['prompt']}")
```

### Use a Custom Corpus File

```python
from humaneval_parser import load_problems

# Load from a specific corpus file
problems = load_problems('path/to/corpus_qython.md')
```

## API Reference

### `load_problems(corpus_file=None, mode='qython')`

Load all HumanEval problems from markdown corpus file.

**Parameters:**
- `corpus_file` (str, optional): Path to corpus file. Defaults to `corpus_qython.md` in repository root
- `mode` (str, optional): 'qython' or 'q' - reserved for future use

**Returns:**
- `dict`: Mapping of problem numbers (int) to problem dicts

### `get_problem(problem_num, corpus_file=None, mode='qython')`

Get a single HumanEval problem.

**Parameters:**
- `problem_num` (int): Problem number (0-163)
- `corpus_file` (str, optional): Path to corpus file
- `mode` (str, optional): 'qython' or 'q' - reserved for future use

**Returns:**
- `dict`: Problem data with keys:
  - `task_id`: Task identifier (e.g., "HumanEval/0")
  - `entry_point`: Function name to implement
  - `prompt`: Problem statement with function signature
  - `canonical_solution`: Reference solution
  - `test`: Test cases code

**Raises:**
- `ValueError`: If problem not found
- `FileNotFoundError`: If corpus file doesn't exist

### `parse_problem_from_markdown(md_file, problem_id)`

Lower-level function to parse a specific problem from markdown.

**Parameters:**
- `md_file` (str): Path to markdown corpus file
- `problem_id` (str or int): Problem number

**Returns:**
- `dict`: Problem data

## Problem Data Format

Each problem is returned as a dictionary with these keys:

```python
{
    'task_id': 'HumanEval/0',
    'entry_point': 'has_close_elements',
    'prompt': 'from typing import List\n\ndef has_close_elements...',
    'canonical_solution': '    for idx, elem in enumerate...',
    'test': '\n\nMETADATA = {...}\n\ndef check(candidate):...'
}
```

## Command Line Usage

You can also use the parser from the command line to view complete problem data:

```bash
# View all fields for problem 0 (prompt, solution, tests, entry point)
python humaneval_parser.py 0

# View problem 42
python humaneval_parser.py 42
```

This displays the complete problem including the prompt, canonical solution, test cases, and entry point.

## Utility Functions

### `remove_type_hints(code)`

Remove Python type hints from code (simplified regex-based version).

### `wrap_strings_for_qython(code)`

Placeholder for wrapping string literals with `String()` constructor for Qython.

*Note: Full implementation of string wrapping requires proper AST parsing. For production use, refer to the original `qhumaneval` repository.*

## Examples

### List All Available Problems

```python
from humaneval_parser import load_problems

problems = load_problems()
print(f"Total problems: {len(problems)}")
for num in sorted(problems.keys())[:10]:
    print(f"{num}: {problems[num]['entry_point']}")
```

### Extract Test Cases

```python
from humaneval_parser import get_problem

problem = get_problem(0)
test_code = problem['test']

# Test code is executable Python
# You can parse it or exec it to test solutions
print(test_code)
```

### Work with Multiple Problems

```python
from humaneval_parser import load_problems

problems = load_problems()

# Find all problems involving strings
string_problems = []
for num, prob in problems.items():
    if 'str' in prob['prompt'].lower():
        string_problems.append((num, prob['entry_point']))

print("String manipulation problems:")
for num, name in string_problems[:5]:
    print(f"  {num}: {name}")
```

## Notes

- The corpus contains 164 problems (numbered 0-163)
- Problems are parsed from markdown using HTML comment delimiters
- The Qython corpus (`corpus_qython.md`) includes Qython-specific test code
- For q/kdb+ specific tooling, see the `q/` directory in the repository root
