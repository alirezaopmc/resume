# ATS parsing

Rule: the PDF’s text layer, in reading order, must contain the name, a real email, the location, a LinkedIn or GitHub URL, and the four headings Summary, Skills, Experience, and Education. Layout that splits the page into a left rail and a right column fails the column check this repo gates on.

## What a parser does

MIT CAPD describes an ATS as a database that stores text extracted from the file, and sometimes scores that text against a posting. Their failure list is graphics, icons, images, tables, and text boxes. Their own test is to read the file as plain text and check for missing words and scrambled order. RenderCV’s write-up of the same pipeline has four steps: extract text, split sections, pick fields, store rows. That write-up is their test report, not a vendor specification for Workday or Greenhouse. This repo does not claim a named commercial ATS drops headers unless a vendor document says so. The practical rule we follow is MIT’s: if the plain-text extract is scrambled or missing, the parse failed.

## What open-ATS v0.2.0 actually subtracts

Score starts at 100. From `checks_ats.py` and `extract.py`:

| Condition | Penalty |
| --- | --- |
| Scanned or almost no text | 40, fail |
| Tables (`page.extract_tables()`) | 12, fail |
| Multi-column (a vertical gutter with real lines on both sides) | 12, fail |
| Images | 5, warn |
| Vector bullets (small drawn marks, no text bullet) | 4, warn |
| Each missing Summary, Experience, Education, Skills | 8, warn |
| No email in text or `mailto:` | 10, fail |
| No phone in text or `tel:` | 5, warn |
| No `City, Region` in the first 8 lines and no remote/hybrid/on-site word | 3, warn |
| No LinkedIn, GitHub, GitLab, or the word portfolio | 3, warn |
| More than one date style among `Jan 2024`, `01/2024`, and `'21` | 5, warn |

A year with no month (`2024 – Present`) does not count as a date style. Mixing it with `Jan 2024` does not trip the date check. This resume still prefers `MMM YYYY` when the month is known, so a person can read the timeline. Unknown months stay as a year. They are listed in the gap review.

Location is checked on the first 8 lines for a `City, Region` pair. The word `remote` is checked on the whole text. `Tehran, Iran` in the header satisfies the city form.

Column detection bins word centers. A near-empty vertical band in the middle 35–65% of the width, with several lines that sit entirely to its left and several that sit entirely to its right, is a gutter. A date parked alone on the right, repeated down the page, can create those right-only lines. A title and a date on the same baseline usually do not, because that line has words on both sides. The SWE layout keeps every line left-aligned so the right half never holds a line of its own.

`extract_tables()` flags ruled grids. The SWE layout uses no card grids and no vertical rules. A single horizontal rule under a heading is the only rule.

Drawn-bullet detection looks for vector marks smaller than 12 pt in the left half. A filled status dot qualifies. The SWE layout uses a text hyphen as the list marker and does not draw a dot.

## File and text layer

Typst 0.14 (24 October 2025) writes tagged PDF by default. Typst 0.15 continues that. Tags describe headings, paragraphs, and lists when the source uses those elements. Tags do not repair a two-column reading order. open-ATS reads text with pdfplumber, not the tag tree. The gate in this repo is the pdfplumber score plus a Poppler `pdftotext` order check.

MIT CAPD: common fonts, at least 10 pt, `.pdf` or `.docx` unless the posting asks for something else. Inter is embedded by Typst when the font is available; Liberation Sans is the fallback named in `lib/resume.typ`.
