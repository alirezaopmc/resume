// ─────────────────────────────────────────────────────────────────────────────
// lib/resume.typ — Modular Resume Template Engine for Dorost
// Styled after jtash.ir: sharp, minimal, high-contrast, technical brutalism.
// ─────────────────────────────────────────────────────────────────────────────

#import "@local/dorost:0.2.1": document, badge, code-inline

// ── Design Tokens ────────────────────────────────────────────────────────────

#let c-text     = rgb("0b1120") // deep obsidian slate
#let c-body     = rgb("1e293b") // refined body text
#let c-muted    = rgb("64748b") // secondary slate
#let c-accent   = rgb("1656ad") // signature tech blue (jtash.ir)
#let c-rule     = rgb("e2e8f0") // crisp light border
#let c-tag-bg   = rgb("f1f5f9") // badge background
#let c-tag-border = rgb("cbd5e1")

#let font-body = ("Inter", "Liberation Sans")
#let font-mono = ("JetBrains Mono", "Liberation Mono")

// ── Typography Helpers ───────────────────────────────────────────────────────

#let label-mono(content, size: 7pt, fill: c-muted) = text(
  font: font-mono,
  size: size,
  fill: fill,
  weight: "medium",
  tracking: 0.08em,
  upper(content),
)

#let tag(content) = box(
  fill: c-tag-bg,
  stroke: 0.4pt + c-tag-border,
  inset: (x: 4.5pt, y: 2pt),
  radius: 2.5pt,
  baseline: 0%,
  text(font: font-mono, size: 6.8pt, fill: c-body, weight: "medium", content),
)

#let thin-rule() = line(length: 100%, stroke: 0.4pt + c-rule)

// ── Document Wrapper ─────────────────────────────────────────────────────────

#let resume-doc(
  body,
  compact: true,
) = {
  let margin-y = if compact { 1.05cm } else { 1.4cm }
  let margin-x = if compact { 1.3cm } else { 1.5cm }
  let text-size = if compact { 8.6pt } else { 9.3pt }
  let leading = if compact { 0.50em } else { 0.58em }

  set page(
    paper: "a4",
    margin: (x: margin-x, top: margin-y, bottom: margin-y),
  )

  set text(
    font: font-body,
    size: text-size,
    fill: c-body,
    lang: "en",
  )

  set par(
    leading: leading,
    spacing: if compact { 0.52em } else { 0.72em },
    justify: false,
  )

  set list(
    indent: 0.35em,
    spacing: if compact { 0.32em } else { 0.44em },
    marker: text(fill: c-muted, font: font-mono, size: 7pt)[—],
  )

  show link: set text(fill: c-accent)

  body
}

// ── Header Component (jtash.ir style) ────────────────────────────────────────

#let resume-header(
  name: "",
  title: "",
  status: "",
  location: "",
  email: "",
  linkedin: "",
  github: "",
  website: "",
  compact: true,
) = {
  // Top Status Bar (jtash.ir live indicator)
  if status != "" {
    block(width: 100%, below: if compact { 4.5pt } else { 7pt })[
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
    v(if compact { 3.5pt } else { 5pt })
  }

  // Identity and Contacts
  grid(
    columns: (1fr, auto),
    gutter: 0pt,
    // Name & Title
    stack(
      spacing: if compact { 2pt } else { 3pt },
      text(font: font-body, size: if compact { 18pt } else { 21pt }, weight: "bold", fill: c-text, tracking: -0.02em, name),
      text(font: font-body, size: if compact { 9pt } else { 10.5pt }, fill: c-muted, weight: "medium", title),
    ),
    // Right Contacts
    align(right + top)[
      #stack(
        spacing: if compact { 1.8pt } else { 2.5pt },
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

  v(if compact { 3.5pt } else { 5.5pt })
  thin-rule()
  v(if compact { 3.5pt } else { 6.5pt })
}

// ── Section Container (2-Column Mono Rail) ───────────────────────────────────

#let section(
  number: "",
  title: "",
  compact: true,
  body,
) = {
  let rail-width = if compact { 2.2cm } else { 2.6cm }
  block(
    width: 100%,
    above: if compact { 5.5pt } else { 8.5pt },
    below: if compact { 4.5pt } else { 7pt },
  )[
    #grid(
      columns: (rail-width, 1fr),
      gutter: if compact { 9pt } else { 13pt },
      // Left rail: numbered label
      align(right + top)[
        #stack(
          spacing: 1.5pt,
          if number != "" { label-mono(number, size: 6.2pt, fill: c-accent) },
          label-mono(title, size: 6.8pt, fill: c-text),
        )
      ],
      // Right content
      body,
    )
  ]
}

