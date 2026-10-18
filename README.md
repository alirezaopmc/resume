# Alireza Jafartash — Professional Resumes

Modular resumes built on [Typst](https://typst.app) and [`alirezaopmc/dorost`](https://github.com/alirezaopmc/dorost). The visual system is the one documented in [`docs/brand/brand-guidelines.md`](docs/brand/brand-guidelines.md), shared with [jtash.ir](https://jtash.ir).

Agent entry point: [`AGENTS.md`](AGENTS.md). Research, decisions, and the SWE gap review: [`docs/README.md`](docs/README.md).

## Editions

| Edition | What it is | Entrypoint | Output |
| --- | --- | --- | --- |
| Senior Back-End Software Engineer | Two-page A4 resume. Page 1 is a header, a summary, the skills by category, and the recent roles. Page 2 holds the rest of the experience, education, projects, and awards. | [`swe-resume.typ`](swe-resume.typ) | `output/alireza-jafartash-swe.pdf` |
| Senior Back-End Software Engineer (BaSalam) | The SWE layout with a summary and a skills block written for the BaSalam Back-End posting. Same experience and facts as the SWE edition. | [`swe-basalam-resume.typ`](swe-basalam-resume.typ) | `output/alireza-jafartash-swe-basalam.pdf` |
| Technical Product Manager | Two-page dossier. Page 1 is the briefing and arsenal. Page 2 is the experience record. This layout is unchanged. | [`pm-resume.typ`](pm-resume.typ) | `output/alireza-jafartash-pm.pdf` |

The SWE page budget, heading order, and score gate are decided in [`docs/decisions/`](docs/decisions/).

## Build

```bash
make swe       # output/alireza-jafartash-swe.pdf
make pm        # output/alireza-jafartash-pm.pdf
make basalam   # output/alireza-jafartash-swe-basalam.pdf
make all

make ats           # build the SWE PDF, score it offline, check reading order
make ats-basalam   # same gate for the BaSalam PDF
make ats-jd JD=path/to/posting.txt

make previews  # PNG of each page
```

`make ats` downloads open-ATS v0.2.0 into `tools/ats/bin/` on first run. The binary is not committed. Poppler’s `pdftotext` must be on `PATH`.
