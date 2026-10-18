// ─────────────────────────────────────────────────────────────────────────────
// data/basalam.typ — Overlay for the BaSalam Back-End posting (Qom).
// Only the lines that differ from the general SWE edition live here. Facts,
// dates, and bullets stay in data/profile.typ. Every term below is backed by
// a role, project, or skill that profile.typ already lists.
// Posting keywords: Python, FastAPI or Django, REST APIs, SQL and NoSQL,
// MongoDB, Redis, Kafka, OOP and SOLID, code review, concurrency, query optimization.
// Not claimed (no evidence in profile.typ): FastAPI.
// MongoDB has no role source after the Cubecraft entry was removed (18 Oct 2026).
// Confirm it before this edition is sent. See docs/decisions/004-basalam-edition.md.
// ─────────────────────────────────────────────────────────────────────────────

#let title = "Senior Back-End Software Engineer"

#let summary = [
  Programming since 2014, from game development to competitive programming and olympiads.
  Back-end engineer in startups, working across different technologies, programming languages, databases, paradigms, and products.
  Also builds front ends for full-stack products. M.Sc. candidate in Computer Engineering.
]

// Same (label, items) shape as `skills-swe-scan` in profile.typ. Python leads.
#let skills-scan = (
  ("Primary",  "Python (Django), Go (Golang), Java 21 (Spring Boot 3), TypeScript (NestJS, Next.js, React, Node.js), PostgreSQL (Query Optimization, Partitioning, Replication), Redis, Apache Kafka, RabbitMQ, REST, Docker, Clean Architecture, SOLID, Concurrency Control, Code Review"),
  ("Familiar", "Kotlin, MongoDB, GraphQL, API Gateways & Rate Limiting, Kubernetes, Terraform, GCP, CI/CD"),
)