// ── Experience Entry ─────────────────────────────────────────────────────────

#let entry(
  role: "",
  company: "",
  period: "",
  location: "",
  compact: true,
  body,
) = {
  block(width: 100%, below: if compact { 4.5pt } else { 6.5pt })[
    // Line 1: Role & Period
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: if compact { 8.7pt } else { 9.5pt }, fill: c-text, role),
      align(right, label-mono(period, size: 6.6pt)),
    )
    // Line 2: Company & Location
    #v(0.8pt)
    #grid(
      columns: (1fr, auto),
      text(fill: c-accent, weight: "medium", size: if compact { 7.8pt } else { 8.6pt }, company),
      if location != "" { align(right, text(fill: c-muted, size: 7.2pt, location)) },
    )
    // Bullets
    #v(if compact { 1.5pt } else { 2.5pt })
    #body
  ]
}

// ── Project Entry ────────────────────────────────────────────────────────────

#let project-entry(
  name: "",
  url: "",
  tagline: "",
  tags: (),
  compact: true,
  body,
) = {
  block(width: 100%, below: if compact { 4.5pt } else { 6.5pt })[
    // Line 1: Title link + tags
    #grid(
      columns: (1fr, auto),
      stack(
        dir: ltr,
        spacing: 5pt,
        if url != "" {
          link("https://" + url, text(weight: "bold", size: if compact { 8.7pt } else { 9.5pt }, fill: c-accent, name))
        } else {
          text(weight: "bold", size: if compact { 8.7pt } else { 9.5pt }, fill: c-text, name)
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
    // Line 2: Tagline
    #if tagline != "" [
      #v(1pt)
      #block(width: 100%)[
        #text(fill: c-muted, size: if compact { 7.5pt } else { 8.2pt }, style: "italic", tagline)
      ]
    ]
    // Line 3: Description Body
    #v(if compact { 1.2pt } else { 2pt })
    #block(width: 100%)[
      #body
    ]
  ]
}

// ── Skill Group Entry ────────────────────────────────────────────────────────

#let skill-group(
  category,
  items,
  compact: true,
) = {
  block(width: 100%, below: if compact { 2.5pt } else { 3.5pt })[
    #grid(
      columns: (if compact { 2.1cm } else { 2.5cm }, 1fr),
      gutter: 5pt,
      align(right + horizon, label-mono(category, size: 6.5pt)),
      stack(
        dir: ltr,
        spacing: 2.5pt,
        ..items.map(i => tag(i)),
      ),
    )
  ]
}

// ── Education Entry ──────────────────────────────────────────────────────────

#let edu-entry(
  degree: "",
  institution: "",
  period: "",
  note: "",
  compact: true,
) = {
  block(width: 100%, below: if compact { 2.5pt } else { 4pt })[
    #grid(
      columns: (1fr, auto),
      stack(
        spacing: 1.2pt,
        text(weight: "bold", size: if compact { 8.6pt } else { 9.3pt }, fill: c-text, degree),
        text(fill: c-accent, weight: "medium", size: if compact { 7.8pt } else { 8.5pt }, institution),
        if note != "" { text(fill: c-muted, size: 7.2pt, note) },
      ),
      align(right + top, label-mono(period, size: 6.6pt)),
    )
  ]
}

