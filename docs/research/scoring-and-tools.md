# Scoring and tools

Rule: `make ats` is the score that matters in this repo. It runs open-ATS v0.2.0 offline and a reading-order check. A hosted checker is a manual option and is not part of the build.

## The gate

Tool: open-ATS `tool-linux-x86_64`, release v0.2.0 (25 June 2026).

- URL: `https://github.com/NoahMustafa/open-ATS/releases/download/v0.2.0/tool-linux-x86_64`
- sha256: `2a3dd861e8b8f94902b2665e8ba2b089da028988cabfb2527dd6f1078cd1ceca`
- The binary is about 110 MB. `make ats` downloads it into `tools/ats/bin/`, which is gitignored. The repo does not vendor it.

Command: `tool output/alireza-jafartash-swe.pdf --json`

JSON shape (`ats_score/report.py`, `to_dict`): `overall` (the ATS score), `ats.score`, `ats.findings[]` with `severity`, `message`, `penalty`. Writing advice is present and does not change `overall`. `--jd FILE` adds `jd_match` and is optional. No posting is stored in the repo.

Pass rule:

- If every finding is the missing-phone warning, the score must be at least 85.
- Otherwise the score must be at least 90.

A clean file with no phone scores 95. That passes both thresholds. Any column, table, or missing-section finding drops the file under 90 and fails the build.

`make ats` also runs `pdftotext -layout` and checks that `Alireza Jafartash`, `Summary`, `Skills`, and `Experience` appear in that order. Skills sits under Summary, as ADR-001 records. The order list is in `tools/ats/check_order.py`.

`make ats-jd JD=path/to/posting.txt` runs the same binary with `--jd`. It does not change the pass rule. It prints the match so a later edit can target one posting.

## What the number is

open-ATS v0.2.0 states that the number is parse readiness, not a prediction of a recruiter’s rank, and not a bullet-quality grade. Content grading is unwired. The JD tier is gazetteer overlap plus vector similarity, not a reading of the evidence. Use the findings. A file whose only finding is a missing phone scores 95. This resume includes a phone, so a clean parse is 100.

## Hosted checkers

MIT CAPD names Jobscan, Skillsyncer, and Resume Worded as services that upload a resume and a posting and return a comparison. They need an account, they send the file off the machine, and free tiers are quota-limited. They are not called from `make`. Use one when you have a specific posting and want a second opinion. Do not treat that opinion as the repo gate.

A hosted report on 18 October 2026 flagged this file. Checked against the PDF (`pdfinfo`: 3 pages; `pdftotext`: about 760 words; the only first-person pronoun is the slogan “I engineer products that scale.”). Disposition:

| Finding | What is true | Do |
| --- | --- | --- |
| Personal pronoun | Career offices tell writers to drop “I” from bullets (Indiana State résumé guide; MIT CAPD toolkit). Parsers do not score it. open-ATS does not. | Optional: drop the “I” in the slogan. Do not rewrite bullets; they already have no pronoun. |
| Missing keyword “Agile” | Keyword match is against one posting (Jobscan’s own description of its matcher). “Agile” is not a universal required word. Ladders 2018 treats keyword stuffing as a trait of resumes that lose the scan. | Do not add it unless a real posting asks and the work is true. |
| Complex gold-ledger sentence | Wentworth’s grammar guide asks for lean sentences. That bullet is one long sentence on purpose: two products, two bullets. | Leave the two-bullet shape. Do not split it back into a feature list. |
| Awards are “generic sentences” | Those lines are place, contest, and year. They are not sentences. Expanding them adds the filler the same report warns against. | Leave the award lines short. |
| Longer than 3 pages | The PDF is 3 pages. The report’s own text allows 3 pages after 10 years. Work starts September 2016. | Do not cut roles to satisfy the flag. Page 3 is projects, awards, certifications, and skills, which Ladders 2018 already says draws little attention. |
| 400–600 words | The band comes from a TalentWorks sample of about 6,300 applications, career level unreported, retold by Cultivated Culture and by Pitt Career Central as “not policy” and “about one page.” This file is about 760 words, near 250 a page. “More detail” and “too long” contradict each other. | Do not pad and do not cut to hit the band. |

Superseded on the second content pass (18 Oct 2026). The slogan is gone from the header, so the pronoun row no longer applies. The SWE PDF is two pages at 10 pt, so the page-count row no longer applies. The award lines remain short labels. The Agile and word-count rows still stand. The gold-ledger row is superseded on 19 Oct 2026: the two ledger bullets are merged into one, and the currency and metal names are gone.
