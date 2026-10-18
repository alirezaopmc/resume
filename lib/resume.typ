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
#let c-accent-bg  = rgb("edf3fc") // subtle blue tint
#let c-rule       = rgb("e2e8f0") // crisp light border
#let c-tag-bg     = rgb("f8fafc") // clean badge background
#let c-tag-border = rgb("cbd5e1")
#let c-section-bg = rgb("f8fafc") // section label bg

#let font-body = ("Inter", "Liberation Sans")
#let font-display = ("Source Serif 4", "Liberation Serif")
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
  inset: (x: 4.5pt, y: 2pt),
  radius: 2.5pt,
  baseline: 0%,
  text(font: font-mono, size: 6.5pt, fill: c-body, weight: "medium", content),
)

#let stat-pill(value, label) = box(
  fill: c-accent-bg,
  stroke: 0.5pt + rgb("c3d9f7"),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  baseline: 0%,
  stack(
    dir: ltr,
    spacing: 3pt,
    text(font: font-body, size: 8pt, weight: "bold", fill: c-accent, value),
    text(font: font-mono, size: 6pt, fill: c-muted, upper(label)),
  )
)

#let thin-rule(stroke-width: 0.4pt, color: c-rule) = line(length: 100%, stroke: stroke-width + color)

// ── Section Label (Left Rail Tag) ────────────────────────────────────────────

#let section-label(number, title) = stack(
  spacing: 1.5pt,
  if number != "" { label-mono(number, size: 5.8pt, fill: c-accent) },
  label-mono(title, size: 6.4pt, fill: c-text, weight: "bold"),
)

// ── Document Wrapper ─────────────────────────────────────────────────────────

#let resume-doc(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.4cm, top: 1.0cm, bottom: 0.85cm),
  )

  set text(
    font: font-body,
    size: 8.5pt,
    fill: c-body,
    lang: "en",
  )

  set par(
    leading: 0.52em,
    spacing: 0.55em,
    justify: false,
  )

  set list(
    indent: 0.35em,
    spacing: 0.22em,
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
  phone: "",
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
          label-mono("Status", fill: c-muted, size: 6.5pt),
          text(font: font-mono, size: 6.8pt, weight: "medium", fill: c-accent, status),
        ),
        if location != "" { label-mono(location, size: 6.8pt) },
      )
    ]
    thin-rule()
    v(5pt)
  }

  // Identity and Contacts Grid
  grid(
    columns: (1fr, auto),
    gutter: 0pt,
    // Name & Title
    stack(
      spacing: 3pt,
      text(font: font-body, size: 22pt, weight: "bold", fill: c-text, tracking: -0.03em, name),
      text(font: font-body, size: 9pt, fill: c-muted, weight: "medium", title),
    ),
    // Right Contacts (Clean Monospace Stack)
    align(right + top)[
      #stack(
        spacing: 2.5pt,
        if phone != "" {
          link("tel:" + phone.replace(" ", ""), text(font: font-mono, size: 7.2pt, fill: c-accent, phone))
        },
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

  v(5pt)
  thin-rule()
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
  rail-width: 2.0cm,
  above: 7pt,
  below: 5pt,
  show-rule: true,
  breakable: true,
  body,
) = {
  block(
    width: 100%,
    above: above,
    below: below,
    breakable: breakable,
  )[
    #if show-rule [
      #thin-rule()
      #v(3pt)
    ]
    #grid(
      columns: (rail-width, 1fr),
      gutter: 12pt,
      // Left rail: numbered label
      align(right + top)[
        #section-label(number, title)
      ],
      // Right content
      body,
    )
  ]
}

// ── Skill Block (Full-Width Wrap — No overflow) ───────────────────────────────
// Skills now rendered as compact category rows with wrap-safe tag layout.

