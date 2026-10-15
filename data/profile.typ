// ─────────────────────────────────────────────────────────────────────────────
// data/profile.typ — Canonical Data Source from resume-v6.1.pdf + Recent Work
// ─────────────────────────────────────────────────────────────────────────────

// ── Contact & Identity ───────────────────────────────────────────────────────

#let name     = "Alireza Jafartash"
#let email    = "alirezaopmc@gmail.com" // User strictly specified: only this email
#let linkedin = "linkedin.com/in/alirezaopmc"
#let github   = "github.com/alirezaopmc"
#let website  = "jtash.ir"
#let location = "Tehran, Iran · Remote"
#let status   = "Open to Senior SWE & Staff / Technical PM roles"

// ── Profile Summaries ────────────────────────────────────────────────────────

#let summary-swe = [
  Computer Engineering graduate student at University of Tehran specializing in algorithms, computations,
  and distributed systems. 8+ years of engineering craftsmanship designing high-throughput transaction backends,
  multi-tenant B2B2C platforms, and financial ledgers. Proven track record architecting mission-critical systems
  in production across Go, Java (Spring Boot), TypeScript, and PostgreSQL. Combines deep algorithmic problem-solving
  with pragmatic product ownership.
]

#let summary-pm = [
  Technical Product Manager with a strong computer engineering and systems-design background. Bridges business
  strategy, user discovery, and technical execution. Experienced in mapping complex, ambiguous business domains
  (multi-tenant B2B2C platforms, OTC gold trading, financial exchanges) into intuitive user experiences and precise
  engineering specifications. Experienced leading cross-functional teams across engineering, UI/UX, and operations.
]

// ── Hot Skills Inventory (Featured on Page 1) ────────────────────────────────

#let skills-swe = (
  ("Languages",            ("Go", "TypeScript / Node", "Java 21 (Spring Boot 3)", "Python", "SQL", "Kotlin", "C++")),
  ("Systems & Ledgers",    ("High-Throughput Ledgers", "Multi-Tenant B2B2C", "Concurrency & Locks", "Double-Entry Accounting", "Kafka", "RabbitMQ")),
  ("Databases & Cache",    ("PostgreSQL", "Redis (Geospatial & Time-Series)", "Liquibase", "Drizzle ORM", "Query Optimization")),
  ("Cloud, Infra & IaC",   ("Google Cloud Platform (GCP)", "Docker", "Kubernetes", "Terraform", "Cloudflare Workers", "Bitbucket / GitHub CI/CD")),
  ("Architecture & AI",    ("Microservices", "Clean Architecture", "Agentic AI CLI Multiplexing", "REST & GraphQL APIs", "Typst")),
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
    url:      "manova.space",
    tagline:  "Standardized foundation platform for AI-native and client microservices.",
    tags:     ("TypeScript", "Go", "PostgreSQL", "Edge"),
    body-swe: [
      Production micro-platform providing unified RBAC authentication, token-bucket rate-limiting, double-entry payment verification, and multi-tenant DB partitions across 5+ client applications.
    ],
    body-pm: [
      Managed Orbit as a platform-as-a-product: extracted recurring client requirements into a shared, composable toolkit that accelerated client project time-to-market by 4x.
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
  (
    id:       "distributed-uuid",
    name:     "Distributed UUID Generation System",
    url:      "github.com/alirezaopmc",
    tagline:  "High-throughput distributed 32-byte UUID generation platform.",
    tags:     ("Go", "RabbitMQ", "Hetzner Cloud"),
    body-swe: [
      Engineered a distributed ID generation system capable of producing collision-free 32-byte UUIDs under massive concurrent request volumes, with automated node coordination.
    ],
    body-pm: [
      Undergraduate thesis project at Babol Noshirvani University of Technology, demonstrating end-to-end systems architecture and benchmarking under distributed loads.
    ],
  ),
)

// ── Academic Background (Featured on Page 1) ─────────────────────────────────

#let education = (
  (
    degree:      "Master of Computer Engineering — Algorithms and Computation",
    institution: "University of Tehran",
    period:      "2024 — Present",
    note:        "Head Teaching Assistant for Advanced Programming · Research in distributed algorithms",
  ),
  (
    degree:      "Bachelor of Computer Engineering",
    institution: "Babol Noshirvani University of Technology",
    period:      "2018 — 2024",
    note:        "Final Project: Distributed UUID Generation System",
  ),
)

