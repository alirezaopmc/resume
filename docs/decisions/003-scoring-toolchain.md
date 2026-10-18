# ADR-003: Scoring toolchain

## Status

Accepted

## Date

2026-10-18

## Context

Parse quality has to be checked without uploading the resume. Hosted scanners need an account and a quota. open-ATS v0.2.0 is one offline binary with a published penalty table and a JSON report. Poppler’s `pdftotext -layout` is the plain-text test MIT CAPD describes.

## Decision

`make ats` does four things:

1. Build `output/alireza-jafartash-swe.pdf`.
2. Download `tool-linux-x86_64` from the v0.2.0 release into `tools/ats/bin/` if it is absent, and check sha256 `2a3dd861e8b8f94902b2665e8ba2b089da028988cabfb2527dd6f1078cd1ceca`.
3. Run `tool <pdf> --json` and fail unless `overall` is at least 90, or at least 85 when every finding is the missing-phone warning.
4. Run `pdftotext -layout` and fail unless `Alireza Jafartash`, `Summary`, `Skills`, and `Experience` occur in that order. The order follows ADR-001 (Skills under Summary, before the roles). `tools/ats/check_order.py` holds the list.

`make ats-jd JD=<file>` adds `--jd` and prints the JSON. It does not store a posting and does not change the pass rule.

Jobscan, Teal, Resume Worded, and Skillsyncer are documented in `docs/research/scoring-and-tools.md` and are not invoked.

The binary is gitignored. The checksum and the URL live in the Makefile.

## Alternatives considered

### Jobscan in CI

The file would leave the machine, and the free tier is quota-limited. Rejected.

### LarpMyResume as the gate

It is a second offline auditor with its own rubric. One gate is enough. open-ATS matches the penalty table already cited in the research notes. Rejected as the gate. It remains a fine manual second pass.

### Commit the binary

About 110 MB of build output. Rejected.

## Consequences

- A penalty-table change upstream requires a pinned version bump and an ADR update.
- `data/profile.typ` includes a phone, printed on the contact line. The 85 floor remains for a file whose only finding is a missing phone.
