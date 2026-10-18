# Agent guide

Read the file for the branch you are on. The research notes start with the rule. Sources are listed in `docs/research/sources.md`.

- SWE layout, header, scan band, or section order: `docs/decisions/001-swe-page-architecture.md`
- Color, type, or voice: `docs/brand/brand-guidelines.md` and `docs/decisions/002-ats-safe-brand.md`
- Score gate, `make ats`, or a posting match: `docs/decisions/003-scoring-toolchain.md`
- Dates, overlapping roles, or a claim you might rewrite: `docs/review/2026-10-18-swe-gap-review.md`
- Index of the same docs: `docs/README.md`

`pm-resume.typ` uses `render-two-page-resume`. Leave that renderer’s layout in place when the task is the SWE edition.

Build the SWE PDF with `make swe`. Score it with `make ats`.

BaSalam edition: `swe-basalam-resume.typ` uses the same `render-swe-resume` and overlays `data/basalam.typ`. Build with `make basalam`, score with `make ats-basalam`. Decision and claim rules: `docs/decisions/004-basalam-edition.md`. Posting match: `docs/review/2026-10-18-basalam-posting-match.md`.