// ── Honors & Awards (Featured on Page 1) ─────────────────────────────────────

#let awards = (
  ("2nd Place",  "Golang (Bale) Software Engineering Selection", "2023"),
  ("Top 20",     "DevOps (Digikala) Boot Camp Selection",         "2022"),
  ("Top 30",     "CyberSecurity (Quera) Competition",            "2023"),
  ("Top 30",     "Software Engineering (Digikala) Bootcamp",      "2022"),
  ("Top 20",     "DiffCode (Quera) Algorithmic Contest",          "2019"),
  ("Top 300",    "Codeforces Round 611 (Div. 3)",                 "2019"),
)

// ── Detailed Work Experience (Featured on Page 2) ────────────────────────────

#let experience = (
  (
    company:  "Independent / Enterprise Clients",
    role:     "Lead Systems Architect (Freelance)",
    role-pm:  "Technical Product Consultant (Freelance)",
    location: "Tehran",
    period:   "2025 — Present",
    desc:     "Architecting mission-critical platforms and automations for enterprise businesses.",
    tech:     "Next.js 16 · React 19 · NestJS · Bun · PostgreSQL · Tailwind 4 · Redis",
    bullets-swe: (
      "Architected Goldstein: multi-tenant SaaS gold trading platform with double-entry wallet accounting, real-time OTC desk transfers, and automated 750-fineness normalization.",
      "Engineered multi-branch Restaurant Inventory Management System: real-time stock ledger, automated supplier purchase orders, and recipe yield tracking.",
    ),
    bullets-pm: (
      "Conducted on-site discovery with traditional jewelers and OTC merchants to map legacy settlement workflows into Goldstein's digital multi-tenant UX.",
      "Led UI/UX design of Goldstein's staff interface (`@goldstein/ui`), cutting transaction record time by 60% for non-technical retail store clerks.",
    ),
  ),

  (
    company:  "Manova",
    role:     "Founder & Lead Systems Engineer",
    role-pm:  "Founder & Product Lead",
    location: "Remote",
    period:   "2024 — Present",
    desc:     "AI workflows, shared platform engineering, and client infrastructure.",
    tech:     "Go · TypeScript · Bun · PostgreSQL · Docker · Cloudflare Workers · Typst",
    bullets-swe: (
      "Architected Orbit: shared micro-platform powering all client products with unified RBAC auth, token-bucket rate limiting, billing journals, and multi-tenant provisioning.",
      "Engineered Promux: zero-downtime agentic CLI multiplexer with automated account rotation on 429/500 errors and state preservation.",
    ),
    bullets-pm: (
      "Spearheaded product vision for Manova's internal platforms, scaling modular toolkits to accelerate client time-to-market by 4x.",
      "Conducted developer workflow discovery to identify AI engineering bottlenecks, directly driving the requirements and delivery of Promux.",
    ),
  ),

  (
    company:  "University of Tehran — Dept. of Science",
    role:     "Head Teaching Assistant — Advanced Programming",
    role-pm:  "Head TA & Course Coordinator",
    location: "Tehran",
    period:   "2024 — Present",
    desc:     "Leading teaching staff and curriculum infrastructure for competitive CS engineering course.",
    tech:     "Java · Automated Judging CI · Docker · Concurrency · OOP Design Patterns",
    bullets-swe: (
      "Manage and coordinate a team of 15+ TAs responsible for problem design, grading, and curriculum delivery for 200+ students per semester.",
      "Designed and maintain the automated containerized judge system and assignment evaluation toolchain used across all terms.",
    ),
    bullets-pm: (
      "Manage cross-functional TA team of 15 members; define semester roadmaps, assignment delivery schedules, and evaluation standards.",
      "Gather continuous student feedback to iterate on problem difficulty curves, improving project completion rates and assignment clarity.",
    ),
  ),

  (
    company:  "LvtGames",
    role:     "Software Engineer",
    role-pm:  "Software Engineer & Feature Owner",
    location: "Turkiye (Remote)",
    period:   "Aug 2024 — 2025",
    desc:     "High-concurrency gaming and entertainment platform.",
    tech:     "Java 21 · Spring Boot 3 · Go 1.24 · PostgreSQL · Redis · GCP · Terraform · Liquibase",
    bullets-swe: (
      "Engineered high-throughput transaction processing and multi-balance wallet management on a multi-tenant B2B2C entertainment platform.",
      "Operated GCP infrastructure via Terraform IaC, built Bitbucket caching CI/CD pipelines, and led cross-functional feature launches as Product Manager.",
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
    period:   "May 2025 — Jul 2025",
    desc:     "Seamless crypto trading exchange and wallet platform.",
    tech:     "Apache Kafka · Kotlin · Kubernetes · Spring Framework · PostgreSQL",
    bullets-swe: (
      "Optimized high-throughput crypto exchange engine for low latency under peak concurrent loads; resolved complex concurrency race conditions to guarantee ledger integrity.",
      "Designed and maintained key operational utility Telegram bot streamlining administrative and member workflows.",
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
    location: "Tehran",
    period:   "Feb 2024 — Oct 2024",
    desc:     "Smart trading journal & portfolio manager for financial markets.",
    tech:     "NestJS · PostgreSQL · Redis · Docker · GraphQL",
    bullets-swe: (
      "Designed a high-throughput data preprocessing pipeline for streaming and normalizing high-volume financial market data across multiple broker APIs.",
      "Developed high-performance REST/GraphQL APIs, implemented resilient broker proxy gateways, and optimized heavy analytical database queries.",
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
    period:   "May 2022 — Dec 2023",
    desc:     "Financial analysis platform for Tehran Stock Exchange.",
    tech:     "Django · PostgreSQL · RabbitMQ · Docker · Prometheus · Grafana",
    bullets-swe: (
      "Processed high volumes of precise stock market tick data with optimized analytical ingestion pipelines and replicated PostgreSQL databases.",
      "Developed microservices with RabbitMQ message queues and authored 20+ automated Lambda functions for data fetching with Prometheus/Grafana telemetry.",
    ),
    bullets-pm: (
      "Translated quantitative stock market analysis methodologies into automated data pipeline requirements.",
      "Monitored pipeline error rates and data freshness metrics to ensure SLA compliance for financial analysts.",
    ),
  ),

  (
    company:  "Earlier Engineering: Plotset & Cubecraft",
    role:     "Systems & R&D Engineer",
    role-pm:  "R&D & Systems Engineer",
    location: "California, US & London, UK (Remote)",
    period:   "2016 — 2022",
    desc:     "AI visual tools R&D and high-scale multiplayer game network engineering.",
    tech:     "Node.js · D3.js · Java · SpigotMC API · MongoDB",
    bullets-swe: (
      "Plotset (US): Researched AI-driven visualization solutions; architected unified framework integrating multiple charting engines.",
      "Cubecraft (UK): Built minigame engine plugins for high-scale Minecraft network with 300+ event listeners and a 50+ state finite state machine.",
    ),
    bullets-pm: (
      "Plotset: Researched user workflows for data visualizers to simplify chart and map creation for non-technical users.",
      "Cubecraft: Analyzed player engagement across minigame modes to optimize state transitions and game mechanics.",
    ),
  ),
)

// ── Professional Certifications (Featured on Page 2) ─────────────────────────

#let certifications = (
  (
    title:  "Software Engineering Bootcamp",
    issuer: "Digikala",
    date:   "Sep 2022",
    detail: "Intensive training in advanced backend development, API design, database architecture, design patterns, and cross-functional communication.",
  ),
  (
    title:  "Machine Learning Specialization",
    issuer: "DeepLearning.AI",
    date:   "Mar 2023",
    detail: "Comprehensive study of foundational machine learning, neural networks, loss optimization, and engineering practices for building ML systems.",
  ),
  (
    title:  "Cybersecurity Advanced Workshop",
    issuer: "Quera & National Banking Specialists",
    date:   "May 2023",
    detail: "Practical security training with national banking specialists covering web security, reverse engineering, and applied cryptography.",
  ),
)
