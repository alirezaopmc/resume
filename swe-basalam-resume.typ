// Back-End resume tailored to the BaSalam posting (Software Engineer, Back-End, Qom).
// Same renderer as swe-resume.typ. Only the overlay in data/basalam.typ differs.
// Build with `make basalam`. Score with `make ats-basalam`.

#import "lib/resume.typ": resume-doc-swe, render-swe-resume
#import "data/profile.typ" as profile
#import "data/basalam.typ" as basalam

#set document(title: "Alireza Jafartash — " + basalam.title, author: "Alireza Jafartash")

#show: resume-doc-swe.with(title: basalam.title)

#render-swe-resume(
  profile,
  title: basalam.title,
  summary: basalam.summary,
  skills-scan: basalam.skills-scan,
)
