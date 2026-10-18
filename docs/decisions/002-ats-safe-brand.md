# ADR-002: ATS-safe brand

## Status

Accepted

## Date

2026-10-18

## Context

`lib/resume.typ` brands the page with jtash.ir tokens: obsidian text, accent `#1656ad`, Inter, JetBrains Mono, numbered rails, tag pills, and a green status dot. Those tokens are the brand. The rail, the pills, and the dot are also the shapes open-ATS scores as columns, tables, or drawn bullets. The SWE edition needs the brand and a clean parse.

## Decision

Color, type, and the name-as-mark stay. See `docs/brand/brand-guidelines.md`.

On the SWE edition only, decoration that fails the parse is removed:

- No left rail and no card grid.
- No filled pills and no status dot.
- List marker is the character `-`.
- Company name and links use `c-accent`. Section rules use `c-accent`.
- JetBrains Mono is for a short meta label, not for a second column of contacts.

The PM renderer keeps the rail and the pills until a separate decision says otherwise.

## Alternatives considered

### A new visual system

The site and the existing tokens already identify the person. A second palette would split the brand. Rejected.

### Keep the rail and accept −12

The gate in ADR-003 fails the build on that penalty. Rejected for SWE.

## Consequences

- Brand edits that add a box, an icon, or a right-hand column need a new ADR if they should appear on the SWE PDF.
- Token changes happen in `lib/resume.typ` and in `docs/brand/brand-guidelines.md` together.
