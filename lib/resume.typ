// ─────────────────────────────────────────────────────────────────────────────
// lib/resume.typ — Modular Resume Template Engine for Dorost
// Styled after jtash.ir: sharp, minimal, high-contrast, technical brutalism.
// Two-Page Architecture: Page 1 (Intro & Arsenal) + Page 2 (Experience Dossier)
// ─────────────────────────────────────────────────────────────────────────────

#import "@local/dorost:0.2.1": document, badge, code-inline

// ── Design Tokens ────────────────────────────────────────────────────────────

#let c-text       = rgb("0b1120") // deep obsidian slate
#let c-body       = rgb("1e293b") // refined slate body
#let c-muted      = rgb("64748b") // secondary slate
#let c-accent     = rgb("1656ad") // signature tech blue (jtash.ir)
#let c-accent-bg  = rgb("f0f6ff") // subtle blue tint
#let c-rule       = rgb("e2e8f0") // crisp light border
#let c-tag-bg     = rgb("f8fafc") // clean badge background
#let c-tag-border = rgb("cbd5e1")

#let font-body = ("Inter", "Liberation Sans")
#let font-mono = ("JetBrains Mono", "Liberation Mono")

// ── Typography Helpers ───────────────────────────────────────────────────────

#let label-mono(content, size: 7pt, fill: c-muted, weight: "medium") = text(
  font: font-mono,
  size: size,
  fill: fill,
  weight: weight,
  tracking: 0.08em,
  upper(content),
)

#let tag(content) = box(
  fill: c-tag-bg,
  stroke: 0.4pt + c-tag-border,
  inset: (x: 4.5pt, y: 1.8pt),
  radius: 2.5pt,
  baseline: 0%,
  text(font: font-mono, size: 6.6pt, fill: c-body, weight: "medium", content),
)

#let thin-rule(stroke-width: 0.4pt, color: c-rule) = line(length: 100%, stroke: stroke-width + color)

// ── Document Wrapper ─────────────────────────────────────────────────────────

#let resume-doc(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.4cm, top: 1.1cm, bottom: 1.05cm),
  )

  set text(
    font: font-body,
    size: 8.5pt,
    fill: c-body,
    lang: "en",
  )

  set par(
    leading: 0.50em,
    spacing: 0.55em,
    justify: false,
  )

  set list(
    indent: 0.35em,
    spacing: 0.30em,
    marker: text(fill: c-accent, font: font-mono, size: 6.8pt)[—],
  )

  show link: set text(fill: c-accent)

  body
}

// ── Page 1 Header Component (jtash.ir style) ─────────────────────────────────

#let resume-header(
  name: "",
  title: "",
  status: "",
  location: "",
  email: "",
  linkedin: "",
  github: "",
  website: "",
) = {
  // Top Status Bar (jtash.ir live indicator)
  if status != "" {
    block(width: 100%, below: 5pt)[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        stack(
          dir: ltr,
          spacing: 5pt,
          box(
            fill: rgb("22c55e"),
            radius: 50%,
            width: 4.5pt,
            height: 4.5pt,
            baseline: -0.5pt,
          ),
          label-mono("STATUS", fill: c-muted, size: 6.5pt),
          text(font: font-mono, size: 6.8pt, weight: "medium", fill: c-accent, status),
        ),
        if location != "" { label-mono(location, size: 6.8pt) },
      )
    ]
    thin-rule()
    v(4.5pt)
  }

  // Identity and Contacts Grid
  grid(
    columns: (1fr, auto),
    gutter: 0pt,
    // Name & Title
    stack(
      spacing: 2.5pt,
      text(font: font-body, size: 21pt, weight: "bold", fill: c-text, tracking: -0.025em, name),
      text(font: font-body, size: 9.6pt, fill: c-muted, weight: "medium", title),
    ),
    // Right Contacts (Clean Monospace Stack)
    align(right + top)[
      #stack(
        spacing: 2pt,
        if email != "" {
          link("mailto:" + email, text(font: font-mono, size: 7.2pt, fill: c-accent, email))
        },
        if website != "" {
          link("https://" + website, text(font: font-mono, size: 7.2pt, fill: c-accent, website))
        },
        if github != "" {
          link("https://" + github, text(font: font-mono, size: 7.2pt, fill: c-accent, github))
        },
        if linkedin != "" {
          link("https://" + linkedin, text(font: font-mono, size: 7.2pt, fill: c-accent, linkedin))
        },
      )
    ],
  )

  v(4.5pt)
  thin-rule()
  v(5pt)
}

// ── Page 2 Header Runner ─────────────────────────────────────────────────────

