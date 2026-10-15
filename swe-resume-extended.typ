// ─────────────────────────────────────────────────────────────────────────────
// swe-resume-extended.typ — Senior Software Engineer (Extended 2-Page Dossier)
// Compile: typst compile --font-path fonts swe-resume-extended.typ output/alireza-jafartash-swe-extended.pdf
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-resume
#import "data/profile.typ" as profile

#show: resume-doc.with(compact: false)

#render-resume(
  profile,
  view: "swe",
  compact: false,
  section-order: ("profile", "experience", "projects", "skills", "education"),
)
