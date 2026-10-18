# SWE gap review

Reviewed 18 October 2026 against `data/profile.typ` and `lib/resume.typ` before `render-swe-resume`. Rules live in `docs/research/`. Disposition is what the SWE edition does. The PM edition still uses `render-two-page-resume`.

After the content pass, `make ats` (open-ATS v0.2.0) reports 100/100 with no findings. The contact line includes `+98 938 872 7940` (`tel:+989388727940`) and `alirezaopmc@gmail.com` only. Reading order is name, Summary, Experience, then Skills at the end. The PDF is 3 pages at 10 pt.

Claims marked **verify** were not rewritten. Months marked **unknown** were not invented.

## Structural

1. **Experience started on page 2.** `render-two-page-resume` filled page 1 with profile, skills, projects, education, and honors, then called `pagebreak()` before experience (`lib/resume.typ`, the page-break comment above section 05). Ladders 2012 puts current title, company, and dates in the first screen. **Fixed** in `render-swe-resume`: Experience starts in the scan band.

2. **Multi-column layout.** Section rail is a two-column grid (`columns: (rail-width, 1fr)`). Awards use two columns. Certifications use three. The header puts contacts in a right-hand stack. open-ATS subtracts 12 for a gutter with lines on both sides. **Fixed** for SWE: one left-aligned column. PM still uses the grids.

3. **Section tokens.** Page 1 labels were Profile, Core Arsenal, Notable Tools, Education, Honors. `Core Arsenal` does not contain `skills`, `competencies`, or `technologies`, so open-ATS counts Skills as missing (−8). Profile does match Summary. **Fixed** for SWE: the lines `Summary`, `Skills`, `Experience`, `Education`.

4. **Type size.** `resume-doc` sets 8.5 pt body. Labels go down to 5.8 pt. MIT CAPD’s floor is 10 pt. **Fixed** for SWE: 10 pt body and contact, 22 pt name. PM stays at 8.5 pt.

5. **Target line mixed two careers.** `data/profile.typ` `status` is `Open to Senior SWE & Staff / Technical PM roles`. The SWE title in the old renderer was already `Senior Software Engineer · Systems Architecture & Financial Ledgers`. **Fixed** for SWE: the header prints that title and does not print `status`. The field remains for the PM edition.

6. **Phone.** `data.phone` is `+98 938 872 7940`, linked as `tel:+989388727940` on the SWE contact line and in the PM contact stack. The only email is `alirezaopmc@gmail.com`. `jtash@ut.ac.ir` is not in the repo. The public site lists the same Gmail address.

## Dates

open-ATS only flags a mix of `Jan 2024`, `01/2024`, and `'21`. A bare year does not count as a second style. The strings below were still hard for a person to align. En dashes replace em dashes in period strings. Unknown months stay unknown.

| Entry | String | Source |
| --- | --- | --- |
| Independent | `2025 – Present` | start month still unknown |
| University of Tehran (Head TA) | `Sep 2026 – Present` | month before Oct 2026 |
| LvtGames | `Aug 2025 – Mar 2026` | jtash.ir experience card, Istanbul |
| SwapWallet | `May 2025 – Jul 2025` | jtash.ir, already matched |
| Ultratrader | `Feb 2024 – Oct 2024` | jtash.ir; location is Toronto, Canada |
| Ravindex | `May 2022 – Dec 2023` | jtash.ir, already matched |
| Plotset | `Aug 2021 – Jul 2022` | jtash.ir experience card, California, US |
| Cubecraft | `Sep 2016 – Feb 2017` | LinkedIn profile PDF (18 Oct 2026), London, UK. The earlier `Aug 2017` came from jtash.ir and is superseded. |
| M.Sc. | `Sep 2024 – Present` | jtash.ir education card |
| B.Sc. | `Sep 2018 – Aug 2024` | jtash.ir education card |

The jtash.ir month grid paints Plotset only through Apr 2022, because May 2022 is Ravindex and the grid shows one employer per cell. The experience card says `Aug 2021 – Jul 2022`. The resume uses the card.

Manova is not an experience entry. Orbit lives under Projects as `Manova / Orbit Platform`. `manova.space` returned HTTP 502 on 18 Oct 2026, so that project has no URL. Promux and Dorost stay linked to their GitHub repositories.

Overlapping spans are `concurrent: true`. The SWE renderer does not print that word.

- Independent (`2025 – Present`) overlaps the Head TA role, LvtGames, and SwapWallet.
- Ravindex overlaps Plotset (`May 2022 – Jul 2022`).
- Ultratrader and Cubecraft do not overlap another role at the precision above.

## Copy to verify

These sentences are still in `data/profile.typ`. The SWE renderer prints them as written.

