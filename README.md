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
│   └── q/                        # 22 pure q solutions
│       ├── problem_000.q
│       └── ...
├── transcripts/                  # (Coming soon: solution transcripts)
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

## Solution Transcripts

(Coming soon: Complete development transcripts showing Claude solving all 164 HumanEval problems)

This repository will include **complete development transcripts** showing Claude solving all HumanEval problems using qmcp tooling:

- **Qython approach** (162/164 solved, 99.3% success rate)
- **Pure q approach** (16/23 solved, 69.6% success rate on tested subset)

Each transcript will capture the full iterative process:
- Problem interpretation
- Code attempts and errors
- Debugging with real-time feedback
- Refinements based on test results
- Final working solution

### Key Findings from Transcripts

**Average iterations to solution:**
- Qython: 4.0 tool calls
- Pure q: 20.8 tool calls (5.2x difference)

**Token efficiency:**
- Qython: 44,170 tokens/problem average
- Pure q: 56,327 tokens/problem average

Failed attempts will be included for transparency and research value.

See [full benchmark analysis](link-to-your-article) for methodology and statistical significance testing.

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