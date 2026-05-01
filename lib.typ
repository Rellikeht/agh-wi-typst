#let agh(
  titles: (),
  bibliography: none,
  author: [Author],
  supervisor: [Supervisor],
  course: [Course],
  masters: bool,
  department: [Department],
  acknowledgements: (),
  sans-font: "Liberation Sans",
  body,
) = {
  let sans(..args) = text(font: sans-font, ..args)
  set document(title: titles.join(" "), author: author)
  set page(
    paper: "a4",
    margin: (top: 30mm, bottom: 50mm, left: 15mm, right: 15mm),
  )

  v(0.5cm)
  figure(image("agh.svg", width: 12%))

  text(
    upper("Akademia Górniczo-Hutnicza im. Stanisława Staszica w Krakowie"),
    weight: 900,
    size: 12pt
  )

  v(0cm)

  text(
    department,
    weight: 700,
    size: 12pt,
  )
  set align(center)

  figure(image("agh.svg", width: 12%))

  v(1.5cm)
  text(
    "Akademia Górniczo-Hutnicza im. Stanisława Staszica w Krakowie",
    weight: 700,
    size: 15pt,
  )

  v(0cm)
  text(
    department,
    weight: 200,
    size: 14pt,
  )

  v(1.25cm)
  text(
    if masters [PRACA DYPLOMOWA] else [PROJEKT DYPLOMOWY],
    weight: 300,
    size: 13pt,
  )

  v(0.9cm)
  text(
    titles.at(0),
    weight: 800,
    size: 17pt,
  )
  if titles.len() > 1 {
    parbreak()
    text(
      titles.at(1),
      weight: 800,
      size: 11pt,
    )
  }

  align(bottom)[
    #set text(size: 12pt)
    #align(left)[
      #table(
        stroke: (bottom: 0pt, left: 0pt, right: 0pt, top: 0pt),
        align: left,
        row-gutter: -0.1em,
        column-gutter: 1.0em,
        columns: 2,
        [Autor:], text(weight: 700, author),
        [Kierunek:], text(weight: 700, course),
        [Opiekun pracy:], text(weight: 700, supervisor),
      )
    ]

    #v(1cm)
    #let today = datetime.today()
    Kraków, #today.year()
    #v(1cm)
  ]

  if acknowledgements.len() > 0 {
    pagebreak(to: "odd")
    align(bottom + right)[
      #block(width: 70%)[
        #set align(right)
        #for a in acknowledgements [
          #a
          #v(0cm)
        ]
      ]
    ]
  }

  pagebreak(to: "odd")
  set page(
    numbering: "1",
  )
  pagebreak()

  set align(left)
  v(1cm)
  outline(
    title: [
      #set text(size: 1.4em, weight: 900)
      #v(1.5cm)
      #sans(size: 1.1em, weight: 700, [Spis treści])
      #v(1cm)
    ],
    indent: 18pt,
  )

  pagebreak(to: "odd")
  set par(
    linebreaks: "optimized",
    first-line-indent: (all: true, amount: 0.5cm),
    leading: 0.55em,
    spacing: 0.8em,
  )

  set heading(numbering: "1.1.")
  show heading: body => sans(weight: 600, body) // weight just in case
  show heading.where(level: 1): body => {
    pagebreak(weak: true)
    v(2.4cm)
    text(size: 1.5em, body)
    v(0.5cm)
  }
  show heading.where(level: 2): body => {
    v(0.22cm)
    text(size: 1.25em, body)
    v(0.2cm)
  }
  show heading.where(level: 3): body => {
    v(0.25em)
    text(size: 1.25em, body)
  }


  set list(
    spacing: 1.3em,
    body-indent: 0.3em,
    marker: text(size: 0.75em, sym.circle.filled),
  )

  body
  pagebreak(to: "odd")
  bibliography
}
