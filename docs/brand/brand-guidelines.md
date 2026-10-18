# Brand

Personal brand for Alireza Jafartash, carried by the SWE resume and by [jtash.ir](https://jtash.ir). The values below are the ones in `lib/resume.typ`. When a color or face changes, change the token and this file in the same edit.

## Voice

Precise, concrete, technical. A sentence names the system, the constraint, and the result that is already true. Tools appear as themselves (`PostgreSQL`, `Go`), not as a category slogan.

Words that carry the voice: ledger, concurrency, multi-tenant, pipeline, ownership.

Name the mechanism, not the instrument. Write `multi-currency ledger` and `integer minor-unit arithmetic`. Do not name the currencies or the metal (no Rial, Toman, gold, gram, mithqal) on the resume. The owner set this on 19 Oct 2026.

The SWE header has no slogan. It was removed on 18 Oct 2026, so the title and location carry the first line.

Leave unused: status pills that name two careers, tag mosaics, and adjectives that a reader cannot check. The consulting role names the work, not the client. Product names belong under Projects.

## Color

| Token | Hex | Use |
| --- | --- | --- |
| `c-text` | `#0b1120` | Name, section labels, role titles |
| `c-body` | `#1e293b` | Body |
| `c-muted` | `#64748b` | Dates, location, secondary lines |
| `c-accent` | `#1656ad` | Title, company, links, the rule under a section |
| `c-rule` | `#e2e8f0` | Quiet rules, if a section rule is not the accent |

Accent on type and on a horizontal rule. The SWE edition does not use filled pills, card strokes, or a status dot. Those shapes are vector marks and second columns. See `docs/decisions/002-ats-safe-brand.md`.

## Type

| Role | Face | Size |
| --- | --- | --- |
| Name, section labels, role titles, degree and project names | Source Serif 4, then Liberation Serif | 22 pt name, 12 pt sections, 11 pt roles, 11 pt degree and project names |
| Title | Source Serif 4 | 12 pt title |
| Body, contact, dates, bullets | Inter, then Liberation Sans | 10 pt |
| Meta that must stay narrow | JetBrains Mono, then Liberation Mono | 10 pt, and only when 10 pt Inter cannot carry a short label |

Source Serif 4 is the heading face (SIL Open Font License). Inter stays the body face. Both are real text in the PDF, so the parse check still reads them.

One column. Left aligned. Links are the accent color and are real URLs (`mailto:`, `https://`).

## Name and title

- Name line: `Alireza Jafartash`
- SWE title line: `Senior Back-End Software Engineer`
- Site: `jtash.ir`
- Phone: `+98 938 872 7940`
- Email: `alirezaopmc@gmail.com`
- The PM edition may still show the shared status string. The SWE header does not.

## Mark

There is no logomark on the resume. The name in `#0b1120` at 22 pt is the mark. A rule in `#1656ad` under the contact line closes the header.
