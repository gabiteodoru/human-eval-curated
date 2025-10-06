#!/usr/bin/env python3
"""
Create overlapping histograms for Qython vs Q benchmark comparison.
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Read the data
df = pd.read_csv('benchmark_data.csv')

# Separate by mode
qython_data = df[df['mode'] == 'qython']
q_data = df[df['mode'] == 'q']

# Create figure with two subplots side by side
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 6))

# ============================================================================
# Histogram 1: Non-cached Token Usage
# ============================================================================

qython_tokens = qython_data['non_cached_token_usage'].values
q_tokens = q_data['non_cached_token_usage'].values

# Create overlapping histograms (Q first, then Qython on top)
ax1.hist(q_tokens, bins=30, alpha=0.6, color='red', label='Q', edgecolor='black')
ax1.hist(qython_tokens, bins=30, alpha=0.6, color='blue', label='Qython', edgecolor='black')

ax1.set_xlabel('Non-cached Tokens (input + output)', fontsize=12)
ax1.set_ylabel('Frequency (number of problems)', fontsize=12)
ax1.set_title('Distribution of Non-cached Token Usage:\nQython vs Q', fontsize=14, fontweight='bold')
ax1.legend(loc='upper right', fontsize=11)
ax1.grid(True, alpha=0.3)

# Add statistics as text
qython_mean = np.mean(qython_tokens)
q_mean = np.mean(q_tokens)
qython_median = np.median(qython_tokens)
q_median = np.median(q_tokens)

stats_text = f'Qython: μ={qython_mean:.0f}, median={qython_median:.0f}\n'
stats_text += f'Q: μ={q_mean:.0f}, median={q_median:.0f}\n'
stats_text += f'Ratio (Q/Qython): {q_mean/qython_mean:.2f}x'

ax1.text(0.98, 0.64, stats_text, transform=ax1.transAxes,
         fontsize=10, verticalalignment='top', horizontalalignment='right',
         bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

# ============================================================================
# Histogram 2: Core Tool Calls
# ============================================================================

qython_tools = qython_data['core_tool_calls'].values
q_tools = q_data['core_tool_calls'].values

# Create overlapping histograms with appropriate bins for discrete data (Q first, then Qython on top)
max_tools = max(q_tools.max(), qython_tools.max())
bins = np.arange(0, max_tools + 2) - 0.5  # Center bins on integers

ax2.hist(q_tools, bins=bins, alpha=0.6, color='red', label='Q', edgecolor='black')
ax2.hist(qython_tools, bins=bins, alpha=0.6, color='blue', label='Qython', edgecolor='black')

ax2.set_xlabel('Core Tool Calls', fontsize=12)
ax2.set_ylabel('Frequency (number of problems)', fontsize=12)
ax2.set_title('Distribution of Core Tool Usage:\nQython vs Q', fontsize=14, fontweight='bold')
ax2.legend(loc='upper right', fontsize=11)
ax2.grid(True, alpha=0.3, axis='y')

# Add statistics as text
qython_tool_mean = np.mean(qython_tools)
q_tool_mean = np.mean(q_tools)
qython_tool_median = np.median(qython_tools)
q_tool_median = np.median(q_tools)

stats_text = f'Qython: μ={qython_tool_mean:.1f}, median={qython_tool_median:.0f}\n'
stats_text += f'Q: μ={q_tool_mean:.1f}, median={q_tool_median:.0f}\n'
stats_text += f'Ratio (Q/Qython): {q_tool_mean/qython_tool_mean:.2f}x'

ax2.text(0.98, 0.64, stats_text, transform=ax2.transAxes,
         fontsize=10, verticalalignment='top', horizontalalignment='right',
         bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

# Adjust layout and save
plt.tight_layout()
output_file = 'benchmark_histograms.png'
plt.savefig(output_file, dpi=300, bbox_inches='tight')
print(f"✓ Histograms saved to {output_file}")

# Also create individual histograms for flexibility
# ============================================================================
# Individual: Non-cached Tokens
# ============================================================================
fig1, ax = plt.subplots(1, 1, figsize=(10, 6))

ax.hist(q_tokens, bins=30, alpha=0.6, color='red', label='Q', edgecolor='black')
ax.hist(qython_tokens, bins=30, alpha=0.6, color='blue', label='Qython', edgecolor='black')

ax.set_xlabel('Non-cached Tokens (input + output)', fontsize=12)
ax.set_ylabel('Frequency (number of problems)', fontsize=12)
ax.set_title('Distribution of Non-cached Token Usage: Qython vs Q', fontsize=14, fontweight='bold')
ax.legend(loc='upper right', fontsize=11)
ax.grid(True, alpha=0.3)

ax.text(0.98, 0.64, stats_text, transform=ax.transAxes,
        fontsize=10, verticalalignment='top', horizontalalignment='right',
        bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

plt.tight_layout()
plt.savefig('histogram_tokens.png', dpi=300, bbox_inches='tight')
print(f"✓ Token histogram saved to histogram_tokens.png")

# ============================================================================
# Individual: Core Tool Calls
# ============================================================================
fig2, ax = plt.subplots(1, 1, figsize=(10, 6))

ax.hist(q_tools, bins=bins, alpha=0.6, color='red', label='Q', edgecolor='black')
ax.hist(qython_tools, bins=bins, alpha=0.6, color='blue', label='Qython', edgecolor='black')

ax.set_xlabel('Core Tool Calls', fontsize=12)
ax.set_ylabel('Frequency (number of problems)', fontsize=12)
ax.set_title('Distribution of Core Tool Usage: Qython vs Q', fontsize=14, fontweight='bold')
ax.legend(loc='upper right', fontsize=11)
ax.grid(True, alpha=0.3, axis='y')

stats_text_tools = f'Qython: μ={qython_tool_mean:.1f}, median={qython_tool_median:.0f}\n'
stats_text_tools += f'Q: μ={q_tool_mean:.1f}, median={q_tool_median:.0f}\n'
stats_text_tools += f'Ratio (Q/Qython): {q_tool_mean/qython_tool_mean:.2f}x'

ax.text(0.98, 0.64, stats_text_tools, transform=ax.transAxes,
        fontsize=10, verticalalignment='top', horizontalalignment='right',
        bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

plt.tight_layout()
plt.savefig('histogram_tool_calls.png', dpi=300, bbox_inches='tight')
print(f"✓ Tool calls histogram saved to histogram_tool_calls.png")

# Print summary statistics
print("\n" + "="*80)
print("SUMMARY STATISTICS")
print("="*80)
print(f"\nNon-cached Token Usage:")
print(f"  Qython: mean={qython_mean:.0f}, median={qython_median:.0f}, std={np.std(qython_tokens):.0f}")
print(f"  Q:      mean={q_mean:.0f}, median={q_median:.0f}, std={np.std(q_tokens):.0f}")
print(f"  Q uses {q_mean/qython_mean:.2f}x more tokens on average")

print(f"\nCore Tool Calls:")
print(f"  Qython: mean={qython_tool_mean:.1f}, median={qython_tool_median:.0f}, std={np.std(qython_tools):.1f}")
print(f"  Q:      mean={q_tool_mean:.1f}, median={q_tool_median:.0f}, std={np.std(q_tools):.1f}")
print(f"  Q uses {q_tool_mean/qython_tool_mean:.2f}x more tool calls on average")

print("\n" + "="*80)
