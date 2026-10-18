// ─────────────────────────────────────────────────────────────────────────────
// data/profile.typ — Canonical Data Source from resume-v6.1.pdf + Recent Work
// ─────────────────────────────────────────────────────────────────────────────

// ── Contact & Identity ───────────────────────────────────────────────────────

#let name     = "Alireza Jafartash"
#let email    = "alirezaopmc@gmail.com" // Only this address. Do not add a university mailbox.
#let phone    = "+98 938 872 7940"
#let linkedin = "linkedin.com/in/alirezaopmc"
#let github   = "github.com/alirezaopmc"
#let website  = "jtash.ir"
#let location = "Tehran, Iran | Open to Remote"
#let status   = "Open to Senior SWE & Staff / Technical PM roles"

// ── Profile Summaries ────────────────────────────────────────────────────────

#let summary-swe = [
  Back-end engineer with 4+ years of production experience, working across different technologies, programming languages, databases, paradigms, and products. Builds concurrency-safe financial systems, high-throughput APIs, and real-time data pipelines, and also builds front ends for full-stack products. M.Sc. candidate in Computer Engineering.
]

#let summary-pm = [
  Programming since 2014, from game development to competitive programming and olympiads, which built the problem-solving habits still used daily.
  Startup work since 2022 turns ambiguous business problems into product specs and user flows across fintech, crypto exchanges, gaming, and AI tooling, backed by distributed systems work in Figma and multi-tenant architecture.
  Current focus: spec-driven development and agentic and knowledge-retrieval systems, using AI to automate repetitive work so time goes to architecture and product decisions.
]

// ── Hot Skills Inventory (Featured on Page 1) ────────────────────────────────

#let skills-swe = (
  ("Languages",            ("Go", "TypeScript / Node", "Java 21 (Spring Boot 3)", "Python", "SQL", "Kotlin", "C++")),
  ("Systems & Ledgers",    ("High-Throughput Ledgers", "Multi-Tenant B2B2C", "Concurrency & Locks", "Double-Entry Accounting", "Kafka", "RabbitMQ")),
  ("Databases & Cache",    ("PostgreSQL", "Redis (Geospatial & Time-Series)", "Liquibase", "Drizzle ORM", "Query Optimization")),
  ("Cloud, Infra & IaC",   ("Google Cloud Platform (GCP)", "Docker", "Kubernetes", "Terraform", "Cloudflare Workers", "Bitbucket / GitHub CI/CD")),
  ("Architecture & AI",    ("Microservices", "Clean Architecture", "SOLID Principles", "Agentic AI CLI Multiplexing", "REST & GraphQL APIs", "Typst")),
  ("Engineering Practice", ("Code Review", "Object-Oriented Design", "Design Patterns")),
)

// Categorized Skills block printed under Summary. Each pair is (label, items).
// Every item must also appear in a role, project, or education entry below,
// or in the skills inventory above. Role `tech` strings carry the wider set.
#let skills-swe-scan = (
  ("Primary",  "Go (Golang), Python (Django), Java 21 (Spring Boot 3), TypeScript (NestJS, Next.js, React, Node.js), PostgreSQL (High Availability, Replication, Partitioning, Query Optimization), Redis, Apache Kafka, RabbitMQ, REST, Docker, Clean Architecture, SOLID, Concurrency Control"),
  ("Familiar", "Kotlin, MongoDB, GraphQL, API Gateways & Rate Limiting, Kubernetes, Terraform, GCP, Linux, CI/CD, Prometheus, Grafana, Liquibase"),
)

#let skills-pm = (
  ("Product Strategy",     ("User Research & Discovery", "PRD Authoring", "Product Roadmapping", "Jobs-to-be-Done", "MVP Scoping")),
  ("Technical Bridge",     ("Systems Architecture", "API Contracts (REST & GraphQL)", "Data Modeling", "Technical Feasibility Analysis")),
  ("Design & UI/UX",       ("Design Systems", "Figma", "Information Architecture", "WCAG Accessibility", "Tailwind CSS")),
  ("Execution & Ops",      ("Cross-Functional Leadership", "Feature Ownership", "Sprint Cadence", "Release Governance", "Telemetry & Metrics")),
  ("Domain Expertise",     ("Multi-Tenant B2B2C", "Financial Ledgers & Crypto Exchanges", "AI Agent Tooling", "Gaming Backends")),
)

