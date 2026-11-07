# ADR-005: Work and other experience

## Status

Accepted

## Date

2026-10-18

## Context

The Head Teaching Assistant role at the University of Tehran sat in the same list as the work roles. Teaching and academic roles are not employment, and a recruiter reading the work history should see the employers first. The owner also asked to add the teaching assistant roles from the previous school (Babol Noshirvani University of Technology) as one group.

SOLID and code review are skills the owner wants on the resume. They should not repeat on every role. The posting for BaSalam asks for both.

## Decision

`data/profile.typ` has two lists:

- `experience` holds work roles only: LvtGames, SwapWallet, Ultratrader, Ravindex, Plotset, CubeCraft. CubeCraft (Sep 2016–Feb 2017) was removed from the SWE edition on 18 Oct 2026 on the owner's instruction and restored on 7 Nov 2026 with the four highlights from jtash.ir. Its Plotset dates now follow jtash.ir (Aug 2020–Jul 2021).
- `other-experience` holds teaching and non-employment roles, newest first: Head TA (University of Tehran) and Co-Founder & Lead Architect (Hambazi). The SWE title for Hambazi is `Co-Founder & Lead Architect`. The PM title stays `Chief Technology Officer` through `role-pm`. The Teacher (self-employed) entry was removed on 18 Oct 2026.
- The SWE Head TA line reads `University of Tehran` on the owner's instruction. The earlier `Faculty of Engineering Science` qualifier is in the gap review and can be restored in `profile.typ`.
- No BNUT teaching-assistant roles exist on the owner's LinkedIn profile (PDF, 18 Oct 2026). The BNUT Bachelor's degree is the only BNUT entry.

The SWE renderer `render-swe-resume` prints two headings in this order: `Work Experience`, then `Other Experience`. Both use the same role block. The heading words still contain `Experience`, so the open-ATS heading check and `check_order.py` are unchanged. `Education` follows `Other Experience`, as ADR-001 requires.

The PM renderer `render-two-page-resume` appends `other-experience` after `experience`. The Head TA role moves to the end of the PM dossier. This is a content order change in the PM PDF. Its layout is unchanged, and the PM PDF still builds at two pages.

Skill placement:

- SOLID appears in the skills inventory (`SOLID Principles`), the SWE Skills block (`SOLID`), and once in the Advanced Programming TA role.
- Code review appears in the TA role. The SWE Skills block does not list it. The BaSalam overlay lists it under Primary, and the TA bullet is its source.
- Neither term is repeated on the work roles. A skill belongs on a role only where the role did the work.

## Alternatives considered

### Keep one list with a `kind` field

It works, but the renderer would filter the list twice. Two lists match the two headings. Rejected.

### Put SOLID on every role

That is the repetition the owner asked to avoid. Rejected.

### Add BNUT teaching roles from search results

The search results that mention Babol teaching assistant roles belong to other people with the same first name. The owner's LinkedIn PDF has no such role, so none were added.

## Consequences

- Adding a teaching role means adding it to `other-experience`. The order of that list is the order printed.
- The PM PDF order changed. Rebuild with `make pm` after any change to `other-experience`.

## Amendment (7 Nov 2026): independent products and client engagements

The owner chose to place independent work outside `experience`. Both entries are non-employment roles, so they go in `other-experience`, newest first:

- `Manova: Falak`, Sari, Mazandaran, Iran: a Manova product. Stock, receipts, and access for restaurant operations. Demo environment only; there is no production tenant.
- `Goldstein`, Mashhad, Khorasan, Iran: a paid contract with a three-person team. The product name is printed on the owner's instruction (7 Nov 2026). The client's name is not printed. The contract's confidentiality clause (section 6 of `contract.fa.md`) requires written consent for disclosure. The owner accepted that risk. If the client objects, remove the entry or at least the load-test figures.

The `Independent` work entry is removed from `experience`. Its two bullets described these two projects, so they are replaced rather than kept. The entry's `concurrent` flag described the overlap of that entry with LvtGames and SwapWallet. Both new entries are marked `concurrent: true` for their overlap with the Head TA and Hambazi roles. The renderer does not print the flag.

Titles: both entries use `Developer & Technical Product Manager` on the SWE editions. The PM edition reads `Technical Product Manager & Developer` through `role-pm`. The SWE title keeps the developer role first, which keeps the SWE positioning.

Both entries carry `bullets-pm` with the same text as `bullets-swe`, because `render-two-page-resume` requires that field.

Consequences:

- The two entries pushed the SWE editions to three pages. The owner dropped the Awards & Certifications section from the SWE renderer, and both SWE editions are two pages again. The PM edition still reads the awards data.
- The `Manova / Orbit Platform` project overlaps Falak, which runs on Orbit Auth. A merge would save space. That is still an owner decision, and the project stays in Projects for now.
