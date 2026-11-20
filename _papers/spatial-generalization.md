---
title: "Spatial Generalization of Satellite Image Time Series Foundation Models: Role of Auxiliary Variables as Inputs or Targets in Vegetation Type Mapping"
year: 2026
date: 2026-12-15          # sort key only — keeps the preprint above the workshop version
status: preprint
type: journal            # journal | conference | workshop
venue:                     # empty on purpose: the index says "Preprint" and nothing else
selected: true
project_page: true
sitemap: true

authors:
  - Sarah Brood
  - Iris Dumeur
  - Jérémy Anger
  - Aurélien de Truchis
  - Philippe Ciais
  - Alexandre d'Aspremont

# "Last, First" — this is what Google Scholar reads, not the display list above.
citation_authors:
  - "Brood, Sarah"
  - "Dumeur, Iris"
  - "Anger, Jérémy"
  - "de Truchis, Aurélien"
  - "Ciais, Philippe"
  - "d'Aspremont, Alexandre"

# No links for now — they will be added when the preprint goes public.

# Add these back when you want them public. Each one adds a link to the bar.
# pdf: /files/papers/spatial-generalization.pdf
# arxiv: https://arxiv.org/abs/XXXX.XXXXX
# code: https://github.com/sbrood/...

# Used on the CV page, not on this page.
citation: 'S. Brood, I. Dumeur, J. Anger, A. de Truchis, P. Ciais, and A. d''Aspremont. (2026). "Spatial Generalization of Satellite Image Time Series Foundation Models: Role of Auxiliary Variables as Inputs or Targets in Vegetation Type Mapping." Preprint.'

# Uncomment to bring back the "Cite" block and its BibTeX button.
# bibtex: |
#   @inproceedings{brood2026auxiliary,
#     title     = {Role of Auxiliary Variables as Inputs or Targets in Spatial
#                  Generalization of Satellite Image Time Series Foundation Models},
#     author    = {Brood, Sarah and Dumeur, Iris and Anger, J\'er\'emy and
#                  de Truchis, Aur\'elien and Ciais, Philippe and d'Aspremont, Alexandre},
#     booktitle = {NeurIPS Workshop on Advances in Representation Learning for
#                  Earth Observation (REO-2)},
#     year      = {2026}
#   }
---

<!--
Page left blank on purpose. The abstract, the method section and the encoder
figure are kept below, commented out — uncomment to bring them back. The figure
file is still in images/papers/spatial-generalization/.

## Abstract

Recent studies report that Earth Observation foundation models using satellite
image time series lose performance when tested on unseen regions. Integrating
auxiliary variables during training has shown promise in mitigating this
performance drop. A first line of work in the development of foundation models
integrates these auxiliary variables as inputs, while other works propose to use
them as targets. To our knowledge, the two integrations have never been compared
under the same conditions — same architecture, same pre-training strategy, same
dataset.

This study examines whether integrating auxiliary variables as inputs or as
pre-training targets changes in-domain and cross-domain performance. We perform
the evaluation on two tasks, tree and crop species mapping, using SEMIS, an
encoder we designed to extract spatial, spectral and temporal features.

We find that the selected auxiliaries used as inputs improve in-domain
performance (+7.0 / +0.6 macro-F1 for trees and crops) and reduce cross-domain
performance (−1.6 / −1.4), while our results suggest that using auxiliaries as
targets improves in-domain performance on trees (+4.6) but not on crops (−0.9),
and improves cross-domain performance on both tasks (+2.6 / +0.4). Targets are
therefore the preferable integration when the objective is transfer: they
outperform input integration in the cross-domain setting in every region we
considered, and they require no auxiliary data at inference.

## Method

<figure class="fig">
  <img src="{{ '/images/papers/spatial-generalization/encoder.png' | relative_url }}"
       alt="Encoder architecture: tokenizer, TimeSformer blocks, spatial upsampling, temporal summarizing and feature compression, with an inset detailing temporal and spatial attention.">
  <figcaption><b>Fig. 1</b> — SEMIS encoder. Attention alternates between the temporal axis at a fixed spatial position, and the spatial neighbourhood at a fixed acquisition date.</figcaption>
</figure>
-->
