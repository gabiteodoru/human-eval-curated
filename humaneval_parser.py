#!/usr/bin/env python3
"""
HumanEval Corpus Parser

A library for loading and parsing HumanEval problems from markdown corpus files.
Supports both Qython and q modes with appropriate transformations.

Usage:
    from python.humaneval_parser import load_problems, get_problem

    # Load all problems
    problems = load_problems('corpus_qython.md', mode='qython')

    # Get a single problem
    problem = get_problem(0, 'corpus_qython.md', mode='qython')
"""

import re
import os
import json


def parse_problem_from_markdown(md_file, problem_id):
    """
    Parse a specific problem from a markdown file.

    Args:
        md_file: Path to markdown corpus file
        problem_id: Problem number (as string or int)

    Returns:
        dict: Problem data with keys: task_id, entry_point, prompt,
              canonical_solution, test

    Raises:
        ValueError: If problem not found
        FileNotFoundError: If markdown file doesn't exist
    """
    problem_id = str(problem_id)

    with open(md_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find the specific problem using HTML comment delimiters
    start_marker = f"<!-- PROBLEM_START:{problem_id} -->"
    end_marker = f"<!-- PROBLEM_END:{problem_id} -->"

    start_idx = content.find(start_marker)
    if start_idx == -1:
        raise ValueError(f"Problem {problem_id} not found in {md_file}")

    end_idx = content.find(end_marker)
    if end_idx == -1:
        raise ValueError(f"Problem {problem_id} end marker not found in {md_file}")

    problem_content = content[start_idx:end_idx]

    return _parse_single_problem(problem_content)


def _parse_single_problem(problem_text):
    """Parse a single problem from markdown text using HTML comment delimiters."""
    result = {}

    # Extract metadata
    meta_start = problem_text.find("<!-- META_START -->")
    meta_end = problem_text.find("<!-- META_END -->")
    if meta_start != -1 and meta_end != -1:
        meta_section = problem_text[meta_start:meta_end]
        for line in meta_section.split('\n'):
            if '**Task ID:**' in line:
                result['task_id'] = line.split('**Task ID:**')[1].strip()
            elif '**Entry Point:**' in line:
                result['entry_point'] = line.split('**Entry Point:**')[1].strip()

    # Extract prompt (problem statement with function signature)
    prompt_start = problem_text.find("<!-- PROMPT_START -->")
    prompt_end = problem_text.find("<!-- PROMPT_END -->")
    if prompt_start != -1 and prompt_end != -1:
        prompt_section = problem_text[prompt_start + len("<!-- PROMPT_START -->"):prompt_end]
        result['prompt'] = _extract_code_from_section(prompt_section)

    # Extract canonical solution
    solution_start = problem_text.find("<!-- SOLUTION_START -->")
    solution_end = problem_text.find("<!-- SOLUTION_END -->")
    if solution_start != -1 and solution_end != -1:
        solution_section = problem_text[solution_start + len("<!-- SOLUTION_START -->"):solution_end]
        result['canonical_solution'] = _extract_code_from_section(solution_section)

    # Extract test cases
    test_start = problem_text.find("<!-- TEST_START -->")
    test_end = problem_text.find("<!-- TEST_END -->")
    if test_start != -1 and test_end != -1:
        test_section = problem_text[test_start + len("<!-- TEST_START -->"):test_end]
        result['test'] = _extract_code_from_section(test_section)

    return result


def _extract_code_from_section(section):
    """Extract code from markdown code fence."""
    # Find code fence (```python or just ```)
    code_start = section.find("```")
    if code_start == -1:
        return section.strip()

    # Skip the fence and optional language marker
    code_start = section.find("\n", code_start) + 1

    # Find end fence
    code_end = section.find("```", code_start)
    if code_end == -1:
        code_end = len(section)

    return section[code_start:code_end].strip()


def load_problems(corpus_file=None, mode='qython'):
    """
    Load all HumanEval problems from markdown corpus file.

    Args:
        corpus_file: Path to corpus file. If None, uses default corpus_qython.md
                    in the repository root
        mode: 'qython' or 'q' - determines which corpus to use if corpus_file is None

    Returns:
        dict: Dictionary mapping problem numbers (int) to problem dicts

    Example:
        problems = load_problems()
        problem_0 = problems[0]
        print(problem_0['prompt'])
    """
    if corpus_file is None:
        # Default to corpus in repository root
        script_dir = os.path.dirname(os.path.abspath(__file__))

        # For now we only have Qython corpus, but allow for future Python corpus
        corpus_name = 'corpus_qython.md'  # Could be 'corpus_python.md' in future
        corpus_file = os.path.join(script_dir, corpus_name)

    problems = {}
    # Load all 164 problems
    for i in range(164):
        try:
            problem = parse_problem_from_markdown(corpus_file, i)
            problems[i] = problem
        except ValueError:
            # Problem not found - skip
            continue
        except Exception as e:
            # Log other errors but continue
            print(f"Warning: Could not load problem {i}: {e}")
            continue

    return problems


def get_problem(problem_num, corpus_file=None, mode='qython'):
    """
    Get a single HumanEval problem.

    Args:
        problem_num: Problem number (int)
        corpus_file: Path to corpus file. If None, uses default
        mode: 'qython' or 'q' - determines which corpus to use if corpus_file is None

    Returns:
        dict: Problem data with keys: task_id, entry_point, prompt,
              canonical_solution, test

    Raises:
        ValueError: If problem not found

    Example:
        problem = get_problem(0)
        print(problem['prompt'])
    """
    if corpus_file is None:
        script_dir = os.path.dirname(os.path.abspath(__file__))
        corpus_name = 'corpus_qython.md'
        corpus_file = os.path.join(script_dir, corpus_name)

    return parse_problem_from_markdown(corpus_file, problem_num)


def remove_type_hints(code):
    """
    Remove type hints from Python code using regex-based approach.

    This is a simplified version that handles common cases.
    For production use, consider using parso or ast-based parsing.

    Args:
        code: Python code string with type hints

    Returns:
        str: Code with type hints removed
    """
    # Remove parameter type hints: name: Type -> name
    code = re.sub(r'(\w+)\s*:\s*[^,\)=]+([,\)])', r'\1\2', code)

    # Remove return type hints: -> Type:
    code = re.sub(r'\s*->\s*[^:]+:', ':', code)

    return code


def process_quotes_in_line(line):
    """Process quoted strings in a line, wrapping them with String() or Char(), but skip triple quotes.

    Lines with #single-char comment will wrap length-1 strings with Char() instead of String().
    """
    # Check if this line has the #single-char marker
    use_char_for_single = '#single-char' in line

    result = ""
    i = 0
    while i < len(line):
        if line[i] in ["'", '"']:
            # Check if this is part of triple quotes
            if i + 2 < len(line) and line[i:i+3] in ['"""', "'''"]:
                # This is triple quotes - skip them entirely
                result += line[i:i+3]
                i += 3
                continue

            # Found a single quote
            quote_char = line[i]
            quote_start = i
            i += 1
            # Find the matching quote
            while i < len(line) and line[i] != quote_char:
                i += 1

            if i < len(line):  # Found matching quote
                quote_end = i
                quoted_content = line[quote_start:quote_end+1]
                # Extract the content without quotes to check length
                content_only = quoted_content[1:-1]
                # Use Char() for single characters if marker present, otherwise String()
                if len(content_only) == 1 and use_char_for_single:
                    result += f"Char({quoted_content})"
                else:
                    result += f"String({quoted_content})"
                i += 1
            else:
                # Unmatched quote, just add it
                result += quote_char
        else:
            result += line[i]
            i += 1

    return result

def wrap_quoted_strings_in_docstring(code):
    """Wrap quoted strings in docstring with String() constructor using Python string parsing."""
    lines = code.split('\n')
    result_lines = []

    # Process each line
    in_docstring = False
    docstring_quote_type = None

    for line in lines:
        if in_docstring:
            # Check if this line ends the docstring
            if docstring_quote_type in line:
                # Process quoted strings in this line, then end docstring
                processed_line = process_quotes_in_line(line)
                result_lines.append(processed_line)
                in_docstring = False
            else:
                # Process quoted strings in this line
                processed_line = process_quotes_in_line(line)
                result_lines.append(processed_line)
        else:
            # Check if this line starts a docstring
            stripped = line.strip()
            if ('"""' in stripped or "'''" in stripped) and not stripped.startswith('#'):
                # This might be the start of a docstring
                if '"""' in stripped:
                    docstring_quote_type = '"""'
                else:
                    docstring_quote_type = "'''"

                # Check if it's a single-line docstring or multi-line
                quote_count = stripped.count(docstring_quote_type)
                if quote_count >= 2:
                    # Single-line docstring
                    processed_line = process_quotes_in_line(line)
                    result_lines.append(processed_line)
                else:
                    # Multi-line docstring starts
                    in_docstring = True
                    processed_line = process_quotes_in_line(line)
                    result_lines.append(processed_line)
            else:
                result_lines.append(line)

    return '\n'.join(result_lines)

def wrap_quoted_strings_in_code(code):
    """
    Wrap all quoted strings in code with String() or Char() constructor.

    Lines with #single-char comment will wrap length-1 strings with Char() instead of String().
    This is used to prepare Qython code for translation to q.

    Args:
        code: Python/Qython code string

    Returns:
        str: Code with quoted strings wrapped in String() or Char()
    """
    lines = code.split('\n')
    result_lines = []
    in_triple_quote = False
    triple_quote_type = None

    for line in lines:
        # Check if this line has the #single-char marker
        use_char_for_single = '#single-char' in line

        result = ""
        i = 0

        # Handle continuation of multi-line triple-quoted string
        if in_triple_quote:
            while i < len(line):
                if i + 2 < len(line) and line[i:i+3] == triple_quote_type:
                    result += triple_quote_type
                    i += 3
                    in_triple_quote = False
                    triple_quote_type = None
                    break
                elif line[i] in ["'", '"'] and line[i] != triple_quote_type[0]:
                    # Found a single quote inside docstring, wrap it
                    quote_char = line[i]
                    quote_start = i
                    i += 1
                    while i < len(line) and line[i] != quote_char:
                        i += 1
                    if i < len(line):
                        quoted_content = line[quote_start:i+1]
                        # Extract the content without quotes
                        content_only = quoted_content[1:-1]
                        if len(content_only) == 1 and use_char_for_single:
                            result += f"Char({quoted_content})"
                        else:
                            result += f"String({quoted_content})"
                        i += 1
                    else:
                        result += quote_char
                else:
                    result += line[i]
                    i += 1
            result_lines.append(result)
            continue

        # Process line normally
        while i < len(line):
            if line[i] in ["'", '"']:
                # Check if this is part of triple quotes
                if i + 2 < len(line) and line[i:i+3] in ['"""', "'''"]:
                    # This is triple quotes - handle as docstring
                    quote_type = line[i:i+3]
                    result += quote_type
                    i += 3
                    # Check if it closes on the same line
                    close_pos = line[i:].find(quote_type)
                    if close_pos != -1:
                        # Single-line triple quote - process any inner quotes
                        inner_text = line[i:i+close_pos]
                        j = 0
                        while j < len(inner_text):
                            if inner_text[j] in ["'", '"'] and inner_text[j] != quote_type[0]:
                                quote_char = inner_text[j]
                                quote_start = j
                                j += 1
                                while j < len(inner_text) and inner_text[j] != quote_char:
                                    j += 1
                                if j < len(inner_text):
                                    quoted_content = inner_text[quote_start:j+1]
                                    content_only = quoted_content[1:-1]
                                    if len(content_only) == 1 and use_char_for_single:
                                        result += f"Char({quoted_content})"
                                    else:
                                        result += f"String({quoted_content})"
                                    j += 1
                                else:
                                    result += quote_char
                            else:
                                result += inner_text[j]
                                j += 1
                        result += quote_type
                        i += close_pos + 3
                    else:
                        # Multi-line triple quote starts here
                        in_triple_quote = True
                        triple_quote_type = quote_type
                        result += line[i:]
                        break
                    continue

                # Regular single/double quote
                quote_char = line[i]
                quote_start = i
                i += 1
                while i < len(line) and line[i] != quote_char:
                    if line[i] == '\\':  # Handle escaped characters
                        i += 2
                    else:
                        i += 1

                if i < len(line):
                    quoted_content = line[quote_start:i+1]
                    # Extract the content without quotes
                    content_only = quoted_content[1:-1]
                    if len(content_only) == 1 and use_char_for_single:
                        result += f"Char({quoted_content})"
                    else:
                        result += f"String({quoted_content})"
                    i += 1
                else:
                    result += quote_char
            else:
                result += line[i]
                i += 1

        result_lines.append(result)

    return '\n'.join(result_lines)


def translate_test_cases_to_q(problem):
    """
    Translate test cases from Qython to q using qmcp.qython translator.

    Note: Requires qmcp package to be installed (not included in this repository).

    Args:
        problem: Problem dict with 'test' field containing Qython test code

    Returns:
        str: Translated q code, or error message if translation fails

    Example:
        problem = get_problem(0)
        q_tests = translate_test_cases_to_q(problem)
    """
    try:
        import qmcp.qython as qy
    except ImportError:
        return "Error: qmcp.qython not available. Install qmcp package to use this function."

    # Use test code that's already in Qython format (from corpus_qython.md)
    test_code = problem['test']

    # Extract check function only
    lines = test_code.split('\n')
    check_start = None
    for i, line in enumerate(lines):
        if 'def check(' in line:
            check_start = i
            break

    if check_start is None:
        return "Error: No check function found"

    check_lines = lines[check_start:]

    # Remove import lines from the check function
    filtered_lines = []
    for line in check_lines:
        stripped = line.strip()
        if not (stripped.startswith('import ') or stripped.startswith('from ')):
            filtered_lines.append(line)

    check_only = '\n'.join(filtered_lines)

    # Wrap strings for Qython
    wrapped_test = wrap_quoted_strings_in_code(check_only)

    try:
        q_test = qy.translate_qython_to_q(wrapped_test)
        return q_test
    except Exception as e:
        return f"Translation error: {e}"


def wrap_strings_for_qython(code):
    """
    Alias for wrap_quoted_strings_in_code() for backward compatibility.

    Args:
        code: Python/Qython code string

    Returns:
        str: Code with strings wrapped in String() or Char()
    """
    return wrap_quoted_strings_in_code(code)


def markdown_to_jsonl(md_file, output_jsonl):
    """
    Convert markdown corpus to JSONL format.

    Args:
        md_file: Path to markdown corpus file
        output_jsonl: Path to output JSONL file

    Example:
        markdown_to_jsonl('corpus_qython.md', 'humaneval.jsonl')
    """
    problems = load_problems(md_file)

    with open(output_jsonl, 'w', encoding='utf-8') as f:
        # Write problems in sorted order
        for problem_num in sorted(problems.keys()):
            problem = problems[problem_num]
            json_line = json.dumps(problem, ensure_ascii=False)
            f.write(json_line + '\n')

    print(f"Converted {len(problems)} problems to {output_jsonl}")


def markdown_to_json_dir(md_file, output_dir):
    """
    Convert markdown corpus to directory of individual JSON files.

    Args:
        md_file: Path to markdown corpus file
        output_dir: Path to output directory (will be created if needed)

    Example:
        markdown_to_json_dir('corpus_qython.md', 'json_output/')
    """
    problems = load_problems(md_file)

    # Create output directory if needed
    os.makedirs(output_dir, exist_ok=True)

    for problem_num in sorted(problems.keys()):
        problem = problems[problem_num]
        output_file = os.path.join(output_dir, f"{problem_num}.json")

        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(problem, f, indent=2, ensure_ascii=False)
            f.write('\n')  # Add trailing newline

    print(f"Converted {len(problems)} problems to {output_dir}")


def jsonl_to_markdown(jsonl_file, output_md):
    """
    Convert JSONL format to markdown corpus.

    Args:
        jsonl_file: Path to JSONL file
        output_md: Path to output markdown file

    Example:
        jsonl_to_markdown('humaneval.jsonl', 'corpus.md')
    """
    problems = {}

    # Read JSONL file
    with open(jsonl_file, 'r', encoding='utf-8') as f:
        for line in f:
            if line.strip():
                problem = json.loads(line.strip())
                # Extract problem number from task_id (e.g., "HumanEval/32" -> 32)
                task_id = problem['task_id']
                problem_num = int(task_id.split('/')[-1])
                problems[problem_num] = problem

    _write_markdown(problems, output_md)


def json_dir_to_markdown(json_dir, output_md):
    """
    Convert directory of JSON files to markdown corpus.

    Args:
        json_dir: Path to directory containing JSON files
        output_md: Path to output markdown file

    Example:
        json_dir_to_markdown('json_files/', 'corpus.md')
    """
    import glob

    problems = {}
    json_files = glob.glob(os.path.join(json_dir, "*.json"))

    for json_file in json_files:
        try:
            problem_num = int(os.path.splitext(os.path.basename(json_file))[0])
            with open(json_file, 'r', encoding='utf-8') as f:
                problem = json.load(f)
                problems[problem_num] = problem
        except (ValueError, json.JSONDecodeError) as e:
            print(f"Warning: Skipping {json_file}: {e}")
            continue

    _write_markdown(problems, output_md)


def generate_corpus_q(input_md='corpus_qython.md', output_md='corpus_q.md'):
    """
    Generate corpus_q.md from corpus_qython.md with all test sections translated to q.

    This creates a new corpus file where everything is identical except the test
    sections contain translated q code instead of Qython code.

    Note: Requires qmcp package to be installed.

    Args:
        input_md: Input markdown file (default: 'corpus_qython.md')
        output_md: Output markdown file (default: 'corpus_q.md')

    Example:
        generate_corpus_q('corpus_qython.md', 'corpus_q.md')
    """
    # Load all problems from Qython corpus
    problems = load_problems(input_md)

    # Translate tests for each problem
    translated_problems = {}
    failed = []

    for problem_num in sorted(problems.keys()):
        problem = problems[problem_num].copy()

        # Translate the test section
        translated_test = translate_test_cases_to_q(problem)

        if translated_test.startswith("Error:") or translated_test.startswith("Translation error:"):
            print(f"Warning: Problem {problem_num} translation failed: {translated_test}")
            failed.append(problem_num)
            # Keep original test on failure
        else:
            # Replace test with translated version
            problem['test'] = translated_test

        translated_problems[problem_num] = problem

    # Write the new corpus
    _write_markdown(translated_problems, output_md)

    if failed:
        print(f"\nTranslation failed for {len(failed)} problems: {failed}")
    else:
        print(f"\nAll {len(problems)} problems translated successfully!")


def _write_markdown(problems, output_file):
    """
    Internal function to write problems dict to markdown format.

    Args:
        problems: Dictionary mapping problem numbers to problem dicts
        output_file: Path to output markdown file
    """
    with open(output_file, 'w', encoding='utf-8') as md_file:
        # Write header
        md_file.write("# HumanEval Problems Collection\n\n")
        md_file.write("This document contains all HumanEval problems in a human-readable format.\n\n")
        md_file.write("=" * 80 + "\n\n")

        # Sort problems by number for consistent output
        for problem_num in sorted(problems.keys()):
            problem = problems[problem_num]

            # Write problem with clear delimiters
            md_file.write(f"<!-- PROBLEM_START:{problem_num} -->\n")
            md_file.write(f"# Problem {problem_num}\n\n")

            # Metadata section
            md_file.write("<!-- META_START -->\n")
            md_file.write(f"**Task ID:** {problem['task_id']}\n")
            md_file.write(f"**Entry Point:** {problem['entry_point']}\n")
            md_file.write("<!-- META_END -->\n\n")

            # Problem statement section
            md_file.write("<!-- PROMPT_START -->\n")
            md_file.write("## Problem Statement\n")
            md_file.write("```python\n")
            md_file.write(problem['prompt'])
            if not problem['prompt'].endswith('\n'):
                md_file.write("\n")
            md_file.write("```\n")
            md_file.write("<!-- PROMPT_END -->\n\n")

            # Canonical solution section
            md_file.write("<!-- SOLUTION_START -->\n")
            md_file.write("## Canonical Solution\n")
            md_file.write("```python\n")
            md_file.write(problem['canonical_solution'])
            if not problem['canonical_solution'].endswith('\n'):
                md_file.write("\n")
            md_file.write("```\n")
            md_file.write("<!-- SOLUTION_END -->\n\n")

            # Test cases section
            md_file.write("<!-- TEST_START -->\n")
            md_file.write("## Test Cases\n")
            md_file.write("```python\n")
            md_file.write(problem['test'])
            if not problem['test'].endswith('\n'):
                md_file.write("\n")
            md_file.write("```\n")
            md_file.write("<!-- TEST_END -->\n\n")

            # Problem separator
            md_file.write(f"<!-- PROBLEM_END:{problem_num} -->\n")
            md_file.write("=" * 80 + "\n\n")

    print(f"Generated {output_file} with {len(problems)} problems")


# Re-export main functions for convenience
__all__ = [
    'load_problems',
    'get_problem',
    'parse_problem_from_markdown',
    'remove_type_hints',
    'wrap_strings_for_qython',
    'wrap_quoted_strings_in_code',
    'translate_test_cases_to_q',
    'generate_corpus_q',
    'markdown_to_jsonl',
    'markdown_to_json_dir',
    'jsonl_to_markdown',
    'json_dir_to_markdown',
]


if __name__ == "__main__":
    # Simple CLI for testing
    import sys

    if len(sys.argv) < 2:
        print("Usage: python humaneval_parser.py <problem_number>")
        sys.exit(1)

    problem_num = int(sys.argv[1])
    problem = get_problem(problem_num)

    print(f"Problem {problem['task_id']}")
    print("=" * 60)
    print("\nPROMPT:")
    print("-" * 60)
    print(problem['prompt'])
    print("\nCANONICAL SOLUTION:")
    print("-" * 60)
    print(problem['canonical_solution'])
    print("\nTEST CASES:")
    print("-" * 60)
    print(problem['test'])
    print("\nENTRY POINT:", problem['entry_point'])
    print("=" * 60)
