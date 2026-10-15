# Alireza Jafartash — Professional Resumes

Modular, minimal, high-density professional resumes built on [Typst](https://typst.app) and [`alirezaopmc/dorost`](https://github.com/alirezaopmc/dorost). Styled with the crisp technical brutalism and typography inspired by [jtash.ir](https://jtash.ir).

---

## 📑 Resume Editions

| Edition | Target Audience | Primary Focus | Pages | Entrypoint | Output |
| :--- | :--- | :--- | :---: | :--- | :--- |
| **Senior SWE (Compact)** | Engineering Leaders, CTOs, Staff Roles | Systems design, financial ledgers, low latency, AI ops | **1** | [`swe-resume.typ`](./swe-resume.typ) | `output/alireza-jafartash-swe.pdf` |
| **Technical PM (Compact)** | Product Leadership, Founders, VPs of Product | Discovery, user needs, cross-team bridge, UI/UX | **1** | [`pm-resume.typ`](./pm-resume.typ) | `output/alireza-jafartash-pm.pdf` |
| **Senior SWE (Extended)** | Enterprise dossiers, academic, detailed reviews | Deep architectural narratives & infrastructure traces | **2** | [`swe-resume-extended.typ`](./swe-resume-extended.typ) | `output/alireza-jafartash-swe-extended.pdf` |
| **Technical PM (Extended)** | Product leadership reviews & case studies | Full discovery, roadmapping, and metric outcomes | **2** | [`pm-resume-extended.typ`](./pm-resume-extended.typ) | `output/alireza-jafartash-pm-extended.pdf` |

---

## 🏛️ Architecture & Modularity

The repository separates **Data**, **Presentation Engine**, and **Entrypoint Configurations**:

```
.
├── data/
│   └── profile.typ          # Canonical single source of truth (experience, bullets, skills, tools)
├── lib/
│   └── resume.typ           # Layout engine: jtash.ir visual tokens, numbered rails, status pills
├── fonts/                   # Bundled Inter & JetBrains Mono fonts
├── swe-resume.typ           # SWE 1-page compact configuration
├── pm-resume.typ            # PM 1-page compact configuration
├── swe-resume-extended.typ  # SWE 2-page deep-dive configuration
├── pm-resume-extended.typ   # PM 2-page deep-dive configuration
└── Makefile                 # Build automation
```

### 🔀 Reordering Sections on the Fly

You can reorder sections dynamically based on the company or opportunity you're targeting:

```typ
#import "lib/resume.typ": resume-doc, render-resume
#import "data/profile.typ" as profile

#show: resume-doc.with(compact: true)

#render-resume(
  profile,
  view: "swe", // or "pm"
  compact: true,
  section-order: (
    "profile",
    "skills",     // e.g. Put skills before experience for tech screeners
    "projects",   // Highlight Promux & Orbit before work history
    "experience",
    "education",
  ),
)
```

---

## 🛠️ Build Commands

```bash
# Build all 4 PDF variants
make all

# Build individual variants
make swe       # Output: output/alireza-jafartash-swe.pdf
make pm        # Output: output/alireza-jafartash-pm.pdf
make swe-ext   # Output: output/alireza-jafartash-swe-extended.pdf
make pm-ext    # Output: output/alireza-jafartash-pm-extended.pdf

# Render high-resolution PNG previews
make previews
```

---

## 🌟 Highlights & Projects Featured

- **Promux (`github.com/alirezaopmc/promux`)**: Autonomous multiplexer for agentic AI CLIs. Intercepts HTTP 429/500 quota exhaustion, auto-rotates accounts with TTL cooling, and preserves running agent session context.
- **Manova / Orbit Toolkit (`manova.space`)**: Standardized platform framework with unified RBAC auth, token bucket rate-limiting, double-entry payment verification, and multi-tenant DB isolation.
- **Goldstein (Jewelry Gold Trading)**: Multi-tenant gold trading engine with strict wallet accounting, over-the-counter (OTC) desk transfers, and automated 750-fineness normalization.
- **Restaurant Inventory System**: Multi-branch real-time stock ledger, automated purchase orders, and recipe yield tracking.
- **University of Tehran (Head TA, Advanced Programming)**: Directing 15+ TAs, designing assignment specifications, and maintaining the automated judging toolchain for 200+ students per semester.
- **Dorost (`alirezaopmc/dorost`)**: Open-source bilingual (Persian/English) document typography package published on the official Typst package registry.
