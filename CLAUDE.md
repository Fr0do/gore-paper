# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

LaTeX source for "GORE: A Controlled Environment for Training and Evaluating Backtracking Reasoning in Language Models" — NeurIPS 2026 workshop submission.

Code repo: https://github.com/Fr0do/gore

## Build

```bash
latexmk -pdf main.tex        # Full build
latexmk -pdf -pvc main.tex   # Watch mode
```

## Git Conventions (OUROBOROS protocol)

- Linear history (rebase, not merge). Commit & push by default.
- Prefix: `[doc]` for writing, `[fig]` for figures, `[bib]` for references, `[infra]` for build/CI
- `fixes #N` in commits to auto-close issues
- Create issue before any significant section rewrite

## Structure

- `main.tex` — paper entry point
- `references.bib` — bibliography
- `figures/` — all figures (PDF/PNG)
