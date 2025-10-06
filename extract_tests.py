#!/usr/bin/env python3
"""
Extract test cases from corpus_q.md and write them to individual files.

Usage:
    python extract_tests.py
"""

import os
from humaneval_parser import load_problems


def extract_tests_to_files(corpus_file='corpus_q.md', output_dir='tests'):
    """
    Extract test cases from corpus and write to individual test files.

    Args:
        corpus_file: Path to corpus markdown file (default: corpus_q.md)
        output_dir: Directory to write test files (default: tests/)
    """
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Load problems from corpus_q.md
    print(f"Loading problems from {corpus_file}...")
    problems = load_problems(corpus_file=corpus_file, mode='q')

    # Extract and write each test
    success_count = 0
    for problem_num in sorted(problems.keys()):
        problem = problems[problem_num]
        test_code = problem.get('test', '')
        entry_point = problem.get('entry_point', '')

        if not test_code:
            print(f"Warning: No test found for problem {problem_num}")
            continue

        if not entry_point:
            print(f"Warning: No entry_point found for problem {problem_num}")
            continue

        # Write test to file with candidate definition
        test_filename = f"test_{problem_num:03d}.q"
        test_path = os.path.join(output_dir, test_filename)

        with open(test_path, 'w') as f:
            f.write(f"candidate: {entry_point};\n\n")
            f.write(test_code)

        success_count += 1

    print(f"\nSuccessfully extracted {success_count} test files to {output_dir}/")
    print(f"Files: test_000.q through test_{max(problems.keys()):03d}.q")


if __name__ == "__main__":
    extract_tests_to_files()
