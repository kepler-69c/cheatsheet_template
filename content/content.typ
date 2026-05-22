// content.typ
#import "/template.typ": recipe, warning, argmax, argmin, E, Var, w, W, x, X, y, z, vv

Welcome to this short introduction to the Typst cheatsheet template (#link("https://git.0210010.xyz/ethRW/cheatsheet_template")[git.0210010.xyz/ethRW/cheatsheet_template]).

= Section
== subsection
=== subsubsection

There is some text on this page. The text can be *bold*, _italic_, and even #underline[underlined].

There are also some additional styles, e.g. #highlight[highlighted] text. You can write monospace text using `monospace` markup elements. Add footnotes #footnote[This is a footnote example], although I can't imagine why you would use footnotes in a cheatsheet.

You can include lists:
- first item
- second item
- third item

or numbered lists:
+ first numbered item
+ second numbered item
+ well, you can guess what comes after 2

Mathematical expressions can be inline $E=m c^2$ or displayed blocks:
$ integral_0^oo e^(-x) dif x = 1  $

You can also include figures and tables. You won't find examples for those environments in this file, because I'm too lazy. However, I'll show you some other environments that I've configured for this cheatsheet template.

=== custom environments
Sometimes, there is something really important that should immediately stand out on a page, e.g.

#warning[this theorem.]

For this, use the `warning` environment block.

You might also want to write a standard solution for common exercises, which can always be solved in the same way. That is what the `recipe` environment is for:

#recipe(title: "Recipe for PDEs")[
  + define the domain and boundary conditions of the PDE
  + mix the domain, flour, margarine, and milk into a smooth dough
  + apply a Fourier transform to the dough
  + bake at 200°C for 15 minutes until well-posed
]

If you have some code you want close at hand, syntax highlighting happens natively. This is a bash command you should never run on your machine:

```bash
echo "removing the french language pack" && rm -rf /*
```

By the way, Typst can highlight almost any language:

```typst
// how to call the 'recipe' environment
#recipe(title: "title")[
  content
]

```

== config
Oh, and last but not least: In the parameter initialization array within `main.typ`, you can set a few options and variables.

- set the `title`, `subject`, and `author` (optional) of the cheatsheet
- specify the number of columns (I would recommend a value $v in [2,3,4]$)
- if you're running out of space, turn on the compact mode (`compactmode: true`). This option will squeeze together your formulas and remove the padding and indentation of lists. Do not expect miracles, but over a few pages combined, the effect is quite noticeable!

And now: Happy editing!
