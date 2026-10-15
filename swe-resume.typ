// ─────────────────────────────────────────────────────────────────────────────
// swe-resume.typ — Senior Software Engineer (Compact 1-Page Edition)
// Compile: typst compile --font-path fonts swe-resume.typ output/alireza-jafartash-swe.pdf
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-resume
#import "data/profile.typ" as profile

#show: resume-doc.with(compact: true)

#render-resume(
  profile,
  view: "swe",
  compact: true,
  section-order: ("profile", "experience", "projects", "skills", "education"),
)
