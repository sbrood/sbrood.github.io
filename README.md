# sbrood.github.io

Personal academic website. Plain Jekyll, no theme — every line that renders is
in this repository.

## Running it locally

```sh
pixi run serve     # http://localhost:4000, rebuilds on save
pixi run build     # one-off build into _site/
```

## Where things live

| Path | What it is |
|---|---|
| `_config.yml` | Site settings, navigation, collections |
| `_layouts/` | `default` (shell), `page` (prose pages), `paper` (project pages) |
| `_includes/` | Header, footer, the Elsewhere line, the index rows, the icons |
| `assets/css/style.css` | The whole stylesheet. Plain CSS, no preprocessor |
| `_papers/` | One file per publication |
| `_talks/` | One file per talk or poster |
| `_teaching/` | One file per course |
| `_data/elsewhere.yml` | The links under the name on the home page |
| `_data/about.yml` | The "Off the clock" paragraph |
| `files/` | PDFs (CV, posters, slides, papers) |
| `images/papers/<slug>/` | Figures for a project page |

## Adding a paper

Create `_papers/<slug>.md`. The slug becomes the URL, so keep it short and
stable.

```yaml
---
title: "The full title, as published"
year: 2026
date: 2026-03-01        # sorting only
status: published       # or: preprint
type: journal           # journal | conference | workshop — REQUIRED:
                        # it decides the section on /papers/ and on the CV
venue: "Full venue name"
venue_short: "Short name shown in the index"
selected: true          # shows on the home page
project_page: false     # true builds a page and links to it from the index
authors:
  - First Author
  - Sarah Brood         # must match site.author.name exactly to be bolded
doi: https://doi.org/...
arxiv: https://arxiv.org/abs/...
code: https://github.com/...
citation: 'The full citation string, used on the CV page.'
---
```

With `project_page: true`, also add:

- `citation_authors` in `Last, First` form — this is what Google Scholar reads;
- `bibtex: |` followed by the entry, which renders a copy-able block;
- `sitemap: true`, so the page is offered to search engines;
- the body of the file, in Markdown: `## Abstract`, `## Method`, and figures as

```html
<figure class="fig">
  <img src="{{ '/images/papers/<slug>/figure.png' | relative_url }}" alt="...">
  <figcaption><b>Fig. 1</b> — Caption.</figcaption>
</figure>
```

Figures are capped at 520px wide and composited with `mix-blend-mode: multiply`,
so a figure exported on a white background sits on the paper instead of floating
in a white box. Export figures as SVG where you can; PNG at twice the display
width otherwise.

A paper with no `type`, or an unknown one, is not lost: it shows up under an
"Other" heading at the foot of /papers/, which is the signal to go and fix the
front matter.

## Adding a talk or a poster

Create `_talks/<date>-<slug>.md`:

```yaml
---
title: "Title of the talk"
kind: Talk              # or: Poster
date: 2026-04-01
venue: "Conference name"     # keep it short, the location goes below
location: "Paris, France"
selected: true          # shows on the home page
slides: /files/talks/....pdf   # or: poster:
---
```

## Adding a course

Create `_teaching/<slug>.md`:

```yaml
---
title: "Course title"
institution: "Institution"
level: "M1"
hours: "20h"
date: 2026-01-01
materials: /files/teaching/....pdf
---
```

Teaching renders at the foot of `/talks/`. Once there are three or four courses,
move that block into its own page and add it to `nav:` in `_config.yml` — nothing
else has to change.

## Conventions worth keeping

- **No accent colour.** One ink on one paper; the only colour comes from figures.
- **Mono for metadata, serif for reading.** Every year, venue, label and link is
  IBM Plex Mono in small caps; everything you actually read is Newsreader.
- **The index is a table.** It stays scannable at twenty entries, which is the
  point.