#let skill-group(category, items) = {
  block(width: 100%, below: 4.5pt)[
    // Category label as overline
    #label-mono(category, size: 5.8pt, fill: c-muted)
    #v(1.5pt)
    // Tags — use a paragraph-based flow with box() items so they wrap naturally
    #block(width: 100%)[
      #for item in items [
        #tag(item)
        #h(2.5pt)
      ]
    ]
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
  block(width: 100%, below: 6pt)[
    // Header row: name + tags
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      // Project name (larger, bolder — primary scan target)
      stack(
        dir: ltr,
        spacing: 4pt,
        if url != "" {
          link("https://" + url, text(weight: "bold", size: 9.2pt, fill: c-accent, name))
        } else {
          text(weight: "bold", size: 9.2pt, fill: c-text, name)
        },
        if url != "" {
          text(font: font-mono, size: 7pt, fill: c-muted, "↗")
        },
      ),
      // Tags pinned right
      if tags.len() > 0 {
        stack(
          dir: ltr,
          spacing: 2.5pt,
          ..tags.map(t => tag(t)),
        )
      },
    )
    // Tagline (italic, muted) — single line role descriptor
    #if tagline != "" [
      #v(1.5pt)
      #text(fill: c-muted, size: 7.2pt, style: "italic", tagline)
    ]
    // Body: tightly formatted impact line
    #v(2pt)
    #text(fill: c-body, size: 7.8pt, body)
  ]
}

// ── Education Entry (Page 1) ─────────────────────────────────────────────────

#let edu-entry(
  degree: "",
  institution: "",
  period: "",
  note: "",
) = {
  block(width: 100%, below: 4pt)[
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      stack(
        spacing: 1.5pt,
        text(weight: "bold", size: 8.5pt, fill: c-text, degree),
        text(fill: c-accent, weight: "semibold", size: 7.8pt, institution),
        if note != "" { text(fill: c-muted, size: 7pt, note) },
      ),
      label-mono(period, size: 6.5pt),
    )
  ]
}

// ── Awards Grid (Page 1) ─────────────────────────────────────────────────────

#let awards-grid(items) = {
  grid(
    columns: (1fr, 1fr),
    row-gutter: 3.5pt,
    column-gutter: 12pt,
    ..items.map(award => {
      let (place, title, year) = award
      grid(
        columns: (auto, 1fr, auto),
        gutter: 4pt,
        align: (left + horizon, left + horizon, right + horizon),
        tag(place),
        text(size: 7.5pt, weight: "medium", fill: c-body, title),
        label-mono(year, size: 6.3pt),
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
  block(width: 100%, below: 3pt)[
    // Line 1: Role & Period
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 8.8pt, fill: c-text, role),
      align(right, label-mono(period, size: 6.6pt)),
    )
    // Line 2: Company & Location
    #v(0.4pt)
    #grid(
      columns: (1fr, auto),
      text(fill: c-accent, weight: "semibold", size: 7.9pt, company),
      if location != "" { align(right, text(fill: c-muted, size: 7.1pt, location)) },
    )
    // Line 3: Short Scope (if available)
    #if desc != "" [
      #v(0.4pt)
      #block(width: 100%)[
        #text(fill: c-muted, size: 7.3pt, style: "italic", desc)
      ]
    ]
    // Bullets
    #v(1pt)
    #body
    // Line 4: Tech Stack
    #if tech != "" [
      #v(0.8pt)
      #block(width: 100%)[
        #label-mono("TECH: ", size: 6pt, fill: c-muted)
        #text(font: font-mono, size: 6.6pt, fill: c-body, tech)
      ]
    ]
  ]
}

// ── Certification Card Grid (Page 2 Footer) ──────────────────────────────────

