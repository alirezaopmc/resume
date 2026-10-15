// ─────────────────────────────────────────────────────────────────────────────
// swe-resume.typ — Senior Software Engineer (Two-Page Executive Dossier)
// Page 1: Profile & Core Arsenal (Hot Skills) · Featured Tools · Education · Honors
// Page 2: Detailed Professional Experience Dossier (Financial Ledgers, Systems)
// ─────────────────────────────────────────────────────────────────────────────

#import "lib/resume.typ": resume-doc, render-two-page-resume
#import "data/profile.typ" as profile

#show: resume-doc

#render-two-page-resume(
  profile,
  view: "swe",
)
