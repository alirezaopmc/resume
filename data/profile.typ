// ─────────────────────────────────────────────────────────────────────────────
// data/profile.typ — Canonical Data Layer for Alireza Jafartash Resumes
// ─────────────────────────────────────────────────────────────────────────────

// ── Contact & Identity ───────────────────────────────────────────────────────

#let name     = "Alireza Jafartash"
#let email    = "ali@manova.space"
#let linkedin = "linkedin.com/in/alirezaopmc"
#let github   = "github.com/alirezaopmc"
#let website  = "jtash.ir"
#let location = "Tehran, Iran · Remote"
#let status   = "Open to Senior SWE & Staff / Technical PM roles"

// ── Profiles / Summaries ─────────────────────────────────────────────────────

#let summary-swe = [
  Senior software engineer specializing in resilient systems design and distributed backends.
  Proven track record architecting high-throughput, fault-tolerant infrastructure and transactional
  ledgers for financial and mission-critical domains. Deep expertise across Go, TypeScript, PostgreSQL,
  and AI-native toolchains. Builds for longevity, clarity, and zero-downtime maintainability.
]

#let summary-pm = [
  Technical Product Manager with a strong software engineering foundation. Bridges business strategy,
  user discovery, and technical execution. Experienced in scoping ambiguous business domains into
  production-grade systems, translating user pain points into precise functional specifications, and
  aligning cross-functional teams across engineering, UI/UX design, and operations.
]

// ── Work Experience ──────────────────────────────────────────────────────────

