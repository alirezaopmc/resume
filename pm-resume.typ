// ─────────────────────────────────────────────────────────────────────────────
// pm-resume.typ — Technical Product Manager (Two-Page Executive Dossier)
// Page 1: Profile & Product Thinking Arsenal (Hot Skills) · Products · Education
// Page 2: Detailed Experience Dossier (Discovery, Scoping, Cross-Functional Bridge)
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-two-page-resume
#import "data/profile.typ" as profile

#show: resume-doc

#render-two-page-resume(
  profile,
  view: "pm",
)
