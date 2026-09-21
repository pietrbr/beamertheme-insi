# beamerthemeInsiDark

A minimal dark Beamer theme for Northeastern University / IINS presentations.
Dark navy background, ColorBrewer Paired palette for content, Fira Sans typography.

## Requirements

- `FiraSans` and `FiraMono` — `tlmgr install fira`
- `tikz`, `pgfplots` (with the `colorbrewer` library), `graphicx`, `currfile`
  (all included in a standard MacTeX/TeX Live installation)
- `sansmath` — only for `beamerthemeInsiDark-figure.sty` (see _Standalone figures_)
- `assets/bg-dark.png` and `assets/logo-insi.png` — bundled in this repo

## Installation

Run the install script to symlink the theme into your personal TEXMF tree
(`$(kpsewhich -var-value TEXMFHOME)/tex/latex/beamerthemeInsiDark`):

```bash
./install.sh              # link; ./install.sh --uninstall to remove
```

Or by hand: `ln -s "$(pwd)" ~/Library/texmf/tex/latex/beamerthemeInsiDark`.

After that, `\usetheme{InsiDark}` works from any document.

## Theme options

`\usetheme[acronyms, algorithms]{InsiDark}`

| Option       | Effect                                                                                                                                                |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `acronyms`   | Loads `glossaries` configured for acronyms only, plus `\glsdisablehyper`. No `\makeglossaries`, so no makeindex pass. Supply your own `acronyms.tex`. |
| `algorithms` | Loads `algorithm2e` (`ruled, vlined, linesnumbered`) and styles it for slides.                                                                        |

Neither is on by default: both pull in a heavy package a typical talk does not need. The theme locates
its own `assets/` folder automatically via `currfile` — no need to copy assets
into each project.

## Usage

```latex
\documentclass[aspectratio=169, 10pt]{beamer}
\usetheme{InsiDark}

\title{Title}
\subtitle{Subtitle}
\author[Short]{Full Name}
\institute{Northeastern University}
\event{Conference Name}
\date{Month Year}

\begin{document}

% Title slide (full dark background)
{
  \setbeamertemplate{background}{}
  \setbeamertemplate{background canvas}{\InsiDarkBg}
  \setbeamertemplate{footline}{}
  \begin{frame}[plain]\titlepage\end{frame}
}

\section{Introduction}
\sectionframe   % dark section separator slide

\begin{frame}{Frame Title}
  Content here.
\end{frame}

\closingframe{Thank you}{your@email.edu}

\end{document}
```

## Commands

| Command                                | Description                                                                                                                       |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `\sectionframe`                        | Dark full-bleed slide showing the current section name                                                                            |
| `\closingframe{msg}{contact}`          | Dark closing slide with message and contact line                                                                                  |
| `\statementframe[title]{line}`         | Dark gradient slide carrying one line, right-aligned and large: the beat between sections, a step above a divider. Title optional |
| `\statement[width]{line}`              | The statement text block on its own (default width `0.68\textwidth`); styled by the `statement` color/font                        |
| `\InsiDarkStatementBg`                 | The statement slide's gradient-plus-wave background; use as a `background canvas`                                                 |
| `\InsiDarkWaveStrokes`                 | The wave's stroke list, `offset/opacity` pairs (cm, downward from the top stroke); `\renewcommand` to retune                      |
| `\addlogo{<graphics>}`                 | Preamble call: stacks a partner mark under the monogram, flush right with it. Once per mark                                       |
| `\nulogosep`                           | Gap between stacked logos (default `0.5em`)                                                                                       |
| `\tightlist`                           | Just after `\begin{itemize}` / `\begin{enumerate}`: slide-tuned list padding                                                      |
| `\nulistsep`                           | `\itemsep` that `\tightlist` applies (default `2pt`)                                                                              |
| `\InsiDarkBg`                          | `\includegraphics` call for the full-bleed background; use inside `\setbeamertemplate{background canvas}{...}`                    |
| `\nuLogos`                             | Overlays the INSI logo at the top-right corner, plus any marks added with `\addlogo`                                              |
| `\event{name}`                         | Sets conference/event metadata shown on the title page                                                                            |
| `\nutocsep`                            | Length between `\tableofcontents` entries (default `0.7em`); `\setlength` it to retune a short or long outline                    |
| `\regularseries` / `\textregular{...}` | Fira Sans Regular -- one step up from the Light body default                                                                      |
| `\mediumseries` / `\textmedium{...}`   | Fira Sans Medium -- two steps up                                                                                                  |
| `\sbseries` / `\textsb{...}`           | Fira Sans SemiBold, one notch under bold                                                                                          |
| `\takeaway{text}`                      | Coloured line under a figure/table saying why it matters; styled by the `takeaway` color/font                                     |

