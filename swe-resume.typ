// Senior Back-End Software Engineer resume.
// Page 1: header, summary, skills, and the recent roles.
// Later pages: the rest of the experience, education, projects, and awards.
// The PM edition does not use this file.

#import "lib/resume.typ": resume-doc-swe, render-swe-resume, swe-title
#import "data/profile.typ" as profile

#set document(title: "Alireza Jafartash — " + swe-title, author: "Alireza Jafartash")

#show: resume-doc-swe

#render-swe-resume(profile)
