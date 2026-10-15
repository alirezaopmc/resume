# Alireza Jafartash — Professional Resumes

Modular, minimal, high-density professional resumes built on [Typst](https://typst.app) and [`alirezaopmc/dorost`](https://github.com/alirezaopmc/dorost). Styled with the crisp technical brutalism and typography inspired by [jtash.ir](https://jtash.ir).

---

## 📑 2-Page Executive Architecture

Every resume is structured across two pages with dedicated responsibilities:

- **PAGE 1: Executive Briefing & Core Arsenal**
  - **Identity & Status**: Name, Live Status Pill (`Open to Senior SWE & Staff / Technical PM roles`), Contacts (`alirezaopmc@gmail.com`, `jtash.ir`, GitHub, LinkedIn).
  - **00 / Profile**: Executive thesis highlighting algorithmic foundation and 8+ years of systems craftsmanship.
  - **01 / Core Arsenal**: Categorized hot skills (Languages, Systems & Ledgers, Databases, Cloud & Infra, Architecture).
  - **02 / Notable Products & Tools**: Promux (AI CLI multiplexer), Orbit Platform, Dorost (Typst package), Distributed UUID Generator.
  - **03 / Education**: University of Tehran (M.Sc. Algorithms & Computation) & Babol Noshirvani (B.Sc. Computer Engineering).
  - **04 / Honors & Competitions**: Bale Golang 2nd Place, Digikala DevOps Top 20, Quera Cybersecurity Top 30, Codeforces Top 300.

- **PAGE 2: Professional Experience Dossier & Credentials**
  - **Header Runner**: Continuous document chrome (`ALIREZA JAFARTASH // EXPERIENCE DOSSIER · PAGE 2/2`).
  - **05 / Detailed Experience**: Full chronological track record with exact dates and technologies from `resume-v6.1.pdf` + recent ventures:
    - *Independent / Enterprise Clients* (2025 — Present): Goldstein Gold Trading Platform & Restaurant Inventory System
    - *Manova* (2024 — Present): Orbit Platform Toolkit & Promux
    - *University of Tehran — Dept. of Science* (2024 — Present): Head TA — Advanced Programming (15+ TAs, 200+ students)
    - *LvtGames, Turkiye (Remote)* (Aug 2024 — 2025): Multi-tenant B2B2C, High-Throughput Wallets, Terraform GCP, Feature Owner / PM
    - *SwapWallet, Tehran* (May 2025 — Jul 2025): Crypto Trading Exchange, Low-Latency Concurrency, Telegram utility bot
    - *Ultratrader, Tehran* (Feb 2024 — Oct 2024): Financial Market Preprocessing Pipeline, Broker APIs & Proxies
    - *Ravindex, Tehran* (May 2022 — Dec 2023): Tehran Stock Exchange Market Data Analytics, Microservices, Replicated DBs
    - *Plotset & Cubecraft* (2016 — 2022): AI Charting Tools R&D (US) & Minecraft Spigot Game Network FSM Engine (UK)
  - **06 / Credentials**: 3-card footer grid with verified certifications (Digikala Software Engineering, DeepLearning.AI Machine Learning, Quera Cybersecurity).

---

## 🏛️ Editions Available

| Edition | Focus | Entrypoint | Output |
| :--- | :--- | :--- | :--- |
| **Senior Software Engineer** | Systems design, financial ledgers, concurrency, microservices | [`swe-resume.typ`](./swe-resume.typ) | `output/alireza-jafartash-swe.pdf` |
| **Technical Product Manager** | User discovery, PRDs, cross-functional bridge, UI/UX, feature ownership | [`pm-resume.typ`](./pm-resume.typ) | `output/alireza-jafartash-pm.pdf` |

---

## 🛠️ Build Commands

```bash
# Build both 2-page PDFs
make all

# Build individual edition
make swe       # Output: output/alireza-jafartash-swe.pdf
make pm        # Output: output/alireza-jafartash-pm.pdf

# Render high-resolution PNG previews of all pages
make previews
```
