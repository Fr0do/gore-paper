# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project

LaTeX source for "GORE: A Minimal Formal Language for Training Backtracking
Reasoning in Language Models" — NeurIPS 2026 workshop submission.

Abstract deadline: **4 May 2026**.
Code repo: https://github.com/Fr0do/gore
Single source of truth for positioning: `../gore/GORE_MASTER_PLAN.md`

## Positioning (from GORE_MASTER_PLAN.md)

GORE is a declarative, relation-based language that makes the search tree a
first-class syntactic object. Five primitives (STEP/FORK/CUT/LET/CALL) are
structurally isomorphic to Lean/Coq tactics. The GORE interpreter acts as a
Process Reward Model — dense step-level reward with zero annotation cost.

Three independent domains converge in GORE:
- Formal theorem proving (Lean/Coq) — pretraining source via structural isomorphism
- Code-augmented reasoning (PAL, Text-to-SQL / Spider+BIRD) — CALL primitive
- Backtracking search — FORK+CUT primitives

## Build

```bash
latexmk -pdf main.tex        # Full build
latexmk -pdf -pvc main.tex   # Watch mode
```

Requires: `neurips_2026.sty` (copied from s_cot_tex), `mathpartir` package.

## Structure

```
main.tex                    — entry point; \input{sections/XX_name}
references.bib              — 13 BibTeX entries
neurips_2026.sty            — NeurIPS style file
figures/                    — all figures (PDF/PNG/TikZ)
sections/
  00_abstract.tex           — FULL DRAFT (~200 words)
  01_introduction.tex       — SUBSTANTIVE DRAFT (~1.5 pages, 5 contributions)
  02_related_work.tex       — SUBSTANTIVE DRAFT (5 themes, proper citations)
  03_methodology.tex        — SKELETON (5 subsections + reward code)
  04_experiments.tex        — SKELETON (E1 SFT, E2a/b/c RL, E3 spectral, E4 NL)
  05_results.tex            — PLACEHOLDER (table shells)
  06_conclusion.tex         — SKELETON (summary + limitations + future work)
  07_appendix.tex           — PLACEHOLDER (6 appendix sections)
```

## Key macros

| Macro         | Expands to          | Use for                    |
|---------------|---------------------|----------------------------|
| `\gore{}`     | GORE (small caps)   | Language name              |
| `\letstmt{}`  | LET (small caps)    | LET primitive              |
| `\callstmt{}` | CALL (small caps)   | CALL primitive             |
| `\todo{msg}`  | red [TODO: msg]     | Placeholder content        |

## Git Conventions (OUROBOROS protocol)

- Linear history (rebase, not merge). Commit & push by default.
- Prefix: `[doc]` writing, `[fig]` figures, `[bib]` references, `[infra]` build/CI
- `fixes #N` in commits to auto-close issues
- Create issue before any significant section rewrite

## Experiment reference

| ID  | Condition                  | Key comparison         |
|-----|----------------------------|------------------------|
| E1  | SFT baseline               | —                      |
| E2a | GRPO + sparse reward       | vs E2b: reward density |
| E2b | Dr. GRPO + dense reward    | **main condition**     |
| E2c | DAPO + sparse reward       | memory-efficient ablation |
| E3  | Spectral-R1 analysis       | mechanistic interp     |
| E4  | NL transfer                | GSM8K / ARC / MATH     |

## Next writing priorities

1. `03_methodology.tex` — fill in BNF grammar and inference rules (mathpartir)
2. `05_results.tex` — populate tables once E1/E2 runs complete
3. `04_experiments.tex` — add hyperparameter tables
4. `07_appendix.tex` — lean2gore conversion examples
