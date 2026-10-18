# Structure and length

Rule: one column. The text must contain the headings Summary, Skills, Experience, and Education. On the SWE edition the order is Summary, Skills, Experience, Other Experience, Education, Projects, Awards & Certifications. Two pages at 10 pt. Body text does not go below 10 pt to make the page count.

## Heading order

open-ATS v0.2.0 treats a line as a heading when it is at most 40 characters, does not end with `.`, `,`, or `;`, and is almost entirely letters. It then looks for these substrings (`ats_score/checks_ats.py`, `SECTION_KEYWORDS`):

| Needed section | A heading matches if it contains |
| --- | --- |
| Summary | summary, profile, objective, about |
| Experience | experience, employment, work history |
| Education | education, academic |
| Skills | skills, competencies, technologies |

Each missing section costs 8 points. Projects, awards, and certifications are not required by that checker. JSON Resume uses the same family of names in its schema: `basics.summary`, `skills`, `work`, `education`, `projects`, `awards`, `certificates`.

`Profile` would satisfy Summary. `Core Arsenal` satisfies none of the Skills keywords. This repo prints the four required words as their own lines: `Summary`, `Skills`, `Experience`, `Education`.

The open-ATS heading check does not care where a heading sits. The reading-order gate in `tools/ats/check_order.py` does, and it expects Summary, then Skills, then Experience. That order matches the scan: the stack is visible before the roles.

Experience stays one section. The latest role is the first entry. Other Experience is a second heading under Experience, so the heading words still match. Education follows Other Experience. The degree is also named in Summary, which is how the 2012 fixation list still sees education in the scan band.

## Page count

MIT CAPD’s checklist asks for one page, and allows two with an advanced degree or 10+ years of experience. Ladders 2018 recommends a two-page limit for more experienced candidates and reports that pages after the second draw little attention.

This SWE edition targets exactly two pages at 10 pt. The spacing and margins in `lib/resume.typ` (`resume-doc-swe`) are the lever. Cutting copy is a content decision, so it goes back to the owner, not into the renderer.

## What page 1 holds

- Header in the body, not only in a PDF running header.
- Summary, Skills (Primary and Familiar groups), and the start of Experience (latest role, then the next recent roles).

Page 2 continues Experience, then Other Experience, Education, Projects, and Awards & Certifications.