// ── Notable Projects & Tools (Featured on Page 1) ────────────────────────────

#let projects = (
  (
    id:       "promux",
    name:     "Promux",
    url:      "github.com/alirezaopmc/promux",
    tagline:  "Autonomous multiplexer for agentic AI CLIs with zero-downtime account rotation.",
    tags:     ("Go", "CLI", "AI Systems"),
    body-swe: [
      Architected a proxy multiplexer that intercepts agentic CLI calls. Automatically detects HTTP 429/500 quota exhaustion, triggers account rotation with TTL cooling, and preserves running agent session context without interrupting long code generation loops.
    ],
    body-pm: [
      Identified quota exhaustion as a critical bottleneck halting AI engineering sprints. Scoped, specified, and shipped a zero-dependency CLI tool adopted across active engineering workflows.
    ],
  ),
  (
    id:       "manova-orbit",
    name:     "Manova / Orbit Platform",
    url:      "",
    tagline:  "Shared foundation for client products: auth, limits, billing, and tenant isolation.",
    tags:     ("TypeScript", "Go", "PostgreSQL", "Edge"),
    body-swe: [
      Shared micro-platform for client products, with RBAC, token-bucket rate limits, billing journals, and partitioned PostgreSQL for multi-tenant isolation across 5+ applications.
    ],
    body-pm: [
      Managed the platform as a product: extracted recurring client requirements into a shared toolkit that accelerated client project time-to-market by 4x.
    ],
  ),
  (
    id:       "dorost",
    name:     "Dorost",
    url:      "github.com/alirezaopmc/dorost",
    tagline:  "Open-source bilingual document composition package on official Typst registry.",
    tags:     ("Typst", "Open Source", "Design System"),
    body-swe: [
      Authored and published an open-source Typst package providing zero-dependency RTL/LTR mixed-direction layout, numeral conversion, and design system components with automated CI test suites.
    ],
    body-pm: [
      Identified the severe tooling gap in bilingual document generation; designed clean API contracts and comprehensive documentation for academic and enterprise adoption.
    ],
  ),
)

// ── Academic Background (Featured on Page 1) ─────────────────────────────────

#let education = (
  (
    degree:      "M.Sc. in Computer Engineering — Algorithms and Computation",
    institution: "University of Tehran",
    period:      "Sep 2024–Present",
    note:        [Research focus: Distributed algorithms and fault-tolerant coordination.],
  ),
  (
    degree:      "B.Sc. in Computer Engineering",
    institution: "Babol Noshirvani University of Technology",
    period:      "Sep 2018–Aug 2024",
    note:        [Thesis: _High-Throughput Distributed UUID Generation System_ — Engineered a collision-free 128-bit (16-byte) distributed ID generator in Go and RabbitMQ sustaining 10,000,000 IDs/sec per node with automated node coordination.],
  ),
)

// ── Honors & Awards (Featured on Page 1) ─────────────────────────────────────

// Awards and certifications share one list. Each entry is (place, title, date).
#let awards = (
  ("2nd Place",    "Golang Software Engineering Selection — Bale",                                  "2023"),
  ("Top 20",       "DevOps Boot Camp Selection — Digikala",                                         "2022"),
  ("Top 30",       "CyberSecurity Competition & Advanced Banking Security Workshop — Quera",        "2023"),
  ("Top 30",       "Software Engineering Bootcamp (Backend, APIs, DB Architecture) — Digikala",    "Sep 2022"),
  ("Top 20",       "DiffCode Algorithmic Contest — Quera",                                         "2019"),
  ("Certificate",  "Machine Learning Specialization — DeepLearning.AI",                            "Mar 2023"),
)

// ── Detailed Work Experience ─────────────────────────────────────────────────
// `concurrent` records a date overlap. The SWE renderer does not print it.

