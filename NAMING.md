# Naming

Rules for file and folder names in this repo. They follow the
[tidyverse style guide](https://style.tidyverse.org/files.html): lowercase,
snake_case, names that say what a thing is.

## Characters

- Lowercase letters, digits and `_` only. No spaces, hyphens, capitals or dots
  other than the one before the extension.
- Extensions are lowercase: `.md`, `.jpg`, `.png`.
- Tool-fixed names are exempt: `README.md`, `NAMING.md`, `LICENSE`, `.github/`,
  `.pre-commit-config.yaml`, `.ls-lint.yml`.

## One slug per work

Each book, paper or talk gets one slug, `<nn>_<first_author>_<short_title>`:

- `nn` is the work's number in the README index. It is a permanent ID: assigned
  once, in order, never reused or changed. A removed summary leaves a gap.
- `first_author` is the first author's (or editor's) surname, with any hyphen
  turned into `_`: `stephens_davidowitz`.
- `short_title` is the title's distinguishing words, with leading articles
  dropped: `nature_origins_mass_opinion`, not `the_nature_and_origins_of_...`.
- No abbreviations a cold reader would not know (`ddia`, `isl`, `tapp`, `elex`,
  `exp`, `goog`). Write the words.

The slug is used everywhere the work appears:

| what       | path                  |
| ---------- | --------------------- |
| summary    | `summaries/<slug>.md` |
| its images | `src/<slug>/`         |

A summary and its image folder share the slug exactly, so each can be found
from the other without reading either.

No `new`, `final`, `v2` or dates in names.

## Images

`src/<slug>/<location>_<what_it_shows>[_<n>].<ext>`

- `location`, when known: `ch02` (zero-padded chapter), `ch04_table_4_3`,
  `ch09_figure_9_1`, `p317` (page). Use the book's own numbering. Older folders
  use a bare zero-padded order prefix (`04a_hh_income.png`); that is fine.
- `what_it_shows`: a few words on the content, so the file is identifiable
  from a directory listing: `response_stability`, `vietnam_media_flows`.
- `_<n>` (1, 2, …) only when one exhibit spans several photos.
- Never keep camera or OS names: `PXL_20260530_233600880.jpg`,
  `Screenshot 2024-06-17 at 8.16.29 PM.png`, `.MP.jpg`.

Example:
`src/75_zaller_nature_origins_mass_opinion/ch04_table_4_3_considerations_and_opinions.jpg`.

`scripts/generate_image_gallery.sh <slug> "<Title>"` writes a starter summary
that embeds every image in `src/<slug>/`.

## Source documents

PDFs and ebooks of the works themselves are never committed; `*.pdf` is in
`.gitignore`. Keep them outside the repo.

## Checks

- [ls-lint](https://ls-lint.org) (`.ls-lint.yml`) enforces the character rules
  in CI.
- [lychee](https://lychee.cli.rs) checks that every relative link in the README
  and the summaries resolves.
