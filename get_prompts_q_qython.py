#!/usr/bin/env python3
"""
Generate prompts for solving HumanEval problems in q or Qython.

This module provides functions to generate properly formatted prompts for Claude
to solve HumanEval problems using either Qython or native q/kdb+.

Main Functions:
===============

get_implementation_notes(mode='qython')
    Get mode-specific implementation notes and guidelines.
    Args: mode (str) - 'qython' or 'q'
    Returns: list of strings with implementation notes

get_problem_prompt(problem_num, mode='qython', port=5001)
    Get the complete prompt for solving a HumanEval problem.
    Args: problem_num (int), mode (str), port (int)
    Returns: str - formatted prompt for Claude

get_problem_text(problem_num, mode='qython')
    Get formatted problem text with implementation notes.
    Args: problem_num (int), mode (str)
    Returns: str - formatted problem description

Usage Examples:
===============

# Get a Qython prompt
from get_prompts_q_qython import get_problem_prompt
prompt = get_problem_prompt(0, mode='qython', port=5001)
print(prompt)

# Get a q/kdb+ prompt
prompt = get_problem_prompt(0, mode='q', port=5001)
print(prompt)

# Just get the problem text without the full prompt
from get_prompts_q_qython import get_problem_text
problem_text = get_problem_text(0, mode='qython')
print(problem_text)
"""

from humaneval_parser import load_problems, remove_type_hints, wrap_quoted_strings_in_docstring


def get_implementation_notes(mode='qython'):
    """
    Get implementation notes based on the mode (qython or q).

    Args:
        mode: 'qython' or 'q'

    Returns:
        list: List of implementation note strings
    """
    if mode == 'qython':
        return [
            "QYTHON IMPLEMENTATION NOTES:",
            "- PREFER VECTORIZED NUMPY OPERATIONS over loops whenever possible",
            "- Examples: np.sum(), np.min(), np.max(), np.where(), np.all(), np.any()",
            "- Array operations: element-wise comparisons, broadcasting, boolean indexing",
            "- If problem involves string manipulation, use mutable Strings and Chars",
            "- When testing, use String() constructor for string inputs",
            "- You are allowed to change parameter names (avoid reserved words)",
            "- Since you have access to running Qython, break down code into individual",
            "  functions and test them separately to debug issues",
            "- Connect to q server: mcp__qmcp__connect_to_q with host localhost:PORT",
            "- Use Qython tools: mcp__qmcp__translate_and_run_qython for testing",
            "- Check help: mcp__qmcp__qython_help for reference (especially Common Gotchas)"
        ]
    elif mode == 'q':
        return [
            "Q/KDB+ IMPLEMENTATION NOTES:",
            "- Implement using native q/kdb+ syntax and idioms",
            "- PREFER VECTORIZED OPERATIONS over explicit loops (each, while)",
            "- Use q's functional programming: map ('), reduce (/), scan (\\)",
            "- Leverage q's built-in functions: sum, min, max, avg, count, etc.",
            "- Use q list operations: til, where, distinct, group, etc.",
            "- For string operations, use q string functions and symbol handling",
            "- Parameter names should avoid q reserved words",
            "- The Python type hints provide context for q type expectations",
            "- Connect to q server: mcp__qmcp__connect_to_q with host localhost:PORT",
            "- Use q tools: mcp__qmcp__query_q for testing and development",
            "- Write clean, idiomatic q code that leverages the language's strengths"
        ]
    else:
        raise ValueError(f"Unknown mode: {mode}")


def get_problem_text(problem_num, mode='qython'):
    """
    Get the problem text formatted for the specified mode (qython or q).

    Args:
        problem_num: Problem number (0-163)
        mode: 'qython' or 'q'

    Returns:
        str: Formatted problem text with implementation notes, or None if not found
    """
    # Load problems from corpus
    problems = load_problems(mode=mode)

    if problem_num not in problems:
        return None

    problem = problems[problem_num]
    prompt = problem['prompt'].strip()

    # Apply mode-specific transformations
    if mode == 'qython':
        # Apply Qython transformations
        try:
            prompt = remove_type_hints(prompt)
        except Exception as e:
            print(f"Warning: Could not remove type hints from prompt: {e}")

        # Remove import statements for Qython (numpy is pre-imported)
        lines = prompt.split('\n')
        filtered_lines = []
        for line in lines:
            stripped = line.strip()
            if not (stripped.startswith('import ') or stripped.startswith('from ')):
                filtered_lines.append(line)
        prompt = '\n'.join(filtered_lines)

        # Wrap strings in docstrings with String() or Char() (respects #single-char markers)
        prompt = wrap_quoted_strings_in_docstring(prompt)

        # Remove #single-char markers after wrapping (no longer needed)
        prompt = prompt.replace('#single-char', '')
    else:
        # For q mode, keep original prompt with type hints
        # Remove #single-char markers (preprocessing hints, not needed in final prompt)
        prompt = prompt.replace('#single-char', '')

    # Format the output
    output = []
    output.append("=" * 60)
    output.append(f"Problem {problem['task_id']}")
    output.append("=" * 60)
    output.append("")

    if mode == 'q':
        output.append("PYTHON REFERENCE (implement equivalent behavior in q/kdb+):")
        output.append("")

    output.append(prompt)
    output.append("")
    output.append("=" * 60)
    output.append("")

    # Add mode-specific implementation notes
    notes = get_implementation_notes(mode)
    output.extend(notes)
    output.append("=" * 60)

    return "\n".join(output)


