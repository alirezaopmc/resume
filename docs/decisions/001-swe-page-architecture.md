# ADR-001: SWE page architecture

## Status

Accepted. Revised 18 October 2026 (second content pass): Skills moved under Summary, the slogan was removed, awards and certifications merged, and the page budget is two pages.

## Date

2026-10-18

## Context

The shared renderer `render-two-page-resume` puts projects, education, and honors on page 1 and all experience on page 2. Ladders’ 2012 fixations and the 2018 layout findings say the first screen needs the current role, dates, and a short overview, in one column. The SWE edition also has to keep the four headings open-ATS scores. The PM edition should keep the current two-page dossier.

## Decision

`swe-resume.typ` and `swe-basalam-resume.typ` call `render-swe-resume`. `pm-resume.typ` keeps `render-two-page-resume`.

SWE reading order:

1. Header in the body: 22 pt name, the SWE title `Senior Back-End Software Engineer`, the location line `Tehran, Iran | Open to Remote`, and the contact lines (phone, email, `jtash.ir`, GitHub, LinkedIn). No slogan.
2. `Summary` (degree named here).
3. `Skills` as a two-level list (`skills-swe-scan`): two bold labels, `Primary` and `Familiar`, each followed by its items, with the `-` marker. Primary holds the tools used across several roles or projects. Familiar holds those used once or only in a skills list.
4. `Work Experience`, latest role first, then the rest. Entries that overlap another entry are marked `Concurrent` in the data and not printed.
5. `Other Experience` (teaching and academic roles, ADR-005).
6. `Education`, `Projects`, `Awards & Certifications` (one merged list, the last section).

Page budget: the SWE PDF is exactly two A4 pages with body text at 10 pt. Margins are 1.4 cm at the sides and 1.3 cm top and bottom, inside the 0.5 in floor in `docs/research/typography-and-layout.md`. Leading is 0.42 em. Role headers stick to their first bullet, and section headings stick to the block under them, so a page never ends on a title.

When a later edit pushes the PDF to a third page, shorten copy first. Do not drop body text below 10 pt to make it fit. Page 1 holds the header, Summary, Skills, and the recent roles. Experience continues on page 2, followed by Other Experience, Education, Projects, and Awards & Certifications.

Dates use an en dash with no spaces (`2025–Present`). A missing month stays missing and is listed in `docs/review/2026-10-18-swe-gap-review.md`.

## Alternatives considered

### Keep the two-page dossier and only rename headings

The parse score would rise, and the first screen would still omit the current role. Rejected for the SWE edition.

### One combined SWE/PM resume

The data model already has two views. The PM PDF is a separate audience. Rejected.

### Force education’s heading into the scan band

That prints `Education` before `Experience` and breaks the heading order in ADR-003’s checker. The degree stays in Summary instead.

### Keep Skills at the end of the file

The first version of the SWE edition put Skills last so the open-ATS heading check and the reading-order gate both saw Experience first. The owner moved Skills under Summary on 18 Oct 2026. The heading check does not depend on position, and the reading-order gate now expects `Summary`, `Skills`, `Experience`. See ADR-003.

## Consequences

- Agents editing page 1 read this ADR and `docs/research/recruiter-scan.md`.
- PM layout bugs are not fixed by SWE work.
- The phone is a profile field on the contact line (`data.phone`). It is not a second column.
- The SWE edition has no slogan. The slogan is not in `data/profile.typ`.