#let page-runner(name: "", title: "PROFESSIONAL EXPERIENCE DOSSIER", email: "", website: "") = {
  block(width: 100%, below: 5pt)[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      stack(
        dir: ltr,
        spacing: 6pt,
        label-mono(name, size: 7pt, fill: c-text, weight: "bold"),
        text(font: font-mono, size: 7pt, fill: c-muted, "·"),
        label-mono(title, size: 7pt, fill: c-accent),
      ),
      stack(
        dir: ltr,
        spacing: 8pt,
        if email != "" { link("mailto:" + email, text(font: font-mono, size: 7pt, fill: c-muted, email)) },
        if website != "" { link("https://" + website, text(font: font-mono, size: 7pt, fill: c-accent, website)) },
        label-mono("PAGE 2 / 2", size: 6.8pt, fill: c-muted),
      ),
    )
  ]
  thin-rule()
  v(5.5pt)
}

// ── Section Container (2-Column Left Rail) ───────────────────────────────────

#let section(
  number: "",
  title: "",
  rail-width: 2.3cm,
  above: 5pt,
  below: 4.5pt,
  body,
) = {
  block(
    width: 100%,
    above: above,
    below: below,
  )[
    #grid(
      columns: (rail-width, 1fr),
      gutter: 10pt,
      // Left rail: numbered label
      align(right + top)[
        #stack(
          spacing: 1.5pt,
          if number != "" { label-mono(number, size: 6.2pt, fill: c-accent) },
          label-mono(title, size: 6.8pt, fill: c-text, weight: "bold"),
        )
      ],
      // Right content
      body,
    )
  ]
}

// ── Skill Group Entry (Page 1) ───────────────────────────────────────────────

#let skill-group(
  category,
  items,
) = {
  block(width: 100%, below: 3pt)[
    #grid(
      columns: (3.1cm, 1fr),
      gutter: 6pt,
      align(right + horizon, label-mono(category, size: 6.5pt)),
      stack(
        dir: ltr,
        spacing: 2.5pt,
        ..items.map(i => tag(i)),
      ),
    )
  ]
}

// ── Project Entry (Page 1) ───────────────────────────────────────────────────

#let project-entry(
  name: "",
  url: "",
  tagline: "",
  tags: (),
  body,
) = {
  block(width: 100%, below: 4.5pt)[
    #grid(
      columns: (1fr, auto),
      stack(
        dir: ltr,
        spacing: 5pt,
        if url != "" {
          link("https://" + url, text(weight: "bold", size: 8.7pt, fill: c-accent, name))
        } else {
          text(weight: "bold", size: 8.7pt, fill: c-text, name)
        },
        if url != "" {
          text(font: font-mono, size: 7pt, fill: c-muted, "↗")
        },
      ),
      if tags.len() > 0 {
        align(right)[
          #stack(
            dir: ltr,
            spacing: 2.5pt,
            ..tags.map(t => tag(t)),
          )
        ]
      },
    )
    #if tagline != "" [
      #v(0.8pt)
      #block(width: 100%)[
        #text(fill: c-muted, size: 7.5pt, style: "italic", tagline)
      ]
    ]
    #v(1pt)
    #block(width: 100%)[
      #body
    ]
  ]
}

// ── Education Entry (Page 1) ─────────────────────────────────────────────────

#let edu-entry(
  degree: "",
  institution: "",
  period: "",
  note: "",
) = {
  block(width: 100%, below: 3pt)[
    #grid(
      columns: (1fr, auto),
      stack(
        spacing: 1.2pt,
        text(weight: "bold", size: 8.5pt, fill: c-text, degree),
        text(fill: c-accent, weight: "medium", size: 7.8pt, institution),
        if note != "" { text(fill: c-muted, size: 7.2pt, note) },
      ),
      align(right + top, label-mono(period, size: 6.6pt)),
    )
  ]
}

// ── Awards Grid (Page 1) ─────────────────────────────────────────────────────

#let awards-grid(items) = {
  grid(
    columns: (1fr, 1fr),
    row-gutter: 3pt,
    column-gutter: 10pt,
    ..items.map(award => {
      let (place, title, year) = award
      grid(
        columns: (auto, 1fr, auto),
        gutter: 4pt,
        align: (left + horizon, left + horizon, right + horizon),
        tag(place),
        text(size: 7.6pt, weight: "medium", fill: c-body, title),
        label-mono(year, size: 6.5pt),
      )
    })
  )
}

// ── Experience Entry (Page 2) ────────────────────────────────────────────────

#let experience-entry(
  role: "",
  company: "",
  period: "",
  location: "",
  desc: "",
  tech: "",
  body,
) = {
  block(width: 100%, below: 4.2pt)[
    // Line 1: Role & Period
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 8.8pt, fill: c-text, role),
      align(right, label-mono(period, size: 6.6pt)),
    )
    // Line 2: Company & Location
    #v(0.6pt)
    #grid(
      columns: (1fr, auto),
      text(fill: c-accent, weight: "semibold", size: 7.9pt, company),
      if location != "" { align(right, text(fill: c-muted, size: 7.1pt, location)) },
    )
    // Line 3: Short Scope (if available)
    #if desc != "" [
      #v(0.5pt)
      #block(width: 100%)[
        #text(fill: c-muted, size: 7.3pt, style: "italic", desc)
      ]
    ]
    // Bullets
    #v(1.2pt)
    #body
    // Line 4: Tech Stack
    #if tech != "" [
      #v(1pt)
      #block(width: 100%)[
        #label-mono("TECH: ", size: 6pt, fill: c-muted)
        #text(font: font-mono, size: 6.6pt, fill: c-body, tech)
      ]
    ]
  ]
}

