# Typography and layout

Rule: A4, one column, body at 10 pt or larger, name near 22 pt, margins between 0.5 in and 1.0 in. Brand color is allowed on type and on a horizontal rule. Boxes, rails, and icon rows are not.

## Size and margins

MIT CAPD’s checklist: body 10–12 pt, a common face, margins 0.5–1.0 in, bold for headers and roles, dates in one format. Their ATS note repeats the 10 pt floor.

This edition:

- Paper: A4 (210 × 297 mm).
- Margins: 1.4 cm left and right (~0.55 in), 1.3 cm top and bottom (~0.51 in). All sit inside MIT CAPD’s 0.5–1.0 in range.
- Name: 22 pt, bold.
- Title: 12 pt, accent color.
- Body and contact: 10 pt.
- Section label: 12 pt, bold, on its own line, with a horizontal accent rule.
- Role title: 11 pt, bold. Company: 10 pt, accent. Dates and location: 10 pt, muted, on the line under the company.
- Leading: 0.42 em. Paragraph spacing: 0.5 em.
- Role block gaps, set explicitly in `swe-role`: 9 pt above the role, 2 pt between the title, company, and dates, 5 pt from the dates to the first bullet, 5 pt from the last bullet to the Tools line.

The explicit gaps replace a single paragraph with line breaks. In that layout the dates line touched the first bullet (second pass, 19 Oct 2026).

The contact block is two left-aligned lines: phone, email, and `jtash.ir` on the first; GitHub and LinkedIn on the second. The location line (`Tehran, Iran | Open to Remote`) sits above it. All of it is body text in the first lines of the file, so the location check (first 8 lines) and the link check both see it.

## Header budget

The header is name, title, location, contact lines, rule. The scan band starts under that rule. Forty percent of A4 is ~119 mm from the top of the sheet. The content target is the block under the rule: Summary, Skills, and the latest roles. Empty space is not added to force the band to 119 mm.

## Single column

See `ats-parsing.md` for the gutter test. Roles read:

```
Consultant and Lead Back-End Developer
Independent
2025–Present · Tehran
```

The role is bold. The company is on the next line in the accent color. Dates stay on the left. A role header sticks to its first bullet, so a page never ends on a title.

## Bullets

The list marker is the character `-`. open-ATS flags small vector dots and ignores a text marker. Ladders 2018 asks for short declarative bullets under a bold title. Existing bullet copy is kept.
