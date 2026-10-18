# Comparable resumes

Rule: copy linear order and standard section names. Leave behind one-page career-fair layout, header tables, and right-aligned date columns.

## Jake’s Resume (`sb2nov/resume`)

README: “A single-page, one-column resume for software developers.” The stated reason for one page and one column is career fairs and online applications; two-column templates were the thing he was leaving. The sample file `sourabh_bajaj_resume.tex` uses 11 pt article class, `\pdfgentounicode=1`, and sections in this order: Education, Experience, Projects. Skills is present only as a comment.

The header is a `tabular*` with the name on the left and email and phone on the right. Each role is another `tabular*` with the date on the right. That is the pattern to avoid here: open-ATS penalizes tables by 12 and can read a repeated right-hand date as a second column. The useful part is the single reading order and the plain section names.

One page does not transfer. Ladders 2018 allows two pages for experienced candidates. This edition is two, or three when the later sections need the room at 10 pt.

## RenderCV

RenderCV’s ATS page reports a test they ran: 4 resumes × 5 themes = 20 Typst PDFs, text extracted with pdftotext and PyMuPDF, then parsed by Affinda, Extracta, and Klippa. They report correct name, email, phone, company, title, dates, and degree on those files, and they attribute that to a single-column text layer plus Typst’s tagged PDF. That is the vendor’s own corpus. It is evidence that a single-column Typst PDF can parse, not a certificate for every theme.

Their classic theme still places dates in a right-hand column (`date_and_location_column_alignment: right`). This edition keeps dates on the left for the gutter test in open-ATS.

## JSON Resume

The schema is a data contract, not a page layout. Fields this resume already has a home for: `basics.name`, `label`, `email`, `url`, `summary`, `location`, `profiles`, `work`, `education`, `skills`, `projects`, `awards`, `certificates`. The schema stores dates as ISO-8601 (`2014-06` or `2014`). Print dates in this repo stay `MMM YYYY` when the month is known, because that is one visual style a recruiter can scan. The schema’s phone field exists. This resume prints `data.phone` on the contact line.

## What this edition takes

- One column, from Jake’s README and from RenderCV’s parse report.
- Section names an ATS checker and JSON Resume both recognize.
- 10–11 pt body, in the MIT and Jake range.
- Experience before a long education block, because Ladders’ fixation list leads with current and previous roles. The degree still appears in Summary so education is on the first screen.