#let cert-grid(items) = {
  grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 5pt,
    ..items.map(c => block(
      fill: c-tag-bg,
      stroke: 0.4pt + c-tag-border,
      inset: (x: 5pt, y: 3.5pt),
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
    phone: data.phone,
    linkedin: data.linkedin,
    github: data.github,
    website: data.website,
  )

  // 00 / PROFILE
  section(number: "00", title: "Profile", above: 6pt, below: 5pt)[
    // Stat strip — instant scan signal
    #block(below: 5pt)[
      #stack(
        dir: ltr,
        spacing: 4pt,
        stat-pill("8+ yrs", "experience"),
        stat-pill("M.Sc.", "algorithms / ut"),
        stat-pill("7+", "companies"),
      )
    ]
    // Two punchy sentences max
    #summary
  ]

  // 01 / CORE ARSENAL & HOT SKILLS
  section(number: "01", title: "Core Arsenal", above: 6pt, below: 5pt)[
    #for (cat, items) in skills [
      #skill-group(cat, items)
    ]
  ]

  // 02 / NOTABLE PRODUCTS & OPEN SOURCE
  let project-section-name = if view == "pm" { "Products & Ops" } else { "Notable Tools" }
  section(number: "02", title: project-section-name, above: 6pt, below: 5pt)[
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
  section(number: "03", title: "Education", above: 6pt, below: 4pt)[
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
  section(number: "04", title: "Honors", above: 5pt, below: 2pt)[
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
  section(number: "05", title: "Experience", above: 2pt, below: 3pt, show-rule: false)[
    #for exp in (..data.experience, ..data.other-experience) [
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
  section(number: "06", title: "Credentials", above: 4pt, below: 0pt, show-rule: false)[
    #cert-grid(data.certifications)
  ]
}

// ── SWE edition: single column, scan band, 10 pt ────────────────────────────
// PM keeps resume-doc + render-two-page-resume. See docs/decisions/001.

#let swe-title = "Senior Back-End Software Engineer"

#let resume-doc-swe(title: swe-title, body) = {
  set page(
    paper: "a4",
    margin: (x: 1.4cm, top: 1.3cm, bottom: 1.3cm),
    header-ascent: 0.5em,
    header: context {
      if counter(page).get().first() > 1 {
        set text(font: font-body, size: 10pt, fill: c-muted)
        block(below: 2pt, width: 100%)[
          Alireza Jafartash · #title
          #v(2pt)
          #line(length: 100%, stroke: 0.4pt + c-rule)
        ]
      }
    },
  )

  set text(
    font: font-body,
    size: 10pt,
    fill: c-body,
    lang: "en",
    hyphenate: false,
  )

  set par(
    leading: 0.42em,
    spacing: 0.5em,
    justify: false,
  )

  set list(
    indent: 0.5em,
    body-indent: 0.35em,
    spacing: 0.26em,
    marker: text(fill: c-text)[-],
  )

  show heading.where(level: 1): it => {
    block(width: 100%, above: 9pt, below: 5pt, breakable: false, sticky: true)[
      #stack(
        dir: ttb,
        spacing: 2.5pt,
        text(font: font-display, size: 12pt, weight: "bold", fill: c-text, it.body),
        line(length: 100%, stroke: 0.7pt + c-accent),
      )
    ]
  }

  show link: set text(fill: c-accent)

  body
}

#let swe-header(
  name: "",
  title: "",
  email: "",
  phone: "",
  linkedin: "",
  github: "",
  website: "",
  location: "",
) = {
  block(width: 100%, below: 4pt)[
    #text(font: font-display, size: 22pt, weight: "bold", fill: c-text, tracking: -0.02em, name)
    #v(2pt)
    #text(font: font-display, size: 12pt, weight: "semibold", fill: c-accent, title)
    #v(2pt)
    #text(font: font-body, size: 10pt, fill: c-muted, location)
    #v(2pt)
    #text(font: font-body, size: 10pt, fill: c-body)[
      #if phone != "" [
        #link("tel:" + phone.replace(" ", ""))[#phone]
        #h(0.4em) · #h(0.4em)
      ]
      #link("mailto:" + email)[#email]
      #h(0.4em) · #h(0.4em)
      #link("https://" + website)[#website]
      #linebreak()
      #link("https://" + github)[#github]
      #h(0.4em) · #h(0.4em)
      #link("https://" + linkedin)[#linkedin]
    ]
    #v(5pt)
    #line(length: 100%, stroke: 1pt + c-accent)
  ]
}

