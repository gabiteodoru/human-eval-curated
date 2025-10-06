#!/usr/bin/env python3
"""
Statistical test for paired success/failure data.
Uses binomial test for discordant pairs.
"""

import pandas as pd
from scipy.stats import binomtest
import numpy as np

# Read the data
df = pd.read_csv('benchmark_data.csv')

# Separate by mode
qython_data = df[df['mode'] == 'qython'].sort_values('problem_id')
q_data = df[df['mode'] == 'q'].sort_values('problem_id')

# Get success/failure for each mode
qython_success = qython_data['solution_successful'].values
q_success = q_data['solution_successful'].values

# Create contingency table for McNemar's test
# McNemar's test compares paired binary outcomes
# Table structure:
#                Q Success    Q Fail
# Qython Success    a           b
# Qython Fail       c           d

both_success = np.sum(qython_success & q_success)
qython_only = np.sum(qython_success & ~q_success)
q_only = np.sum(~qython_success & q_success)
both_fail = np.sum(~qython_success & ~q_success)

print("="*80)
print("PAIRED BINOMIAL TEST FOR SUCCESS/FAILURE DATA")
print("="*80)

print("\nPaired Results:")
print(f"  Both modes succeeded: {both_success} problems")
print(f"  Only Qython succeeded: {qython_only} problems")
print(f"  Only Q succeeded: {q_only} problems")
print(f"  Both modes failed: {both_fail} problems")

# For paired data, we test the discordant pairs
# If modes perform equally, we'd expect 50/50 split among disagreements
discordant_pairs = qython_only + q_only

print(f"\nDiscordant pairs (where modes disagree): {discordant_pairs}")

if discordant_pairs > 0:
    # Binomial test: of the discordant pairs, is the split significantly different from 50/50?
    result = binomtest(qython_only, n=discordant_pairs, p=0.5, alternative='two-sided')

    print(f"\nBinomial Test Results:")
    print(f"  Qython wins: {qython_only}/{discordant_pairs} = {qython_only/discordant_pairs:.1%}")
    print(f"  Q wins: {q_only}/{discordant_pairs} = {q_only/discordant_pairs:.1%}")
    print(f"  p-value: {result.pvalue:.6f}")

    if result.pvalue < 0.001:
        print(f"  Significance: p < 0.001 (highly significant)")
    elif result.pvalue < 0.01:
        print(f"  Significance: p < 0.01 (very significant)")
    elif result.pvalue < 0.05:
        print(f"  Significance: p < 0.05 (significant)")
    else:
        print(f"  Significance: not significant at α = 0.05")

    print("\nConclusion:")
    if result.pvalue < 0.05:
        if qython_only > q_only:
            print(f"  Qython significantly outperforms Q mode (p = {result.pvalue:.6f})")
            print(f"  Among the {discordant_pairs} problems where modes disagreed,")
            print(f"  Qython succeeded {qython_only} times vs Q's {q_only} time(s).")
        else:
            print(f"  Q significantly outperforms Qython mode (p = {result.pvalue:.6f})")
    else:
        print(f"  No significant difference in success rates (p = {result.pvalue:.6f})")
else:
    print("\nNo discordant pairs - both modes had identical results on all problems.")

# Additional summary statistics
print("\n" + "="*80)
print("SUMMARY STATISTICS")
print("="*80)

qython_success_rate = np.mean(qython_success)
q_success_rate = np.mean(q_success)

print(f"\nSuccess Rates:")
print(f"  Qython: {np.sum(qython_success)}/164 = {qython_success_rate:.1%}")
print(f"  Q:      {np.sum(q_success)}/164 = {q_success_rate:.1%}")
print(f"  Difference: {(qython_success_rate - q_success_rate):.1%}")

print("\n" + "="*80)