// ── Certification Card Grid (Page 2 Footer) ──────────────────────────────────

#let cert-grid(items) = {
  block(
    width: 100%,
    breakable: false,
    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 6pt,
      ..items.map(c => block(
        fill: c-tag-bg,
        stroke: 0.4pt + c-tag-border,
        inset: (x: 5.5pt, y: 4pt),
        radius: 3pt,
        width: 100%,
        stack(
          spacing: 1.5pt,
          text(weight: "bold", size: 7.4pt, fill: c-text, c.title),
          text(fill: c-accent, weight: "medium", size: 6.8pt, c.issuer + " · " + c.date),
          text(fill: c-muted, size: 6.6pt, c.detail),
        )
      ))
    )
  )
}

// ── Complete 2-Page Resume Orchestrator ───────────────────────────────────────

#let render-two-page-resume(
  data,
  view: "swe", // "swe" | "pm"
  title: auto,
) = {
  let resume-title = if title != auto {
    title
  } else if view == "pm" {
    "Technical Product Manager · Systems Architecture & Digital Products"
  } else {
    "Senior Software Engineer · Systems Architecture & Financial Ledgers"
  }

  let summary = if view == "pm" { data.summary-pm } else { data.summary-swe }
  let skills = if view == "pm" { data.skills-pm } else { data.skills-swe }

  // ═══════════════════════════════════════════════════════════════════════════
  // PAGE 1: EXECUTIVE BRIEFING, HOT SKILLS & ARSENAL
  // ═══════════════════════════════════════════════════════════════════════════

  resume-header(
    name: data.name,
    title: resume-title,
    status: data.status,
    location: data.location,
    email: data.email,
    linkedin: data.linkedin,
    github: data.github,
    website: data.website,
  )

  // 00 / PROFILE
  section(number: "00", title: "Profile", above: 4.5pt, below: 4.5pt)[
    #summary
  ]

  // 01 / CORE ARSENAL & HOT SKILLS
  section(number: "01", title: "Core Arsenal", above: 4.5pt, below: 4.5pt)[
    #for (cat, items) in skills [
      #skill-group(cat, items)
    ]
  ]

  // 02 / NOTABLE PRODUCTS & OPEN SOURCE
  let project-section-name = if view == "pm" { "Products & Ops" } else { "Notable Tools" }
  section(number: "02", title: project-section-name, above: 4.5pt, below: 4.5pt)[
    #for p in data.projects [
      #let body = if view == "pm" { p.body-pm } else { p.body-swe }
      #project-entry(
        name: p.name,
        url: p.url,
        tagline: p.tagline,
        tags: p.tags,
      )[
        #body
      ]
    ]
  ]

  // 03 / EDUCATION
  section(number: "03", title: "Education", above: 4.5pt, below: 4pt)[
    #for edu in data.education [
      #edu-entry(
        degree: edu.degree,
        institution: edu.institution,
        period: edu.period,
        note: edu.note,
      )
    ]
  ]

  // 04 / HONORS & AWARDS
  section(number: "04", title: "Honors", above: 4pt, below: 2pt)[
    #awards-grid(data.awards)
  ]

  // ═══════════════════════════════════════════════════════════════════════════
  // PAGE BREAK: MOVE TO EXPERIENCE DOSSIER
  // ═══════════════════════════════════════════════════════════════════════════

  pagebreak()

  // ═══════════════════════════════════════════════════════════════════════════
  // PAGE 2: IN-DEPTH PROFESSIONAL EXPERIENCE DOSSIER & CERTIFICATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  page-runner(
    name: data.name,
    title: if view == "pm" { "PRODUCT & SYSTEMS EXPERIENCE DOSSIER" } else { "PROFESSIONAL EXPERIENCE DOSSIER" },
    email: data.email,
    website: data.website,
  )

  // 05 / DETAILED WORK EXPERIENCE
  section(number: "05", title: "Experience", above: 3pt, below: 5pt)[
    #for exp in data.experience [
      #let role-title = if view == "pm" and "role-pm" in exp { exp.role-pm } else { exp.role }
      #let bullets = if view == "pm" { exp.bullets-pm } else { exp.bullets-swe }
      #experience-entry(
        role: role-title,
        company: exp.company,
        period: exp.period,
        location: exp.location,
        desc: exp.desc,
        tech: exp.tech,
      )[
        #list(..bullets)
      ]
    ]
  ]

  // 06 / CERTIFICATIONS
  section(number: "06", title: "Credentials", above: 4pt, below: 0pt)[
    #cert-grid(data.certifications)
  ]
}