#let swe-role(
  role: "",
  company: "",
  period: "",
  location: "",
  workplace: "",
  employment: "",
  tech: "",
  bullets: (),
) = {
  // Three explicit blocks instead of one paragraph with line breaks. Each gap is
  // set on its own block, so the meta line and the first bullet never touch.
  // The header is sticky, so a page never ends on a title.
  block(width: 100%, above: 9pt, below: 0pt, breakable: false, sticky: true)[
    #stack(
      dir: ttb,
      spacing: 2pt,
      text(font: font-display, size: 11pt, weight: "bold", fill: c-text, role),
      text(font: font-body, size: 10pt, weight: "semibold", fill: c-accent, company),
      text(font: font-body, size: 10pt, fill: c-muted)[
        #period
        #if location != "" [ · #location]
        #if workplace != "" [ · #workplace]
        #if employment != "" [ · #employment]
      ],
    )
  ]
  block(width: 100%, above: 5pt, below: 0pt)[#list(..bullets)]
  if tech != "" {
    block(width: 100%, above: 5pt, below: 0pt)[
      #text(size: 10pt, fill: c-muted)[Tools: ]
      #text(size: 10pt, fill: c-body, tech)
    ]
  }
}

// `title`, `summary`, and `skills-scan` let an edition overlay replace the
// posting-specific lines. The defaults are the general SWE edition (ADR-001).
#let render-swe-resume(
  data,
  title: swe-title,
  summary: auto,
  skills-scan: auto,
) = {
  swe-header(
    name: data.name,
    title: title,
    email: data.email,
    phone: data.phone,
    linkedin: data.linkedin,
    github: data.github,
    website: data.website,
    location: data.location,
  )

  [= Summary]
  if summary == auto { data.summary-swe } else { summary }

  // Categorized list: each group is (label, items). Skills sits under Summary
  // so the scan band shows the stack before the roles.
  [= Skills]
  let groups = if skills-scan == auto { data.skills-swe-scan } else { skills-scan }
  list(..groups.map(((label, items)) => [#strong[#label:] #items]))

  let roles(list) = for exp in list {
    swe-role(
      role: exp.role,
      company: exp.company,
      period: exp.period,
      location: exp.location,
      workplace: exp.at("workplace", default: ""),
      employment: exp.at("employment", default: ""),
      tech: exp.tech,
      bullets: exp.bullets-swe,
    )
  }

  [= Work Experience]
  roles(data.experience)

  [= Other Experience]
  roles(data.other-experience)

  [= Education]
  for edu in data.education {
    block(width: 100%, above: 6pt, below: 1pt)[
      #text(font: font-display, size: 11pt, weight: "bold", fill: c-text, edu.degree)
      #linebreak()
      #text(fill: c-accent, weight: "semibold", edu.institution)
      #h(0.4em)
      #text(fill: c-muted)[· #edu.period]
      #if edu.note != "" [
        #linebreak()
        #text(fill: c-body, edu.note)
      ]
    ]
  }

  [= Projects]
  for p in data.projects {
    block(width: 100%, above: 6pt, below: 1pt)[
      #if p.url != "" [
        #link("https://" + p.url)[#text(font: font-display, size: 11pt, weight: "bold", fill: c-accent, p.name)]
      ] else {
        text(font: font-display, size: 11pt, weight: "bold", fill: c-text, p.name)
      }
      #if p.tagline != "" [
        #linebreak()
        #text(style: "italic", fill: c-muted, p.tagline)
      ]
      #v(2pt)
      #p.body-swe
      #if p.tags.len() > 0 [
        #v(1pt)
        #text(fill: c-muted, p.tags.join(", "))
      ]
    ]
  }

  [= Awards & Certifications]
  stack(
    dir: ttb,
    spacing: 3pt,
    ..data.awards.map(((place, name, date)) => [
      #text(weight: "bold", fill: c-text, place)
      #h(0.35em)
      #text(fill: c-body, name)
      #h(0.35em)
      #text(fill: c-muted)[(#date)]
    ]),
  )
}
