# ADR-004: BaSalam edition

## Status

Accepted

## Date

2026-10-18

## Context

BaSalam (باسلام) has an open Software Engineer (Back-End) posting in Qom. It asks for Python (FastAPI or Django preferred), SQL and NoSQL design, REST APIs, Redis, MongoDB, Kafka as a plus, concurrency, and three years of similar experience. The general SWE edition names Go, TypeScript, and Java first. A recruiter reading it for this posting would not see the Python and Django work at first glance.

The posting match is in `docs/review/2026-10-18-basalam-posting-match.md`. This ADR records how the edition is built.

## Decision

`swe-basalam-resume.typ` calls the same `render-swe-resume` as `swe-resume.typ`. It passes three overrides: `title`, `summary`, and `skills-scan`. The running header on page 2 takes the same title through `resume-doc-swe`.

The posting-specific text lives in `data/basalam.typ`. Facts, dates, bullets, and the phone stay in `data/profile.typ`. The overlay replaces three lines. It does not copy the experience list.

Build and gate:

1. `make basalam` builds `output/alireza-jafartash-swe-basalam.pdf`.
2. `make ats-basalam` runs the same gate as `make ats` (`ats_gate` in the Makefile): open-ATS score, the phone-only exception, and the reading order.

Claim rule for the overlay:

- Every term in the overlay must appear in a role, project, or skill in `profile.typ`. Python and Django come from the Ravindex role and the skills list. OOP design patterns come from the TA role. Clean Architecture comes from the skills list.
- MongoDB has no role source since the Cubecraft entry was removed on 18 Oct 2026. The overlay keeps it on the owner's instruction, which is the same instruction that puts it in the SWE skills list. Confirm it, or remove it from `data/basalam.typ` and `skills-swe-scan`, before this edition is sent.
- React and Next.js come from the Independent role's `tech` line and the SWE skills line (`skills-swe-scan`). The overlay lists them in the TypeScript group, as the SWE edition does (19 Oct 2026).
- Do not claim terms that have no source in `profile.typ`. For this posting that means FastAPI. Add it only when real work exists, and add the work to `profile.typ` first.
- SOLID and code review were added on the owner's instruction (18 Oct 2026). SOLID sits in the skills inventory and the Advanced Programming TA role. Code review sits in the TA role and the skills line. They are not repeated on the work roles. See ADR-005.
- Do not repeat posting words to raise the match score. The open-ATS JD tier counts overlap and does not read evidence. The gap review already warns that keyword stuffing loses the scan (Ladders 2018).
- Do not store the posting in the repo. Score it with `make ats-jd JD=<file>` or the binary's `--jd` flag, with the posting file kept outside the repo, as ADR-003 says.

Layout does not change. Same one column, 10 pt type, scan band, and heading order as ADR-001.

## Alternatives considered

### Copy `profile.typ` into a BaSalam profile

Two copies of the experience list would drift. A fix to one bullet would be missed in the other. Rejected.

### Edit the general SWE edition for BaSalam

The general edition is the file the user sends to most roles. A posting-specific title and summary would reach the wrong recruiters. Rejected.

### Add a per-posting bullet selector

It would add a data model before there is a second posting to support. Rejected for now. Revisit when there is a third edition.

## Consequences

- A profile fact change (dates, bullets, phone) reaches both SWE editions.
- An overlay change needs a re-run of `make ats-basalam` and a check of the claim rule.
- The renderer has three optional parameters (`title`, `summary`, `skills-scan`). Their defaults keep `swe-resume.typ` on the shared text.
- `skills-scan` is a list of `(label, items)` pairs in both the profile and the overlay. The overlay has to keep that shape when it changes.
