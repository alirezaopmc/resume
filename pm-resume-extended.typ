// ─────────────────────────────────────────────────────────────────────────────
// pm-resume-extended.typ — Technical Product Manager (Extended 2-Page Dossier)
// Compile: typst compile --font-path fonts pm-resume-extended.typ output/alireza-jafartash-pm-extended.pdf
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-resume
#import "data/profile.typ" as profile

#show: resume-doc.with(compact: false)

#render-resume(
  profile,
  view: "pm",
  compact: false,
  section-order: ("profile", "experience", "projects", "skills", "education"),
)
