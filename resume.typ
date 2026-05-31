// ─────────────────────────────────────────────────────────────────────────────
//  Resume entry point — do not edit content here.
//  All content lives in content/content.yaml.
//
//  Compile:
//    typst compile resume.typ
//    typst compile resume.typ --input content=content/content-pm.yaml -o Josepher_PM.pdf
// ─────────────────────────────────────────────────────────────────────────────

#import "template/template.typ": *

#let d = yaml(sys.inputs.at("content", default: "content/template-example.yaml"))
#let parse = s => eval(s, mode: "markup")

#resume-page[

  #header(
    name:     d.contact.name,
    phone:    d.contact.phone,
    email:    d.contact.email,
    linkedin: d.contact.linkedin,
  )

  // ── Work Experience ────────────────────────────────────────────────────────
  #section("Experience")
  #for exp in d.experience {
    job(
      company:  exp.at("company", default: ""),
      location: exp.at("location", default: ""),
      title:    exp.title,
      dates:    exp.dates,
      bullets:  exp.bullets.map(parse),
    )
  }

  // ── Skills ────────────────────────────────────────────────────────────────
  #section("Skills")
  #skills-section(d.skills.map(s => (s.category, parse(s.items))))

  // ── Achievements ──────────────────────────────────────────────────────────
  #section("Projects")
  #for a in d.achievements {
    honor(
      title:    a.title,
      subtitle: a.at("subtitle", default: ""),
      date:     a.date,
      bullets:  a.bullets.map(parse),
    )
  }

  // ── Education ──────────────────────────────────────────────────────────────
  #section("Education")
  #school(
    name:    d.education.name,
    date:    d.education.date,
    degree:  d.education.degree,
    gpa:     d.education.gpa,
    bullets: d.education.bullets.map(parse),
  )
]
