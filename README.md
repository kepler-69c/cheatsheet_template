# LaTeX/Typst Cheatsheet Template

A compact, multi-column LaTeX/Typst template for writing your own cheatsheets, lecture notes, or quick references.  
Designed to squeeze the maximum amount of useful information onto a few pages without looking like garbage.

![preview](img/preview.png)  
*(example output)*

---

## Features
- robust multi-column layout (`2–4` columns supported)
- custom section styles with colored boxes
- preconfigured environments:
  - `recipe` for step-by-step solution strategies
  - `warning` for important theorems / pitfalls
- syntax-highlighted code listings with [`minted`](https://ctan.org/pkg/minted) (LaTeX)
- compact mode (`\compactmodetrue`) to shrink formulas and lists even more
- footnotes, math, tables, and other standard LaTeX/Typst goodies

## Getting Started
Clone this repo as a starting point for your own cheatsheet:

```bash
git clone https://git.0210010.xyz/ethRW/cheatsheet_template my_cheatsheet
cd my_cheatsheet
```

The LaTeX version is in the `main` branch, the Typst version in `typst_template`.

Edit your content in [`content/content.tex`](content/content.tex) or in [`content/content.typ`](content/content.typ), then build:

```bash
pdflatex -shell-escape main.tex
# or
typst compile main.typ
```

The `-shell-escape` flag is required for `minted` (syntax highlighting). (LaTeX)

## Requirements
### LaTeX
* A LaTeX distribution (e.g. TeX Live, MiKTeX)
* `pdflatex` (or `latexmk` if you prefer automated builds)
* Python with [Pygments](https://pygments.org/) (for `minted`)

### Typst
* Typst binary
* `Fira Sans` font (optional)

## License
This template is released under the [MIT License](LICENSE).
Do whatever you want with it, but don’t sue me if it breaks.