#!/usr/bin/env python3
"""
Extract benchmark data for all HumanEval problems and export to CSV.
Creates a table with 328 rows (164 problems × 2 modes).
"""

import sys
import os
import csv
import re
from pathlib import Path

sys.path.append('/mnt/d/python/qhumaneval')
from solve_humaneval import find_conversation_file, analyze_conversation_tokens

# Known failures (hardcoded based on benchmark results)
Q_NO_SOLUTION = {10, 132}  # Problems where q mode didn't write solution file
QYTHON_FAILURES = {32}  # Problems where qython solution failed tests
Q_FAILURES = {0, 10, 24, 31, 32, 50, 91, 93, 102, 132, 135}  # Problems where q solution failed tests

# Core development tools per mode
CORE_Q_TOOLS = {'mcp__qmcp__query_q'}
CORE_QYTHON_TOOLS = {
    'mcp__qmcp__translate_and_run_qython',
    'mcp__qmcp__translate_qython_to_q'
}

def discover_session_directories(base_dir):
    """
    Discover all session directories in the base directory.
    Returns dict: {(problem_num, mode): session_id}
    """
    sessions = {}
    pattern = re.compile(r'problem_(\d+)_(q|qython)_session_([a-f0-9]+)$')

    for item in os.listdir(base_dir):
        item_path = os.path.join(base_dir, item)
        if os.path.isdir(item_path):
            match = pattern.match(item)
            if match:
                problem_num = int(match.group(1))
                mode = match.group(2)
                session_id = match.group(3)
                sessions[(problem_num, mode)] = session_id

    return sessions

def get_core_tool_calls(tool_usage, mode):
    """Count core tool calls for the given mode."""
    if mode == 'q':
        return sum(tool_usage.get(tool, 0) for tool in CORE_Q_TOOLS)
    else:  # qython
        return sum(tool_usage.get(tool, 0) for tool in CORE_QYTHON_TOOLS)

def extract_problem_data(problem_num, mode, session_id):
    """Extract data for a single problem."""
    session_dir = f'problem_{problem_num}_{mode}_session_{session_id}'

    # Determine if solution file was written
    if mode == 'q':
        solution_file_written = problem_num not in Q_NO_SOLUTION
    else:  # qython - all qython sessions wrote solutions
        solution_file_written = True

    # Determine if solution was successful
    if mode == 'q':
        solution_successful = problem_num not in Q_FAILURES
    else:  # qython
        solution_successful = problem_num not in QYTHON_FAILURES

    # Get conversation stats
    conv_file = find_conversation_file(problem_num, session_dir)

    if conv_file:
        stats = analyze_conversation_tokens(conv_file)
        if 'error' not in stats:
            tool_usage = stats.get('tool_usage', {})

            return {
                'problem_id': problem_num,
                'mode': mode,
                'solution_file_written': solution_file_written,
                'solution_successful': solution_successful,
                'tokens_usage': stats.get('cost_equivalent_tokens', 0),
                'cached_token_usage': stats.get('cache_read_input_tokens', 0),
                'non_cached_token_usage': stats.get('input_tokens', 0) + stats.get('output_tokens', 0),
                'core_tool_calls': get_core_tool_calls(tool_usage, mode)
            }

    # If we can't get stats, return partial data
    return {
        'problem_id': problem_num,
        'mode': mode,
        'solution_file_written': solution_file_written,
        'solution_successful': solution_successful,
        'tokens_usage': None,
        'cached_token_usage': None,
        'non_cached_token_usage': None,
        'core_tool_calls': None
    }

def main():
    # Base directory for sessions
    base_dir = '/mnt/d/python/qhumaneval'

    # Output CSV file
    output_file = '/mnt/d/python/human-eval-curated/benchmark_data.csv'

    print("Discovering session directories...")
    sessions = discover_session_directories(base_dir)
    print(f"Found {len(sessions)} sessions\n")

    # Collect data for all problems
    all_data = []

    for problem_num in range(164):
        for mode in ['qython', 'q']:
            session_id = sessions.get((problem_num, mode))
            if session_id:
                print(f"Extracting data for problem {problem_num} ({mode} mode)...", end=' ')
                data = extract_problem_data(problem_num, mode, session_id)
                all_data.append(data)
                print("✓")
            else:
                print(f"⚠ No session found for problem {problem_num} ({mode} mode)")
                # Still add a row with partial data
                all_data.append({
                    'problem_id': problem_num,
                    'mode': mode,
                    'solution_file_written': False if mode == 'q' and problem_num in Q_NO_SOLUTION else True,
                    'solution_successful': False if (mode == 'q' and problem_num in Q_FAILURES) or (mode == 'qython' and problem_num in QYTHON_FAILURES) else True,
                    'tokens_usage': None,
                    'cached_token_usage': None,
                    'non_cached_token_usage': None,
                    'core_tool_calls': None
                })

    # Write to CSV
    print(f"\nWriting data to {output_file}...")

    fieldnames = [
        'problem_id',
        'mode',
        'solution_file_written',
        'solution_successful',
        'tokens_usage',
        'cached_token_usage',
        'non_cached_token_usage',
        'core_tool_calls'
    ]

    with open(output_file, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_data)

    print(f"✓ Successfully exported {len(all_data)} rows to {output_file}")

    # Print summary statistics
    print("\n" + "="*80)
    print("SUMMARY STATISTICS")
    print("="*80)

    qython_data = [d for d in all_data if d['mode'] == 'qython']
    q_data = [d for d in all_data if d['mode'] == 'q']

    print(f"\nQython Mode:")
    print(f"  Total problems: {len(qython_data)}")
    print(f"  Solutions written: {sum(1 for d in qython_data if d['solution_file_written'])}")
    print(f"  Solutions successful: {sum(1 for d in qython_data if d['solution_successful'])}")

    print(f"\nQ Mode:")
    print(f"  Total problems: {len(q_data)}")
    print(f"  Solutions written: {sum(1 for d in q_data if d['solution_file_written'])}")
    print(f"  Solutions successful: {sum(1 for d in q_data if d['solution_successful'])}")

    # Token statistics (excluding None values)
    qython_tokens = [d['non_cached_token_usage'] for d in qython_data if d['non_cached_token_usage'] is not None]
    q_tokens = [d['non_cached_token_usage'] for d in q_data if d['non_cached_token_usage'] is not None]

    if qython_tokens and q_tokens:
        print(f"\nNon-cached Token Usage:")
        print(f"  Qython average: {sum(qython_tokens)/len(qython_tokens):.0f}")
        print(f"  Q average: {sum(q_tokens)/len(q_tokens):.0f}")
        print(f"  Q/Qython ratio: {(sum(q_tokens)/len(q_tokens)) / (sum(qython_tokens)/len(qython_tokens)):.2f}x")

    # Tool call statistics
    qython_tools = [d['core_tool_calls'] for d in qython_data if d['core_tool_calls'] is not None]
    q_tools = [d['core_tool_calls'] for d in q_data if d['core_tool_calls'] is not None]

    if qython_tools and q_tools:
        print(f"\nCore Tool Calls:")
        print(f"  Qython average: {sum(qython_tools)/len(qython_tools):.1f}")
        print(f"  Q average: {sum(q_tools)/len(q_tools):.1f}")
        print(f"  Q/Qython ratio: {(sum(q_tools)/len(q_tools)) / (sum(qython_tools)/len(qython_tools)):.2f}x")

if __name__ == "__main__":
    main()