#let experience = (
  (
    company:  "Independent",
    role:     "Consultant and Lead Back-End Developer",
    role-pm:  "Consultant and Developer",
    location: "Tehran",
    period:   "2025–Present",
    concurrent: true,
    desc:     "Consulting and development for local businesses.",
    tech:     "Go, NestJS, PostgreSQL, Redis, Next.js, React, Bun",
    bullets-swe: (
      "Built an early-stage multi-currency trading SaaS for a few jewelry merchants as a full-stack NestJS and Next.js product, with integer minor-unit arithmetic, pessimistic row locks, and an append-only journal so concurrent orders never oversell stock, processing 10,000 daily transactions with zero balance drift.",
      "Built a full-stack multi-site kitchen inventory system with a single authoritative ledger for intake, transfers, waste, and usage across freezers, prep lines, and ambient stock for multiple sites, plus a notification system and monitoring and tracking across all sites.",
    ),
    bullets-pm: (
      "Consulted jewelry stores on moving in-person settlement onto a shared trading, wallet, and settlement flow.",
      "Scoped a phone-first kitchen inventory flow for staff who work quickly and with wet or gloved hands.",
    ),
  ),

  (
    company:  "LvtGames",
    role:     "Software Engineer",
    role-pm:  "Software Engineer & Feature Owner",
    location: "Istanbul, Türkiye",
    workplace: "Remote",
    employment: "Full-time",
    period:   "Aug 2025–Mar 2026",
    concurrent: true,
    desc:     "High-concurrency gaming and entertainment platform.",
    tech:     "Go 1.24, Java 21, Spring Boot 3, PostgreSQL, Redis, GCP, Terraform, Liquibase",
    bullets-swe: (
      "Built high-throughput transaction processing and multi-balance wallet services in Go 1.24 and Spring Boot 3 (Java 21) for a multi-tenant B2B2C entertainment platform.",
      "Provisioned GCP infrastructure with Terraform, implemented Bitbucket layer-cached CI/CD pipelines that cut deployment times by ~30%, and led cross-functional feature launches.",
    ),
    bullets-pm: (
      "Took full product and feature ownership of specific core platform features, acting as Product Manager.",
      "Managed and coordinated cross-functional teams (including UI/UX design and frontend) to drive end-to-end delivery from initial concept and requirements gathering to successful launch.",
    ),
  ),

  (
    company:  "SwapWallet",
    role:     "Software Engineer",
    role-pm:  "Backend & Systems Engineer",
    location: "Tehran",
    employment: "Full-time",
    period:   "May 2025–Jul 2025",
    concurrent: true,
    desc:     "Seamless crypto trading exchange and wallet platform.",
    tech:     "Kotlin, Spring Framework, Apache Kafka, PostgreSQL, Kubernetes",
    bullets-swe: (
      "Resolved critical ledger concurrency race conditions and optimized the crypto exchange matching engine under peak load, reducing p99 execution latency.",
      "Automated administrative and member operations by designing an event-driven Telegram workflow bot integrated with core exchange services.",
    ),
    bullets-pm: (
      "Managed feature design and user flows for crypto exchange trading features and wallet operations.",
      "Designed user interactions and functional specifications for operational Telegram bot automating exchange alerts.",
    ),
  ),

  (
    company:  "Ultratrader",
    role:     "Software Engineer",
    role-pm:  "Backend & Data Engineer",
    location: "Toronto, Canada",
    workplace: "Remote",
    employment: "Full-time",
    period:   "Feb 2024–Oct 2024",
    concurrent: false,
    desc:     "Smart trading journal & portfolio manager for financial markets.",
    tech:     "NestJS, TypeScript, PostgreSQL, Redis, GraphQL, Docker",
    bullets-swe: (
      "Designed a real-time ingestion pipeline that streams and normalizes financial market data across 30+ external broker APIs at ~1,000 events/sec sustained, with bursts to 300k events/sec.",
      "Built REST and GraphQL APIs alongside low-latency broker proxy gateways, and optimized analytical PostgreSQL queries to cut reporting latency by more than 90%.",
    ),
    bullets-pm: (
      "Collaborated with financial traders to translate portfolio analysis requirements into intuitive GraphQL query schemas.",
      "Prioritized broker integration roadmap based on user asset distribution and transaction volume.",
    ),
  ),

  (
    company:  "Ravindex",
    role:     "Software Engineer",
    role-pm:  "Backend & Pipeline Engineer",
    location: "Tehran",
    period:   "May 2022–Dec 2023",
    concurrent: true,
    desc:     "Financial analysis platform for Tehran Stock Exchange.",
    tech:     "Python, Django, PostgreSQL, RabbitMQ, Docker, Prometheus, Grafana",
    bullets-swe: (
      "Ingested and processed stock-market tick data through high-throughput analytical pipelines backed by replicated PostgreSQL databases.",
      "Developed event-driven microservices using Django and RabbitMQ across 20+ automated data-fetching workers, instrumented with Prometheus and Grafana alerting.",
    ),
    bullets-pm: (
      "Translated quantitative stock market analysis methodologies into automated data pipeline requirements.",
      "Monitored pipeline error rates and data freshness metrics to ensure SLA compliance for financial analysts.",
    ),
  ),

  (
    company:  "Plotset",
    role:     "Research and Development Intern",
    role-pm:  "Research and Development Intern",
    location: "California, US",
    workplace: "Remote",
    period:   "Aug 2021–Jul 2022",
    concurrent: true,
    desc:     "Research on charting tools for non-technical users.",
    tech:     "",
    bullets-swe: (
      "Researched AI-driven data visualization and architected a modular rendering framework integrating multiple charting engines in Node.js and D3.js.",
    ),
    bullets-pm: (
      "Researched user workflows for data visualizers to simplify chart and map creation for non-technical users.",
    ),
  ),
)

