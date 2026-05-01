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
    margin: (top: 30mm, bottom: 30mm, left: 30mm, right: 20mm),
  )
  set text(spacing: 3pt, size: 12pt)
  set align(center)

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

  v(3cm)

  text(
    if masters [Praca dyplomowa] else [Projekt dyplomowy],
    weight: 800,
    size: 16pt,
  )

  v(0cm)

  for c in titles [
    #text(
      c,
      weight: 500,
      size: 16pt,
    )

    #v(0cm)
  ]
    

  align(bottom)[
    #table(
      stroke: (bottom: 0pt, left: 0pt, right: 0pt, top: 0pt),
      align: left,
      columns: 2,
      [Autor pracy:],
      author,
      [Kierunek studiów:],
      course,
      [Opiekun pracy:],
      supervisor,
    )

    #v(3cm)

    #let today = datetime.today()
    Kraków #today.year()
  ]

  pagebreak(to: "odd")

  align(bottom + right)[
    #block(width:70%)[
      #set align(right)
      #for a in acknowledgements [
        #a
        #v(0cm)
      ]
    ]
  ]

  pagebreak(to: "odd")

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


  body
  pagebreak(to: "odd")
  bibliography
}
