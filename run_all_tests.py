#!/usr/bin/env python3
"""
Run all HumanEval tests for a given mode (qython or q).

Usage:
    python run_all_tests.py qython
    python run_all_tests.py q
"""

import sys
import subprocess
import argparse


def run_all_tests(mode, verbose=False):
    """
    Run all 164 tests for the specified mode.

    Args:
        mode: 'qython' or 'q'
        verbose: Print details for passing tests too

    Returns:
        tuple: (total_tests, failures)
    """
    total_tests = 164
    failures = []

    print(f"Running all {total_tests} tests in {mode} mode...")
    print("=" * 60)

    for problem_num in range(total_tests):
        # Run the test
        result = subprocess.run(
            ['q', 'run_test.q', '-mode', mode, '-problem', str(problem_num)],
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,  # Hide stderr (KDB banner, etc.)
            text=True
        )

        # Check if test passed
        if result.returncode == 0:
            if verbose:
                print(f"✓ Problem {problem_num:03d}: PASS")
        else:
            # Test failed - record and print details
            failures.append(problem_num)
            print(f"✗ Problem {problem_num:03d}: FAIL")

            # Print stdout (which contains the error from -1[x])
            if result.stdout.strip():
                # Skip the KDB banner lines
                lines = result.stdout.strip().split('\n')
                error_lines = [line for line in lines if line and not any(
                    skip in line for skip in [
                        'KDB-X', 'Copyright', 'Welcome to', 'For Community',
                        'Tutorials', 'Ready to go', 'l64/', 'EXPIRE', 'COMMUNITY'
                    ]
                )]
                if error_lines:
                    for line in error_lines:
                        print(f"  {line}")

            print()

    # Print summary
    print("=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)

    passed = total_tests - len(failures)
    failed = len(failures)
    pass_rate = (passed / total_tests) * 100
    fail_rate = (failed / total_tests) * 100

    print(f"Mode: {mode}")
    print(f"Total: {total_tests}")
    print(f"Passed: {passed} ({pass_rate:.2f}%)")
    print(f"Failed: {failed} ({fail_rate:.2f}%)")

    if failures:
        print(f"\nFailed problems: {', '.join(str(n) for n in failures)}")

    return total_tests, failures


def main():
    parser = argparse.ArgumentParser(
        description='Run all HumanEval tests for qython or q mode'
    )
    parser.add_argument(
        'mode',
        choices=['qython', 'q'],
        help='Mode to test (qython or q)'
    )
    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Print details for passing tests too'
    )

    args = parser.parse_args()

    total, failures = run_all_tests(args.mode, args.verbose)

    # Exit with error code if any tests failed
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
