// main.typ
#import "template.typ": template

#show: doc => template(
  subject: "subject",
  semester: "semester",
  author: "author",
  cols: 3,
  compactmode: false, // toggle to true to compress formulas/list spacing
  doc
)

#include "content/content.typ"