#let experience = (
  (
    id:       "manova",
    role:     "Founder & Lead Engineer",
    role-pm:  "Founder & Product Lead",
    company:  "Manova",
    period:   "2024 — Present",
    location: "Remote",
    bullets-swe: (
      "Architected Orbit: shared micro-platform powering all client products with unified RBAC auth, rate limiting, billing journals, and multi-tenant provisioning.",
      "Engineered Promux: zero-downtime agentic CLI multiplexer with automated account rotation on 429/500 errors and state preservation.",
      "Designed event-driven backend services deployed on Bun, Go, PostgreSQL, and Cloudflare Edge workers with sub-50ms global latency.",
      "Established automated release workflows, trunk protection policies, and reproducible local sandbox environments.",
    ),
    bullets-swe-compact: (
      "Architected Orbit: shared micro-platform powering all client products with unified auth, rate-limiting, billing journals, and multi-tenant provisioning.",
      "Built Promux: zero-downtime agentic CLI multiplexer with automated account rotation on 429/500 errors and state preservation.",
      "Engineered edge-routed microservices on Bun, Go, PostgreSQL, and Cloudflare Workers maintaining high throughput and 99.9% uptime.",
    ),
    bullets-pm: (
      "Spearheaded product vision for Manova's internal platforms and client ecosystems, scaling modular toolkits to accelerate time-to-market by 4x.",
      "Conducted extensive workflow discovery with engineering teams to identify developer bottlenecks, leading to the creation of Promux and Orbit platform tools.",
      "Defined product roadmaps, release milestones, and user journeys across web portals, Telegram miniapps, and developer CLIs.",
      "Championed cohesive design systems and accessible UI components across all customer-facing client touchpoints.",
    ),
    bullets-pm-compact: (
      "Spearheaded product vision and technical roadmaps for Manova platform toolkits, reducing client time-to-market by 4x.",
      "Conducted user workflow discovery for AI engineering bottlenecks, directly driving the requirements and delivery of Promux.",
      "Orchestrated sprint cadences and release milestones across web portals, Telegram client interfaces, and developer tooling.",
    ),
  ),

  (
    id:       "freelance",
    role:     "Lead Systems Architect",
    role-pm:  "Technical Product Consultant",
    company:  "Independent / Enterprise Clients",
    period:   "2023 — Present",
    location: "Tehran",
    bullets-swe: (
      "Architected Goldstein: multi-tenant SaaS gold trading platform. Designed strict double-entry wallet accounting and real-time over-the-counter (OTC) desk transfers with automated 750-fineness normalization (Effective Grams = Physical × Purity ÷ 750).",
      "Engineered Restaurant Inventory Management System: multi-branch real-time stock ledger, automated reorder triggers, recipe yield calculations, and supplier procurement pipelines.",
      "Implemented resilient data synchronization models handling unstable connectivity and concurrent counter transactions without discrepancies.",
    ),
    bullets-swe-compact: (
      "Architected Goldstein: multi-tenant SaaS gold trading engine with double-entry wallet accounting, OTC desk transfers, and automated 750-fineness normalization.",
      "Built multi-branch Restaurant Inventory System featuring real-time stock ledger, automated purchase orders, and recipe yield tracking.",
    ),
    bullets-pm: (
      "Conducted on-site discovery with traditional jewelers and OTC merchants to map legacy settlement workflows into digital multi-tenant workflows.",
      "Specified the dual-currency (Rial & 750-Gold) obligation settlement engine, translating complex offline trade habits into an intuitive UX.",
      "Led end-to-end design for Goldstein's staff interface (`@goldstein/ui`), ensuring high-contrast visibility and rapid keyboard navigation.",
      "Scoped restaurant inventory workflows: mapped kitchen waste, supplier relations, and minimum stock alerts into an actionable MVP.",
    ),
    bullets-pm-compact: (
      "Mapped legacy jeweler OTC settlement habits into Goldstein's digital multi-tenant UX with dual-currency (Rial/750-Gold) accounting.",
      "Led UI/UX design of high-speed counter desk interfaces, cutting transaction input time by 60% for non-technical retail staff.",
      "Scoped and delivered restaurant inventory MVP from stakeholder interviews to production rollout across multiple branches.",
    ),
  ),

  (
    id:       "ut-ta",
    role:     "Head Teaching Assistant — Advanced Programming",
    role-pm:  "Head TA & Course Coordinator",
    company:  "University of Tehran — Dept. of Science",
    period:   "2023 — Present",
    location: "Tehran",
    bullets-swe: (
      "Direct a team of 15+ TAs managing course curriculum, complex programming assignments, and infrastructure for 200+ engineering students per term.",
      "Architected and maintain the automated CI/CD code judge system, testing containerized submissions against rigorous edge-case suites.",
      "Designed hands-on project assignments simulating production concurrency, OOP design patterns, and network protocols.",
    ),
    bullets-swe-compact: (
      "Direct 15+ TAs managing curriculum, problem sets, and automated judging for 200+ students per semester.",
      "Designed and maintain containerized automated testing harness evaluating student code for correctness, memory safety, and concurrency.",
    ),
    bullets-pm: (
      "Coordinate cross-functional teaching team: define term-wide content milestones, assign module ownership, and conduct weekly alignment sprints.",
      "Gather continuous student feedback to iterate on problem difficulty curves, improving project completion rates and assignment clarity.",
      "Standardize grading rubrics and dispute resolution protocols, reducing evaluation variance across 200+ student submissions.",
    ),
    bullets-pm-compact: (
      "Manage cross-functional TA team of 15 members; define semester roadmaps, assignment delivery schedules, and evaluation standards.",
      "Analyzed student performance metrics to continuously refine problem difficulty curves and enhance learning outcomes.",
    ),
  ),

  (
    id:       "lvtgames",
    role:     "Software Engineer",
    role-pm:  "Backend & Systems Engineer",
    company:  "LvtGames",
    period:   "2021 — 2023",
    location: "Remote",
    bullets-swe: (
      "Engineered high-concurrency game backend services handling real-time player sessions with low latency constraints.",
      "Built telemetry pipelines streaming player gameplay events to PostgreSQL and analytics engines for live operational monitoring.",
      "Optimized query performance and database indexing, mitigating peak-hour bottlenecks during live game tournaments.",
    ),
    bullets-swe-compact: (
      "Engineered high-concurrency game backend services and low-latency multiplayer session handlers.",
      "Built real-time telemetry pipelines streaming player game events to PostgreSQL for live balance adjustments.",
    ),
    bullets-pm: (
      "Partnered with game designers to translate gameplay mechanics into backend contracts, API schemas, and state machine models.",
      "Analyzed player telemetry data to guide live-ops balancing decisions, retention optimizations, and in-game economy tuning.",
    ),
    bullets-pm-compact: (
      "Partnered with game designers to translate gameplay mechanics into backend contracts and database schemas.",
      "Synthesized player telemetry data to guide feature prioritization and gameplay retention improvements.",
    ),
  ),
)

// ── Key Projects & Open Source ───────────────────────────────────────────────