// ── Other Experience (teaching and academic roles) ───────────────────────────
// Work roles stay in `experience`. The SWE editions print both lists under
// separate headings: Work Experience, then Other Experience. The PM renderer
// appends this list after `experience`.
// SOLID appears here once, on the Advanced Programming TA role, not on every role.

#let other-experience = (
  (
    company:  "University of Tehran",
    role:     "Head Teaching Assistant — Advanced Programming",
    role-pm:  "Head TA & Course Coordinator",
    location: "Tehran",
    period:   "2026–Present",
    concurrent: true,
    desc:     "Leading teaching staff and curriculum infrastructure for competitive CS engineering course.",
    tech:     "",
    bullets-swe: (
      "Lead a team of 15+ TAs across problem design, code reviews, grading, and curriculum delivery for 200+ undergraduate students per semester.",
      "Designed and maintain the containerized Docker CI judge and automated assignment evaluation toolchain used across all terms for Java OOP, SOLID, and concurrency coursework.",
    ),
    bullets-pm: (
      "Manage cross-functional TA team of 15 members; define semester roadmaps, assignment delivery schedules, and evaluation standards.",
      "Gather continuous student feedback to iterate on problem difficulty curves, improving project completion rates and assignment clarity.",
    ),
  ),

  (
    company:  "Hambazi — Boardgame & Startup Community",
    role:     "Co-Founder & Lead Architect",
    role-pm:  "Chief Technology Officer",
    location: "Tehran",
    period:   "Aug 2025–Present",
    concurrent: true,
    desc:     "Startup community platform for future founders.",
    tech:     "",
    bullets-swe: (
      "Built a Telegram bot for user, event, and game management, backed by the community platform backend (NestJS and Next.js) that supports event scheduling, matchmaking, and member workflows for 1,000+ active members.",
    ),
    bullets-pm: (
      "Designing a platform for a boardgame and startup community.",
    ),
  ),
)

// ── Professional Certifications (PM edition, page 2 card grid) ───────────────
// The SWE edition prints certifications inside `awards`. This list is read only
// by `render-two-page-resume`, so it still carries the earlier card copy.

#let certifications = (
  (
    title:  "Software Engineering Bootcamp",
    issuer: "Digikala",
    date:   "Sep 2022",
    detail: "Backend, APIs, database architecture, design patterns, cross-functional collaboration.",
  ),
  (
    title:  "Machine Learning Specialization",
    issuer: "DeepLearning.AI",
    date:   "Mar 2023",
    detail: "Neural networks, loss optimization, and engineering practices for ML systems.",
  ),
  (
    title:  "Cybersecurity Advanced Workshop",
    issuer: "Quera & National Banking",
    date:   "May 2023",
    detail: "Web security, reverse engineering, and applied cryptography with national banking specialists.",
  ),
)
