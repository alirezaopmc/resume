# BaSalam posting match

Reviewed 18 October 2026 against `data/profile.typ` and `data/basalam.typ`. The edition is `swe-basalam-resume.typ` (ADR-004). The general SWE edition is unchanged.

Posting: Software Engineer (Back-End), BaSalam, Qom, full time. Listing on Jobvision (the page shows the posting as 13 days old and 28 days remaining when fetched). The listing was not stored in the repo. The JD text was scored from `/tmp` with `make ats-jd`-style `--jd` and is not kept. Re-check the listing before applying.

## Score

| Edition | open-ATS overall | JD match (tool) | Matched | Missing |
| --- | --- | --- | --- | --- |
| General SWE | 100 | 22 | database, kafka, mongodb | python, sql, nosql, design principles, adapt to changes, problem solving, communication, language |
| BaSalam | 100 | 44 | database, kafka, mongodb, nosql, python, sql | adapt to changes, design principles, problem solving, communication, language |

The JD tier is gazetteer overlap plus vector similarity. It does not read evidence (`docs/research/scoring-and-tools.md`). Use it to find gaps, not as a target.

The table reflects the first pass. The second content pass (18 Oct 2026) changed the roles and the skills block, so run `make ats-jd JD=<file>` with the posting text again before relying on the match numbers.

## Requirement by requirement

| Posting asks for | Where the resume shows it | Status |
| --- | --- | --- |
| Python (advanced) | Summary and Skills: Python (Django). Ravindex role is Django. | Covered. The skills list says Python. Years of Python are not stated. |
| FastAPI or Django (preferred) | Django in the Ravindex role and the Skills line. | Django covered. FastAPI not in profile. Not claimed. |
| Back-end solutions, scalable | Summary: back-end engineer in startups. Skills and SwapWallet bullet: low latency under peak load. SwapWallet: low latency under peak load. | Covered. |
| OOP and SOLID design principles | Skills: SOLID principles, object-oriented design, design patterns, Clean Architecture. Advanced Programming TA bullet: SOLID principles. | Covered. SOLID added on the owner's instruction (18 Oct 2026). |
| SQL and NoSQL schema design, query optimization | PostgreSQL, MongoDB (Skills line only), query optimization (Skills line, PostgreSQL group). | Covered for SQL. NoSQL rests on MongoDB, which has no role source since the Cubecraft entry was removed (18 Oct 2026). See the MongoDB row. |
| REST APIs | Ultratrader: REST and GraphQL APIs. Summary: building REST APIs. | Covered. |
| Multithreading and concurrency | SwapWallet: concurrency race conditions in the ledger. Gold ledger: row locks. Skills: concurrency-safe services. | Covered by concurrency. Multithreading not stated. |
| Redis | Summary, Skills, LvtGames and Independent tools. | Covered. |
| MongoDB (intermediate) | Skills line only. The Cubecraft role (2016–2017) that listed MongoDB was removed on 18 Oct 2026. | Not sourced in profile. Kept on the owner's instruction. Confirm before sending, or drop it from `skills-scan` in `data/basalam.typ`. |
| Kafka (plus) | SwapWallet role, Skills line. | Covered. |
| Code reviews | Skills line and the Head TA bullet (code review of student work, 15+ TAs). | Covered on the owner's instruction (18 Oct 2026). Not on the work roles. |
| 3 years in a similar role | Work roles since May 2022 (Ravindex), and the Summary's 4+ years of production experience (SWE edition). | Covered. The Cubecraft role that started in 2016 was removed on 18 Oct 2026. |
| Teamwork, communication, adaptability | Not stated as evidence. | Not claimed. The bullets show team work (TA team of 15+, feature launches). |
| Location: Qom (preferred) | Header: Tehran, Iran, open to remote. | Open question for the user. Not changed. |

## Concerns and what was left alone

- **Qom.** The posting prefers Qom. The header says Tehran and remote. Changing the location is a fact about the candidate, so it is left for the user to decide.
- **FastAPI.** No source in the profile. Not claimed.
- **SOLID and code review.** Added on the owner's instruction (18 Oct 2026). They appear once in the skills inventory and once in the TA role. They are not repeated on the work roles.
- **Soft skills.** The posting asks for teamwork, communication, and adaptability. These are not claims a resume can prove. The bullets already show team work (the TA team, feature launches).
- **Keyword stuffing.** The tool score can be raised by repeating posting words. Ladders 2018 says that loses the scan, so the overlay adds only terms that have a source.

## Changes made for this posting

- Title: Senior Back-End Software Engineer (was Senior Software Engineer).
- Summary: rewritten in the owner's story (18 Oct 2026). Cut on 19 Oct 2026 to high-level wording (technologies, languages, databases, paradigms, products), with no named stack. The Python (Django) and Redis/Kafka claims now sit in the Skills block and the Ravindex role.
- Skills scan: two labelled groups (Primary, Familiar) in the same shape as the SWE edition, leading with Python (Django). Primary is the set used across several roles. Adds MongoDB, RabbitMQ, query optimization, SOLID principles, object-oriented design, design patterns, Clean Architecture, and code review.
- Work Experience and Other Experience are separate headings (ADR-005). The Head TA role moved under Other Experience.
- Summary (19 Oct 2026): one clause adds React and Next.js front ends for full-stack products, in both the overlay and the SWE summary. The sentence is kept short because the posting is back-end.
- Skills scan: the TypeScript group lists Next.js and React, matching the SWE edition (19 Oct 2026). Both come from the Independent role's tech line.
- Running header on page 2 uses the same title.
- Second content pass (18 Oct 2026): the work roles, education, projects, and awards come from the shared profile and changed for both editions. The overlay's summary and title did not change.
