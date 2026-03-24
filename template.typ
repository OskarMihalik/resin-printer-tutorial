#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "New Computer Modern", lang: "sk")
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")

  // Title row.
  pagebreak(weak: true)
  align(center)[
    #block(width: 100%, inset: 1em)[
      // #text(size: 20pt, weight: "bold")[TEÓRIA ODBORU MECHATRONIKA]
      // #v(1em)
      // #text(size: 16pt)[Časť: Automatizácia]
      #v(3em)
      #text(size: 24pt, weight: "bold")[Živicová tlačiareň Phrozen Sonic Mega 8K S]
      #v(10em)
      #text(size: 14pt)[Oskar Mihalik]
      #v(1em)
      #text(size: 14pt)[Rok: 2026] // Upravte podľa potreby
    ]
  ]

  body
}