// ── Section Renderers for Modular Composition ────────────────────────────────

#let render-section-profile(summary, compact: true, number: "00") = {
  section(number: number, title: "Profile", compact: compact)[
    #summary
  ]
}

#let render-section-experience(items, compact: true, number: "01", view: "swe") = {
  section(number: number, title: "Experience", compact: compact)[
    #for exp in items [
      #let role-title = if view == "pm" and "role-pm" in exp { exp.role-pm } else { exp.role }
      #let bullets = if view == "pm" {
        if compact and "bullets-pm-compact" in exp { exp.bullets-pm-compact } else { exp.bullets-pm }
      } else {
        if compact and "bullets-swe-compact" in exp { exp.bullets-swe-compact } else { exp.bullets-swe }
      }
      #entry(
        role: role-title,
        company: exp.company,
        period: exp.period,
        location: exp.location,
        compact: compact,
      )[
        #list(..bullets)
      ]
    ]
  ]
}

#let render-section-projects(items, compact: true, number: "02", view: "swe") = {
  let section-name = if view == "pm" { "Notable Work" } else { "Projects" }
  section(number: number, title: section-name, compact: compact)[
    #for p in items [
      #let body = if view == "pm" {
        if compact and "body-pm-compact" in p { p.body-pm-compact } else { p.body-pm }
      } else {
        if compact and "body-swe-compact" in p { p.body-swe-compact } else { p.body-swe }
      }
      #if body != [] and body != "" [
        #project-entry(
          name: p.name,
          url: p.url,
          tagline: p.tagline,
          tags: p.tags,
          compact: compact,
        )[
          #body
        ]
      ]
    ]
  ]
}

#let render-section-skills(skills, compact: true, number: "03") = {
  section(number: number, title: "Skills", compact: compact)[
    #for (cat, items) in skills [
      #skill-group(cat, items, compact: compact)
    ]
  ]
}

#let render-section-education(items, compact: true, number: "04") = {
  section(number: number, title: "Education", compact: compact)[
    #for edu in items [
      #edu-entry(
        degree: edu.degree,
        institution: edu.institution,
        period: edu.period,
        note: edu.note,
        compact: compact,
      )
    ]
  ]
}

// ── Orchestration Engine ─────────────────────────────────────────────────────

#let render-resume(
  data,
  view: "swe", // "swe" | "pm"
  compact: true,
  section-order: ("profile", "experience", "projects", "skills", "education"),
  title: auto,
) = {
  let resume-title = if title != auto {
    title
  } else if view == "pm" {
    "Technical Product Manager · Systems & Architecture"
  } else {
    "Senior Software Engineer · Systems Architecture"
  }

  let summary = if view == "pm" { data.summary-pm } else { data.summary-swe }
  let skills = if view == "pm" { data.skills-pm } else { data.skills-swe }

  resume-header(
    name: data.name,
    title: resume-title,
    status: data.status,
    location: data.location,
    email: data.email,
    linkedin: data.linkedin,
    github: data.github,
    website: data.website,
    compact: compact,
  )

  let idx = 0
  for sec in section-order [
    #let num = "0" + str(idx)
    #if sec == "profile" {
      render-section-profile(summary, compact: compact, number: num)
      idx = idx + 1
    } else if sec == "experience" {
      render-section-experience(data.experience, compact: compact, number: num, view: view)
      idx = idx + 1
    } else if sec == "projects" {
      render-section-projects(data.projects, compact: compact, number: num, view: view)
      idx = idx + 1
    } else if sec == "skills" {
      render-section-skills(skills, compact: compact, number: num)
      idx = idx + 1
    } else if sec == "education" {
      render-section-education(data.education, compact: compact, number: num)
      idx = idx + 1
    }
  ]
}
