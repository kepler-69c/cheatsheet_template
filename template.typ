// template.typ

#let orange = rgb("f39c12"); // yelloworange!75!black equivalent
#let green = rgb("55a630"); // yellowgreen!75!black equivalent
#let blue1 = rgb("0077b6"); // cyan!50!blue equivalent
#let blue2 = rgb("e0f2fe"); // cyan!20 equivalent
#let blue3 = rgb("f0f9ff"); // cyan!10 equivalent

#let template(
  subject: "subject",
  semester: "semester",
  author: "",
  cols: 3,
  compactmode: false,
  doc,
) = {
  // page configuration (landscape a4 with custom margins)
  set page(
    paper: "a4",
    flipped: true,
    margin: (top: 1.2cm, left: 1cm, right: 1cm, bottom: 0.8cm),
    header-ascent: 10pt,
    header: context {
      let author-string = if author != "" [\- *#author*] else []
      let current-page = counter(page).get().first()
      let total-pages = counter(page).final().first()
      stack(
        spacing: 0pt,
        grid(
          columns: (1fr, 1fr),
          align(left)[*#subject* - #semester #author-string], align(right)[page #current-page / #total-pages],
        ),
        v(3pt), // spacing between text and the line
        line(length: 100%, stroke: 0.5pt + black), // the header divider line
      )
    },
  )

  // typography configurations
  set text(font: "Fira Sans", size: 9pt)

  // paragraph adjustments
  set par(justify: false, leading: if compactmode { 0.4em } else { 0.65em })

  // compact mode adjustments for lists and blocks
  set list(indent: 0pt, body-indent: 0.5em, marker: ([•], [◦]))
  set enum(indent: 0pt, body-indent: 0.5em)

  show list: it => {
    if compactmode {
      set block(spacing: 0.2em)
      it
    } else { it }
  }
  show enum: it => {
    if compactmode {
      set block(spacing: 0.2em)
      it
    } else { it }
  }

  // heading styles using tcolorbox equivalents
  let largeInset = if not compactmode { (x: 6pt, y: 6pt) } else { (x: 6pt, y: 3pt) }
  let smallInset = if not compactmode { (x: 6pt, y: 4pt) } else { (x: 6pt, y: 2pt) }

  show heading.where(level: 1): it => block(
    width: 100%,
    fill: blue1,
    inset: largeInset,
    radius: 0pt,
    above: 0.5em,
    text(fill: white, weight: "bold", size: 9pt, it.body),
  )

  show heading.where(level: 2): it => block(
    width: 100%,
    fill: blue2,
    inset: smallInset,
    radius: 0pt,
    above: 0.5em,
    text(fill: black, weight: "bold", size: 9pt, it.body),
  )

  show heading.where(level: 3): it => block(
    width: 100%,
    fill: blue3,
    inset: smallInset,
    radius: 0pt,
    above: 0.5em,
    text(fill: black, weight: "bold", size: 9pt, it.body),
  )

  // link styling
  show link: it => text(fill: blue1)[#underline(stroke: 0.5pt + blue1, it)]

  // multi-column execution
  columns(cols, gutter: 4pt, doc)
}

// custom environments

// recipe component
#let recipe(title: "", body) = block(
  width: 100%,
  stroke: green + 0.5pt,
  fill: white,
  inset: 0pt, // remove outer padding so title block reaches the edges
  radius: 0pt,
  breakable: true,
  [
    #block(
      width: 100%,
      fill: green, // matches border color
      inset: 4pt,
      spacing: 0pt, // prevents extra layout gaps
      grid(
        columns: (auto, 1fr),
        gutter: 4pt,
        align(horizon)[#image("img/icons/cooking-pot.svg", height: 8pt)], align(horizon)[#text(fill: white)[*#title*]],
        // text changed to white for readability
      ),
    )
    #block(
      width: 100%,
      inset: 4pt, // internal padding for the description body
      spacing: 0pt,
      body,
    )
  ],
)

// warning component
#let warning(title) = block(
  width: 100%,
  fill: orange,
  inset: (x: 4pt, y: 3pt),
  radius: 0pt,
  text(fill: white, weight: "bold", title),
)

// common math operators
#let argmax = math.op("arg max", limits: true)
#let argmin = math.op("arg min", limits: true)
#let E = math.op("E")
#let Var = math.op("Var")
#let w = math.bold("w")
#let W = math.bold("W")
#let x = math.bold("x")
#let X = math.bold("X")
#let y = math.bold("y")
#let z = math.bold("z")
#let vv = math.bold("v")