- **Years.** The summary says “Since 2016,” the Cubecraft start. The old “8+ years” line is gone.
- **Department.** The TA employer line was `University of Tehran — Dept. of Science`. That is not the faculty for the M.Sc. in Algorithms and Computation. The program is in the Faculty of Engineering Science (دانشکده علوم مهندسی), College of Engineering. The College of Science (دانشکدگان علوم) is a different unit and teaches Computer Science. The line now reads `University of Tehran — Faculty of Engineering Science`.
- **Lambda.** The Ravindex SWE bullet no longer says Lambda. It says 20+ automated data-fetching services, on the same RabbitMQ and Prometheus/Grafana work.
- **UUID link.** `distributed-uuid` `url` is empty. The name prints as text. The old value was the GitHub profile, not a repository.
- **Consulting copy.** The role is `Consultant and Developer` at `Independent`. Two SWE bullets: the gold-trading ledger, then the kitchen inventory ledger. No client or product names. Manova and Promux stay in Projects.
- **Impact figures still unverified.** Project PM line “time-to-market by 4x”. SWE counts still in the file: “15+ TAs”, “200+ students”, “300+ event listeners”, “50+ state”, “20+ automated data-fetching services”, “5+ applications”. The old “60%” and “750-fineness” lines are gone.

## Skills

`skills-swe` lists Go through Typst, including Kotlin, C++, and Typst, in five tag rows. Ladders 2018 treats keyword stuffing as a trait of resumes that lose the scan. **SWE scan line** is `skills-swe-scan`: the tools named on the latest roles (Go, TypeScript, Java/Spring Boot, PostgreSQL, Redis, Kafka, Docker, Kubernetes, Terraform, GCP). The wider list remains in each role’s `tech` string, so those words stay in the file. `skills-swe` itself is unused by `render-swe-resume` and is still the inventory the PM file does not read. PM reads `skills-pm`.

## Awards on the first screen

`awards` includes `Top 300` at Codeforces Round 611 Div. 3 (2019). Fine as a later line. It is not in the scan band. Awards render after Education.

## PM

`pm-resume.typ` still calls `render-two-page-resume`. Findings 1–4 remain true of that PDF. That is intentional. Shared copy (dates, consulting bullets, the phone, and the move of Manova into Projects) is the same data the SWE file reads. The PM columns, type size, and section order are unchanged.

## Update: second content pass (18 Oct 2026)

The findings above describe the first pass. This section records what the second pass changed. The earlier findings stay as the record of that pass.

Reading order is now name, Summary, Skills, Experience (`tools/ats/check_order.py`). The Skills block is four labelled groups under Summary (ADR-001). The SWE PDF is two pages at 10 pt. `make ats` and `make ats-basalam` both score 100/100 with no findings.

Changes:

- **Header.** The slogan is removed. The title is `Senior Back-End Software Engineer`. The location line is `Tehran, Iran | Open to Remote`.
- **Summary.** Replaced with the owner's text (four-plus years, Go, Python (Django), Java (Spring Boot), PostgreSQL, M.Sc. candidate).
- **Work roles.** Bullets and tools replaced with the owner's text. Plotset and the Head TA entry have no Tools line, as the owner's text has none. Plotset's Tools line was dropped, and its bullet names Node.js and D3.js.
- **Dates.** Written with an en dash and no spaces (`2025–Present`). Head TA reads `Sep 2024–Present [TODO: verify start year]`, the owner's date. This supersedes `Sep 2026 – Present` in the table above.
- **Removed.** Cubecraft (the MongoDB source), the Teacher entry, and the Distributed UUID project. The thesis is now in Education as `128-bit (16-byte)`. The earlier `32-byte` wording in the Projects list is gone with the project.
- **Awards & Certifications.** One list of six, with the Codeforces entry dropped and the second Digikala bootcamp deduplicated. The machine-learning entry has the label `Certificate` so the award line has a place value.
- **Other Experience.** Head TA employer reads `University of Tehran`. The `Faculty of Engineering Science` qualifier from the first pass is not printed. Hambazi reads `Co-Founder & Lead Architect` on the SWE edition. The PM edition keeps `Chief Technology Officer`.
- **Typos.** `Al` for `AI`, `mixeddirection`, `Cl`, and `multitenant` were not present in the source. `Turkiye` is now `Türkiye`. `Promux` and `Dorost` already read correctly.

Third pass (19 Oct 2026):

- **Consulting bullets.** The two ledger bullets in the Independent role are one bullet now. It names the mechanisms (integer minor-unit arithmetic, pessimistic row locks, append-only journal) and `multi-currency`. Rial, Toman, gram, mithqal, and gold are not named. The earlier `Consulting copy` note above describes the superseded two-bullet form.
- **PM copy.** The PM bullet for the same role reads `in-person settlement`, with the metal name removed.
- **Spacing.** The date line and the Tools line now have explicit gaps (`swe-role`). The first-pass date-to-bullet collision is gone. Page count is still two pages.