#let projects = (
  (
    id:      "promux",
    name:    "Promux",
    url:     "github.com/alirezaopmc/promux",
    tagline: "High-availability multiplexer for agentic AI CLIs with dynamic failover.",
    tags:    ("Go", "CLI", "AI Systems"),
    body-swe: [
      Engineered an autonomous proxy layer intercepting agentic CLI calls. Automatically detects HTTP 429/500 errors, executes account rotation with TTL cooling, and preserves session context without interrupting long-running code generation loops.
    ],
    body-swe-compact: [
      Autonomous proxy layer for agentic CLIs. Detects 429/500 errors, executes zero-downtime account rotation with TTL cooling, and preserves running agent session context.
    ],
    body-pm: [
      Identified critical failure points in autonomous AI development workflows where account quota exhaustion halted entire development sprints. Scoped, designed, and shipped a minimal, dependable CLI tool solving friction for AI engineers.
    ],
    body-pm-compact: [
      Identified account quota exhaustion as a primary bottleneck in agentic engineering workflows. Scoped and shipped a robust CLI utility that solved downtime for development teams.
    ],
  ),

  (
    id:      "manova-orbit",
    name:    "Manova / Orbit Platform",
    url:     "manova.space",
    tagline: "Composable foundation toolkit for rapid production-grade software delivery.",
    tags:    ("TypeScript", "Go", "PostgreSQL", "Edge"),
    body-swe: [
      Production platform containing standardized auth, rate-limiting algorithms, cryptographic payment verification, and multi-tenant database partitions. Reduced infrastructure boilerplate across 5+ client applications.
    ],
    body-swe-compact: [
      Standardized platform framework providing auth, token bucket rate-limiting, payment verification, and multi-tenant DB isolation across client microservices.
    ],
    body-pm: [
      Treated internal platform as a product: extracted repeated architectural requirements across disparate client engagements into a clean, reusable component ecosystem. Decreased client onboarding and feature lead time significantly.
    ],
    body-pm-compact: [
      Spearheaded internal platform-as-a-product strategy, packaging recurring client backend requirements into reusable modules to slash delivery lead times.
    ],
  ),

  (
    id:      "dorost",
    name:    "Dorost",
    url:     "github.com/alirezaopmc/dorost",
    tagline: "Open-source bilingual document composition package for Typst.",
    tags:    ("Typst", "Open Source", "Design System"),
    body-swe: [
      Authored and published an open-source Typst package on the official registry. Features zero-dependency RTL/LTR mixed-direction layout, isolated numeral transformers, automated CI pipelines with checksum-pinned test font fixtures.
    ],
    body-swe-compact: [
      Authored open-source Typst package on official registry providing bilingual RTL/LTR layout, numeral conversion, and component design systems with automated CI tests.
    ],
    body-pm: [
      Recognized the severe gap in professional, typographically sound document generation for bilingual teams. Designed clear API contracts and comprehensive documentation for academic and enterprise adoption.
    ],
    body-pm-compact: [
      Identified the lack of modern bilingual document tooling; designed user-centric APIs and comprehensive documentation for academic and industry adoption.
    ],
  ),
)

// ── Skills Inventory ─────────────────────────────────────────────────────────

#let skills-swe = (
  ("Architecture", ("Distributed Systems", "Multi-tenant SaaS", "Financial Ledgers", "Event-Driven", "API Design")),
  ("Languages",    ("Go", "TypeScript", "Python", "SQL", "Rust (basics)")),
  ("Databases",    ("PostgreSQL", "Redis", "Drizzle ORM", "Schema Migration", "Connection Pooling")),
  ("DevOps & Edge",("Docker", "Cloudflare Workers", "Bun", "Linux", "CI/CD Pipelines", "Typst")),
)

#let skills-pm = (
  ("Product Strategy", ("User Research & Discovery", "PRD Authoring", "Roadmapping", "Jobs-to-be-Done", "MVP Scoping")),
  ("Technical Bridge", ("System Architecture", "API Contracts", "Data Modeling", "Technical Trade-off Analysis")),
  ("Design & UI/UX",   ("Design Systems", "Figma", "Information Architecture", "WCAG Accessibility", "Tailwind")),
  ("Execution",        ("Agile & Sprint Cadence", "Stakeholder Management", "Release Governance", "Telemetry & Metrics")),
)

// ── Academic Background ──────────────────────────────────────────────────────

#let education = (
  (
    degree:      "B.Sc. Computer Science",
    institution: "University of Tehran — Faculty of Science",
    period:      "2021 — Present",
    note:        "Head Teaching Assistant for Advanced Programming · Focus on Systems & Software Engineering",
  ),
)
