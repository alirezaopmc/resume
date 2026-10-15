// ─────────────────────────────────────────────────────────────────────────────
// pm-resume.typ — Technical Product Manager (Compact 1-Page Edition)
// Compile: typst compile --font-path fonts pm-resume.typ output/alireza-jafartash-pm.pdf
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-resume
#import "data/profile.typ" as profile

#show: resume-doc.with(compact: true)

#render-resume(
  profile,
  view: "pm",
  compact: true,
  section-order: ("profile", "experience", "projects", "skills", "education"),
)