## Color Palette

Content colors come from the ColorBrewer `Paired` 12-color set (loaded via the
`pgfplots` colorbrewer library) as `Paired-A` through `Paired-L`. Light/dark
pairs: A/B (blue), C/D (green), E/F (red), G/H (orange), I/J (purple),
K/L (yellow / brown). Use any of them with `\textcolor{Paired-B}{...}`, etc.

Reserved neutrals and accent:

| Name       | Hex       | Role                                        |
| ---------- | --------- | ------------------------------------------- |
| `InsiDark` | `#01091E` | Title / section / header background         |
| `themeMid` | `#666666` | Footer / caption text                       |
| `themeBg`  | `#F4F4F4` | Neutral surface                             |
| `nuGold`   | `#FDBB45` | Accent: title-slide subtitle, default block |

Hyperlinks: URLs and citations are `Paired-B`; internal navigation links stay
`InsiDark` on purpose, since colouring them would repaint every `\tableofcontents`
entry and override the `section in toc` template. `\urlstyle{same}` keeps a URL in
the body face.

Block titles: `nuGold` (default), `Paired-E` (alert), `Paired-C` (example); each
body is a 25% tint of its title. Every block carries dark text rather than white --
white on gold is 1.7:1, dark navy on gold is 11.4:1, black on `Paired-E` is 10.1:1
and on `Paired-C` 15.3:1, where white on the strong `Paired-D` green is only 3.6:1.
Title and body are two separately rounded bars, the title centred over the body.
Bullets are plain black. `\nublockpad` (0.5em) scales the inset between a bar's
coloured edge and its text; the body bar takes twice the title bar's share of it.

`\begin{narrow}[<width>]` (default `0.7\textwidth`) centres a width-limited
minipage. Since a minipage sets `\textwidth`, anything inside sized from it --
blocks, figures, tables -- narrows to match.

The block title is optional: `\begin{block}{}` (likewise `alertblock` and
`exampleblock`) drops the title bar instead of leaving an empty coloured strip,
for a callout that needs the box but no label.

## Standalone figures

`beamerthemeInsiDark-figure.sty` is the companion for the externalized-TikZ model:
one PDF per figure, each compiled on its own, which the deck then
`\includegraphics`. Such a figure is not a beamer document, so it cannot
`\usetheme{InsiDark}` and falls back to Computer Modern at `OT1` -- the face stops
matching the slide, and `<`, `>`, `|` and accented characters misrender in the
figures only. Both are consequences of theme decisions, so the theme carries them
across the boundary:

```latex
\usepackage{beamerthemeInsiDark-figure}   % in the figure's preamble, not the deck's
```

It sets `T1`, Fira Sans Light, and sans math (`sansmath`), and nothing else --
a figure's data colours and plot styles belong to the document. `install.sh`
symlinks the whole repo into `TEXMFHOME`, so no separate install step is needed;
on Overleaf, upload this file into the project alongside the theme.

## License

LPPL 1.3c — see [LICENSE](LICENSE).
