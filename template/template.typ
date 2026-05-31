// ─── Page wrapper ────────────────────────────────────────────────────────────
#let resume-page(body) = {
  set page(paper: "us-letter", margin: (x: 1.2cm, y: 1cm))
  set text(font: "Lato", size: 10.5pt)
  set par(leading: 0.55em)
  set list(marker: [•], indent: 0em, body-indent: 0.5em)
  show link: set text(fill: black)
  body
}

// ─── Header ──────────────────────────────────────────────────────────────────
#let header(name: "", phone: "", email: "", linkedin: "") = {
  align(center)[
    #text(size: 22pt, weight: "bold")[#name] \
    #v(2pt)
    #phone | #email | #link("https://" + linkedin)[#linkedin]
  ]
  v(4pt)
}

// ─── Section divider ─────────────────────────────────────────────────────────
#let section(title) = {
  v(6pt)
  grid(
    columns: (auto, 1fr),
    column-gutter: 6pt,
    align(horizon, text(size: 14pt, weight: "bold")[#title]),
    move(dy: 8.5pt, line(length: 100%, stroke: 0.7pt))
  )
  v(2pt)
}

// ─── Work experience entry ───────────────────────────────────────────────────
#let job(company: "", location: "", title: "", dates: "", bullets: ()) = {
  if company != "" {
    grid(
      columns: (1fr, auto),
      text(size: 11pt, weight: "bold")[#company],
      text(style: "italic")[#location]
    )
  }
  grid(
    columns: (1fr, auto),
    text(style: "italic")[#title],
    text(style: "italic")[#dates]
  )
  v(2pt)
  list(..bullets)
  v(if company != "" { 5pt } else { 3pt })
}

// ─── Education entry ─────────────────────────────────────────────────────────
#let school(name: "", date: "", degree: "", gpa: "", bullets: ()) = {
  [#text(weight: "bold")[#name] #h(1fr) #text(style: "italic")[#date]]
  linebreak()
  [#text(style: "italic")[#degree] #h(1fr) #text(style: "italic")[#gpa]]
  v(2pt)
  list(..bullets)
  v(5pt)
}

// ─── Skills table ────────────────────────────────────────────────────────────
// Expects an array of (category-string, content) pairs.
#let skills-section(items) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    row-gutter: 0.55em,
    ..items.map(s => (text(weight: "bold")[#{s.at(0)}], s.at(1))).flatten()
  )
}

// ─── Achievement entry ───────────────────────────────────────────────────────
#let honor(title: "", subtitle: "", date: "", bullets: ()) = {
  text(weight: "bold")[#title]
  linebreak()
  if subtitle != "" {
    [#subtitle #h(1fr) #text(style: "italic")[#date]]
    linebreak()
  }
  v(2pt)
  list(..bullets)
  v(5pt)
}