Fourth pass (19 Oct 2026, owner's notes):

- **Independent.** The first bullet is the early-stage multi-currency trading SaaS, built full-stack with NestJS and Next.js. It names no currency or metal. The second bullet is the full-stack inventory system with a notification system and monitoring and tracking. The Skills line lists React and Next.js.
- **LvtGames.** The TPS placeholder is removed. The deployment figure is `~30%`.
- **SwapWallet.** The latency sentence has no numbers now: `reducing p99 execution latency`.
- **Ultratrader.** `30+ external broker APIs`, `~1,000 events/sec on average`, and `300k events/sec at p95`.
- **Hambazi.** The Telegram bot for user, event, and game management is first, backed by the platform backend.
- **B.Sc. thesis.** `10,000,000 IDs/sec per node`.
- **Open placeholders (7):** Independent merchant count, daily transactions, and sites; Ultratrader reporting latency; Head TA start year; Hambazi stack and active members.
- **Title check.** The Independent title reads `Consultant and Lead Back-End Developer`, and both projects are now described as full-stack. The owner can decide whether the title should change.

Open items for the owner:

- **MongoDB.** No remaining role or project names it. It stays in the Skills block and the BaSalam overlay on the owner's instruction. Confirm it, or remove it.
- **Linux.** Listed in the Skills block, with no role or project naming it.
- **High Availability.** Listed in the PostgreSQL group. The resume evidences replication (Ravindex), not availability targets.
- **Placeholders.** Every `[TODO: ...]` is still in the file, including the Head TA start year, the TPS, latency, and event-rate figures, and the Hambazi stack.
- **PM edition.** `data/profile.typ` is shared. The PM source now reads the same removed and merged entries, and its page-2 credentials card still prints the earlier three certifications. `make pm` has not been run, and the tracked PM PDF in `output/` is from before this pass.

Fifth pass (19 Oct 2026, owner's answers to the placeholders). The seven `[TODO: ...]` placeholders are resolved, and both PDFs have no TODO text:

- **Independent merchants.** `for a few jewelry merchants`.
- **Independent daily transactions.** `processing 10,000 daily transactions`.
- **Independent sites.** `for multiple sites`.
- **Ultratrader reporting latency.** `cut reporting latency by more than 90%`.
- **Head TA start.** The period reads `2026–Present`, as the owner gave. The month was dropped to match the Independent entry. This supersedes the `Sep 2024–Present [TODO: verify start year]` line in the first-pass notes.
- **Hambazi stack.** `backed by the community platform backend (NestJS and Next.js)`.
- **Hambazi members.** `1,000+ active members`.

Two answers were turned into the wording above, so check them before sending: `a few` is vague for a merchant count, and `10,000` has no plus sign, unlike the other counts.

Sixth pass (19 Oct 2026, external review of both editions, checked against the source):

- **Ultratrader.** The average and p95 pair is replaced with `~1,000 events/sec sustained, with bursts to 300k events/sec`. The earlier pair cannot both hold if they measure one series.
- **Thesis.** The wording is unchanged. The owner confirmed RabbitMQ is in the ID path.
- **Olympiads.** Kept in the BaSalam summary on the owner's answer. The reviewer noted no matching entry, and the owner accepted that.
- **Head TA.** `2026–Present` kept on the owner's answer. The Oct 2024 to May 2025 gap remains.
- **Skills.** Split into `Primary` and `Familiar` in both editions. Familiar holds the tools used once or only in a skills list (Kotlin, MongoDB, GraphQL, Kubernetes, and others). MongoDB stays in the list, flagged as unsourced by any role.
- **Summary.** Cut to high-level wording (technologies, languages, databases, paradigms, products). The SWE summary and the BaSalam summary no longer name a stack, a company, or a university. The BaSalam summary no longer has the "agentic" focus line.
- **Not changed.** Awards, the page-2 running header, SwapWallet latency numbers (the owner asked for none), and the Independent title.

Seventh pass (19 Oct 2026, owner's note): the LvtGames, SwapWallet, and Ultratrader roles are labelled `Software Engineer (Full-time)`, replacing `(Contract)`. The periods and bullets are unchanged. Both PDFs are rebuilt, score 100/100, and are two pages.

Eighth pass (19 Oct 2026, owner's note): the parentheses are removed from the role titles and the location lines. Work arrangement (`Remote`) and employment type (`Full-time`) now print as separate items on the metadata line, after the location. This uses two optional fields, `workplace` and `employment`, on each experience entry. SwapWallet has no workplace value in the source, so none is printed. The Plotset entry is `Remote` with no employment type. Both PDFs are rebuilt, score 100/100, and are two pages.