def get_problem_prompt(problem_num, mode='qython', port=5001):
    """
    Get the complete prompt for solving a HumanEval problem.

    Args:
        problem_num: Problem number (0-163)
        mode: 'qython' or 'q'
        port: Port number for q server (default 5001)

    Returns:
        str: Complete prompt for Claude, or None if problem not found
    """
    problem_text = get_problem_text(problem_num, mode)
    if problem_text is None:
        return None

    # Get problem for entry_point
    problems = load_problems(mode=mode)
    function_name = problems[problem_num]['entry_point']

    # Create the mode-specific prompt for Claude
    if mode == 'qython':
        claude_prompt = f"""Please solve this HumanEval problem using Qython.

{problem_text}

Function name: {function_name}

Please:
1. Connect to the q server on localhost:{port} using mcp__qmcp__connect_to_q
2. Use the Qython tools to implement and test your solution
3. Once you have a working Qython solution, write the Qython code to a file named "problem_solution_{problem_num}.qy". The file should contain the Qython main function definition and any helper functions it needs to run. Avoid adding prints, asserts, or other testing code to the output script.

Your solution should be complete and ready to run in a Qython environment."""

    elif mode == 'q':
        claude_prompt = f"""Please solve this HumanEval problem using native q/kdb+.

{problem_text}

Function name: {function_name}

Please:
1. Connect to the q server on localhost:{port} using mcp__qmcp__connect_to_q
2. Use native q tools (mcp__qmcp__query_q) to develop and test your solution
3. Once you have a working solution, write it to a file named "problem_solution_{problem_num}.q". The file should only contain the function definition and any helper functions it needs to run.

IMPORTANT: Use semicolons `;` between q statements. Both mcp__qmcp__query_q and the testing suite communicate with the q server via IPC, which requires a different format from loading q scripts and makes semicolons necessary.

E.g.

```q
f: {{x+1}}
f[1]
```
WRONG: missing semicolon, raises confusing error: `'f`

```q
f: {{x+1}};
f[1]
```
CORRECT!

Your solution should be complete, idiomatic q code that leverages the language's strengths."""

    else:
        raise ValueError(f"Unknown mode: {mode}")

    return claude_prompt


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python get_prompts_q_qython.py <problem_number> [--mode qython|q] [--port PORT]")
        print("Example: python get_prompts_q_qython.py 0")
        print("         python get_prompts_q_qython.py 0 --mode q")
        print("         python get_prompts_q_qython.py 0 --mode qython --port 5002")
        sys.exit(1)

    try:
        problem_num = int(sys.argv[1])
    except ValueError:
        print("Error: Problem number must be an integer")
        sys.exit(1)

    # Parse optional arguments
    mode = 'qython'
    port = 5001

    i = 2
    while i < len(sys.argv):
        if sys.argv[i] == '--mode' and i + 1 < len(sys.argv):
            mode = sys.argv[i + 1]
            i += 2
        elif sys.argv[i] == '--port' and i + 1 < len(sys.argv):
            try:
                port = int(sys.argv[i + 1])
            except ValueError:
                print("Error: Port must be an integer")
                sys.exit(1)
            i += 2
        else:
            print(f"Error: Unknown argument '{sys.argv[i]}'")
            sys.exit(1)

    if mode not in ['qython', 'q']:
        print("Error: Mode must be either 'qython' or 'q'")
        sys.exit(1)

    prompt = get_problem_prompt(problem_num, mode=mode, port=port)

    if prompt is None:
        print(f"Error: Problem {problem_num} not found")
        sys.exit(1)

    print(prompt)
