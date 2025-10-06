#!/usr/bin/env python3
"""
Export enhanced conversation transcripts for all HumanEval problems.
Dynamically discovers session directories and exports transcripts.
"""

import sys
import os
import json
import re
from pathlib import Path

sys.path.append('/mnt/d/python/qhumaneval')
from solve_humaneval import find_conversation_file

def analyze_conversation_with_results(conv_file_path):
    """Analyze conversation and include tool results for query tools."""

    if not os.path.exists(conv_file_path):
        return {"error": "Conversation file not found"}

    events = []

    try:
        with open(conv_file_path, 'r') as f:
            message_count = 0
            assistant_message_count = 0

            for line in f:
                try:
                    msg = json.loads(line.strip())

                    # Handle initial user message (the prompt)
                    if msg.get("type") == "user" and message_count == 0:
                        content = msg.get("message", {}).get("content", [])

                        if isinstance(content, list):
                            for block in content:
                                if isinstance(block, dict) and block.get("type") == "text":
                                    events.append({
                                        "type": "initial_prompt",
                                        "message_num": 0,
                                        "timestamp": msg.get("timestamp"),
                                        "text": block.get("text", "").strip()
                                    })
                        elif isinstance(content, str):
                            events.append({
                                "type": "initial_prompt",
                                "message_num": 0,
                                "timestamp": msg.get("timestamp"),
                                "text": content.strip()
                            })

                        message_count += 1

                    elif msg.get("type") == "assistant" and "message" in msg:
                        assistant_message_count += 1
                        content = msg["message"].get("content", [])

                        if isinstance(content, list):
                            for block in content:
                                if isinstance(block, dict):
                                    block_type = block.get("type")

                                    if block_type == "text":
                                        events.append({
                                            "type": "text",
                                            "message_num": message_count,
                                            "timestamp": msg.get("timestamp"),
                                            "text": block.get("text", "").strip()
                                        })

                                    elif block_type == "tool_use":
                                        tool_name = block.get("name", "unknown")
                                        events.append({
                                            "type": "tool_use",
                                            "message_num": message_count,
                                            "timestamp": msg.get("timestamp"),
                                            "tool": tool_name,
                                            "tool_use_id": block.get("id"),
                                            "input": block.get("input", {})
                                        })

                    elif msg.get("type") == "user" and "message" in msg:
                        # Check for tool results
                        content = msg.get("message", {}).get("content", [])
                        if isinstance(content, list):
                            for block in content:
                                if isinstance(block, dict) and block.get("type") == "tool_result":
                                    tool_use_id = block.get("tool_use_id")
                                    tool_result_content = block.get("content", "")

                                    events.append({
                                        "type": "tool_result",
                                        "timestamp": msg.get("timestamp"),
                                        "tool_use_id": tool_use_id,
                                        "result": tool_result_content
                                    })

                except json.JSONDecodeError:
                    continue
    except Exception as e:
        return {"error": f"Error analyzing conversation: {e}"}

    return events

