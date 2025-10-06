# HumanEval Curated

Curated HumanEval corpus with native q/kdb+ test implementations.

## What's New

### For Python/ML Benchmarking (useful for everyone)

- **Fixed grammar and spelling errors** in problem statements
- **Resolved self-contradictions** in requirements
- **Clarified ambiguous specifications** that led to interpretation issues
- **Human-readable format** - single .md file instead of scattered JSON
- **Parser utilities** for easy problem retrieval

### For q/kdb+ Evaluation (first complete native implementation)

- **Native q test suite** - tests written in q, not Python via IPC
- **Can run directly in q sessions** for debugging and development
- **Python harness included** for automation and orchestration
- **Complete dependencies** - all helper functions needed for tests
- **Full solution transcripts** - complete development process for all 164 problems (see below)

## Background

This builds on:
- [OpenAI's HumanEval benchmark](https://github.com/openai/human-eval) (original corpus)
- [KX's q/kdb+ HumanEval proposal](https://medium.com/kx-systems/introducing-q-evaluation-harness-the-first-open-source-evaluation-framework-for-llms-on-q-kdb-01aa6099de4f) (benchmark for q)

**What KX provided:** Python test assertions executed via IPC to test q code

**What this provides:** Native q test implementations that can be run directly in q, plus curated Python problem statements useful for any HumanEval work

See [benchmark results and methodology](link-to-your-article) for usage example achieving 99.3% accuracy.

## Repository Structure

```
humaneval-curated/
├── corpus_qython.md              # 164 problems with Qython tests
├── corpus_q.md                   # 164 problems with translated q tests
├── humaneval_parser.py           # Python library for parsing corpus
├── humaneval_parser_README.md    # Parser documentation
├── qython.q                      # Runtime utilities for Qython/q tests
├── solutions/
│   ├── qython/                   # 164 Qython solutions (.qy + .q)
│   │   ├── problem_000.qy
│   │   ├── problem_000.q
│   │   └── ...
│   └── q/                        # 162 native q solutions
│       ├── problem_000.q
│       └── ...
├── transcripts/                  # Complete conversation transcripts
│   ├── q/                        # 164 native q transcripts
│   └── qython/                   # 164 Qython transcripts
├── CURATION_NOTES.md             # Documentation of curation changes
└── LICENSE                       # MIT License
```

## Quick Start

### For Python/ML Research

```python
from humaneval_parser import get_problem

# Retrieve a curated problem
problem = get_problem(0)
print(problem['prompt'])
print(problem['test'])
```

### For q/kdb+ Development

The corpus includes two versions:
- `corpus_qython.md` - Tests written in Qython (requires translation)
- `corpus_q.md` - Tests pre-translated to native q code

Both require `qython.q` runtime utilities:

```q
/ Load Qython runtime (required for test functions)
\l qython.q

/ Load your solution
\l solutions/qython/problem_000.q

/ Run test from corpus_q.md
/ (copy the test code for the problem you're testing)
```

#### About qython.q

The `qython.q` file provides runtime utilities needed by:
- **Qython solutions** in `solutions/qython/*.q`
- **Translated q tests** in `corpus_q.md`

It includes:

- `.qython.assert` - Assertion function used in tests
- `.qython.print` - Print function for test output (requires full qmcp version, not included)
- Array manipulation functions (`.qython.arange`, `.qython.zeros`, `.qython.ones`, etc.)
- Data structure utilities (`.qython.shape`, `.qython.depth`, etc.)
- Other helper functions that Qython-translated code depends on

**You must load this file before running:**
- Any Qython solutions from `solutions/qython/`
- Any tests from `corpus_q.md`

Note: `.qython.print` functionality requires the full qmcp package (not included in this repository). Tests will work without it.

## Important Notes on Testing Methodology

### Test Translation and Type Flexibility

The q tests in `corpus_q.md` were initially auto-translated from the Qython tests in `corpus_qython.md`. However, there's an important mismatch:

**Qython solutions:** Claude was explicitly prompted to use Strings (q character lists) for text, matching Python's string type semantics. Therefore, Qython tests were written expecting Strings.

**Native q solutions:** Claude received only the original Python problem statement (which just says "str"), without specific guidance on String vs Symbol representation. Claude was free to choose either, and both are valid q implementations.

**The problem:** Auto-translated tests from `corpus_qython.md` inherited the String-type expectations, but native q solutions weren't constrained to use Strings.

### Manual Test Adjustments

To accommodate valid Symbol usage in native q mode, **some tests in `corpus_q.md` were manually updated** to be less strict about type requirements. Specifically:

- Manual updates were made **only for tests that failed due to type strictness** during the benchmark run
- Not all potentially strict tests were updated—only those that actually caused failures in practice

### Implications for Reproducibility

This selective manual curation has several implications:

1. **Auto-translation differences:** If using qmcp Enterprise's Qython translation layer to generate fresh tests, they may differ from `corpus_q.md` since the manual adjustments won't be present.

2. **Implementation-dependent fairness:** Tests may unfairly penalize LLMs that make different type choices (String vs Symbol) than those encountered during this specific benchmark run.

3. **Incomplete coverage:** The manual updates only addressed failures encountered in one particular benchmark run. Other valid q implementations might still be unfairly penalized by overly strict type requirements that weren't encountered and thus weren't fixed.

### Why Not Update All Tests?

The Qython-to-q translation layer doesn't currently support the operations needed for comprehensive type flexibility (e.g., try-except blocks for type checking). A complete solution would require either:
- Extensive manual review of all 164 test cases, or
- Enhanced translation capabilities in qmcp

For transparency, this README documents the current approach: tests were adjusted pragmatically to support the specific solutions generated in this benchmark run, not exhaustively to support all possible valid implementations.

### For Automated Testing

(Coming soon: Python harness for automated test execution)

## Benchmark Methodology

### Environment and Versions

All solutions were generated during October 2025 using:
- **Claude Model:** Sonnet 4.5 (claude-sonnet-4-5-20250929)
- **q/kdb+ Version:** Latest version as of October 2025
- **qmcp:** Custom MCP server for q/kdb+ integration
- **Timeout:** 5 minutes per problem (300 seconds)

### Benchmark Execution

**Session timeout:** Each problem was given a 5-minute limit. If Claude did not write a solution file within this time, the session was terminated.

**Qython mode:** 164/164 sessions completed successfully (all produced solution files)

**Native q mode:** 162/164 sessions completed successfully
- For 2 problems, Claude worked on the solution but did not write a solution file:
  - Problem 132: Hit 5-minute timeout (transcript shows ~5 minutes of work)
  - Problem 10: Session ended early (transcript shows ~2.5 minutes, likely Claude freeze rather than timeout)

Incomplete sessions were not retried to maintain statistical validity. Since native q mode generates significantly more tool calls per problem, it may have higher probability of encountering Claude freezes or other session issues.

**Overall Results:**
- **Qython mode:** 163/164 correct (0.61% failure rate, 99.39% pass rate)
- **Native q mode:** 153/164 correct (6.71% failure rate, 93.29% pass rate)
  - Includes 9 solutions that were produced but failed tests
  - Includes 2 sessions that did not produce solution files

**qmcp bug fixes:** During benchmark execution, translation bugs in qmcp were discovered and fixed. Any session that encountered a qmcp bug was restarted with the fixed version to ensure fair evaluation.

**Manual intervention:** No manual code fixes were applied to solutions. All code was generated entirely by Claude. The only interventions were:
- Restarting sessions that hit qmcp bugs
- Implementing qmcp bug fixes between sessions

### Reproducibility

This repository includes everything needed to verify and reproduce the results:
- **All solution files:** 164 Qython solutions, 162 native q solutions
- **Test harness:** `run_all_tests.py` for automated verification
- **Prompt generation:** `get_prompts_q_qython.py` shows exact prompts used
- **Test corpus:** `corpus_q.md` and `corpus_qython.md` with all test cases
- **Complete transcripts:** All 328 conversation logs (164 problems × 2 modes) in `transcripts/q/` and `transcripts/qython/`

Note: Transcripts are in Claude-specific format and may not be relevant for evaluating other LLMs or future Claude versions with different conversation formats.

## Solution Transcripts

This repository includes **complete development transcripts** for all 328 sessions (164 problems × 2 modes) showing Claude solving HumanEval problems using qmcp tooling.

Each transcript captures the full iterative process:
- Problem interpretation
- Code attempts and errors
- Debugging with real-time feedback
- Refinements based on test results
- Final working solution

### Complete Corpus Analysis (All 164 Problems)

**Statistical Visualizations**

The repository includes histogram visualizations comparing Qython vs Q mode performance across all 164 problems:
- `benchmark_histograms.png` - Combined view of token usage and tool calls
- `histogram_tokens.png` - Non-cached token usage distribution
- `histogram_tool_calls.png` - Core tool usage distribution

**Non-cached Token Usage:**
- Qython: mean=164, median=98, std=167
- Q: mean=383, median=314, std=272
- **Q uses 2.33x more tokens on average**

**Core Tool Calls:**
- Qython: mean=2.7, median=2, std=2.7
- Q: mean=13.1, median=11, std=8.3
- **Q uses 4.79x more tool calls on average**

**Statistical Significance:**

Paired binomial test on success/failure outcomes (p = 0.002):
- Both modes succeeded: 153 problems
- Only Qython succeeded: 10 problems
- Only Q succeeded: 0 problems
- Both modes failed: 1 problem (problem 32)

Qython's 99.4% success rate vs Q's 93.3% is statistically significant (p < 0.01).

**Data Export:**

Complete benchmark data available in `benchmark_data.csv` (328 rows, one per problem-mode pair) with columns:
- `problem_id`, `mode`, `solution_file_written`, `solution_successful`
- `tokens_usage`, `cached_token_usage`, `non_cached_token_usage`, `core_tool_calls`

### Key Findings from Pilot Study

Results from a preliminary pilot study on a subset of problems (see [pilot blog post](https://medium.com/@gabiteodoru/getting-llms-to-100-success-on-q-kdb-humaneval-and-why-it-should-be-the-baseline-preliminary-9aa406645139)):

**Average iterations to solution:**
- Qython: 4.0 tool calls
- Pure q: 20.8 tool calls (5.2x difference)

**Token efficiency:**
- Qython required 2.7x fewer non-cached tokens (221 vs 603 tokens/problem), representing actual computational work rather than reused context

Failed attempts are included for transparency and research value.

Full benchmark analysis for the complete 164-problem corpus will be published separately.

## Curation Examples

**Grammar fixes:**
```
Original: "Write a function that return true if..."
Curated: "Write a function that returns true if..."
```

**Contradiction resolution:**
```
Original: "Return the sum... Return -1 if empty" (conflicting for empty case)
Curated: Clarified that -1 is the sum value for empty input
```

**Ambiguity clarification:**
```
Original: "Sort by custom comparator"
Curated: Specified exact comparison semantics and tie-breaking rules
```

See [CURATION_NOTES.md](CURATION_NOTES.md) for complete changelog.

## Citation

If you use this corpus, please cite:

```bibtex
@misc{teodoru2024humaneval,
  author = {Teodoru, Gabi},
  title = {HumanEval Curated: Fixed corpus with native q/kdb+ tests},
  year = {2024},
  url = {https://github.com/gabiteodoru/humaneval-curated}
}
```

And cite the original HumanEval:

```bibtex
@article{chen2021evaluating,
  title={Evaluating Large Language Models Trained on Code},
  author={Chen, Mark and Tworek, Jerry and Jun, Heewoo and others},
  journal={arXiv preprint arXiv:2107.03374},
  year={2021}
}
```

## Related Work

- **OpenAI HumanEval** - Original benchmark corpus
- **KX q/kdb+ Benchmark** - Proposed q evaluation methodology  
- **qmcp** - MCP server enabling LLM-to-q integration (transcripts demonstrate this tooling)
- **Qython** - Python-like language that transpiles to q (see transcripts for usage examples)

For questions about qmcp/Qython enterprise deployment: gabiteodoru@gmail.com

Full benchmark methodology and results: [link-to-your-article]

## License

The curated problems are derived from OpenAI's HumanEval (MIT License).
The q test implementations and tooling are released under MIT License.

See [LICENSE](LICENSE) for details.

## Contributing

Found an issue in the curation or q tests? Please open an issue or PR.

For questions about using this corpus in your research, or for enterprise q/kdb+ tooling: gabiteodoru@gmail.com

## Acknowledgments

- OpenAI for the original HumanEval corpus
- KX for proposing q/kdb+ benchmarking and initial evaluation
- The q/kdb+ community for feedback on test implementations