def print_enhanced_timeline(conv_file_path, output_file):
    """Print enhanced timeline with tool results to file."""

    events = analyze_conversation_with_results(conv_file_path)

    if isinstance(events, dict) and "error" in events:
        print(f"Error: {events['error']}")
        return False

    # Relevant query tools we care about
    relevant_tools = {
        'mcp__qmcp__query_q',
        'mcp__qmcp__translate_and_run_qython',
        'mcp__qmcp__translate_qython_to_q'
    }

    with open(output_file, 'w') as f:
        f.write(f"ENHANCED CONVERSATION TIMELINE\n")
        f.write("="*80 + "\n")
        f.write(f"Total events: {len(events)}\n\n")

        i = 1
        pending_tool_results = {}  # tool_use_id -> tool_info

        for event in events:
            event_type = event['type']

            # Format timestamp
            time_str = ""
            if event.get('timestamp'):
                try:
                    from datetime import datetime
                    ts = datetime.fromisoformat(event['timestamp'].replace('Z', '+00:00'))
                    time_str = f" at {ts.strftime('%H:%M:%S')}"
                except:
                    pass

            if event_type == "initial_prompt":
                f.write(f"\n--- {i}. Initial Prompt{time_str} ---\n")
                text = event['text']
                f.write(text + "\n")
                i += 1

            elif event_type == "text":
                f.write(f"\n--- {i}. Text Block (Message #{event['message_num']}){time_str} ---\n")
                text = event['text']
                if len(text) > 800:
                    f.write(text[:800] + "\n... [truncated, showing first 800 characters]\n")
                else:
                    f.write(text + "\n")
                i += 1

            elif event_type == "tool_use":
                tool_name = event['tool']
                is_relevant = tool_name in relevant_tools

                f.write(f"\n--- {i}. Tool Call: {tool_name} (Message #{event['message_num']}){time_str} ---\n")

                # Store for matching with results later
                if is_relevant:
                    pending_tool_results[event['tool_use_id']] = {
                        'tool_name': tool_name,
                        'event_num': i
                    }

                inputs = event['input']
                if inputs:
                    for key, value in inputs.items():
                        if isinstance(value, str):
                            # Pretty-print newlines without truncation for relevant tools
                            display_value = value.replace('\\n', '\n')
                            f.write(f"  {key}:\n")
                            # Indent each line of the value
                            for line in display_value.split('\n'):
                                f.write(f"    {line}\n")
                        else:
                            f.write(f"  {key}: {repr(value)}\n")
                else:
                    f.write("  (no parameters)\n")
                i += 1

            elif event_type == "tool_result":
                tool_use_id = event['tool_use_id']
                if tool_use_id in pending_tool_results:
                    tool_info = pending_tool_results[tool_use_id]
                    f.write(f"\n--- {i}. Tool Result for {tool_info['tool_name']} (Event #{tool_info['event_num']}){time_str} ---\n")

                    result = event['result']

                    # Pretty print the result content
                    if isinstance(result, str):
                        f.write(f"{result}\n")
                    elif isinstance(result, list):
                        # Handle list of content blocks (like tool results often are)
                        for item in result:
                            if isinstance(item, dict):
                                if item.get('type') == 'text':
                                    text_content = item.get('text', '')
                                    # Pretty print with proper newlines
                                    formatted_text = text_content.replace('\\r\\n', '\n').replace('\\r', '\n').replace('\\n', '\n')
                                    f.write(f"{formatted_text}\n")
                                else:
                                    # Handle other content types
                                    f.write(f"{repr(item)}\n")
                            else:
                                f.write(f"{repr(item)}\n")
                    else:
                        f.write(f"{repr(result)}\n")

                    # Remove from pending
                    del pending_tool_results[tool_use_id]
                    i += 1

    return True

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

def export_enhanced_conversation(problem_num, mode, session_id, output_file):
    """Export enhanced conversation timeline to a file."""
    session_dir = f'problem_{problem_num}_{mode}_session_{session_id}'

    print(f"Exporting {session_dir}...", end=' ')

    conv_file = find_conversation_file(problem_num, session_dir)
    if conv_file:
        if print_enhanced_timeline(conv_file, output_file):
            print(f"✓ Exported to {output_file}")
            return True
        else:
            print(f"✗ Failed to export")
            return False
    else:
        print(f"✗ No conversation file found")
        return False

if __name__ == "__main__":
    # Base directory for sessions
    base_dir = '/mnt/d/python/qhumaneval'

    # Output directory for transcripts
    output_dir = os.path.join(base_dir, 'transcripts')
    os.makedirs(output_dir, exist_ok=True)

    # Discover all session directories
    print("Discovering session directories...")
    sessions = discover_session_directories(base_dir)
    print(f"Found {len(sessions)} sessions\n")

    # Sort by problem number and mode for organized output
    sorted_sessions = sorted(sessions.items(), key=lambda x: (x[0][0], x[0][1]))

    # Export each session
    success_count = 0
    fail_count = 0

    for (problem_num, mode), session_id in sorted_sessions:
        output_file = os.path.join(output_dir, f'problem_{problem_num:03d}_{mode}_transcript.txt')
        if export_enhanced_conversation(problem_num, mode, session_id, output_file):
            success_count += 1
        else:
            fail_count += 1

    print(f"\n{'='*80}")
    print(f"Export complete!")
    print(f"  Successful: {success_count}")
    print(f"  Failed: {fail_count}")
    print(f"  Total: {len(sessions)}")
    print(f"  Output directory: {output_dir}")
