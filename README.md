# beamerthemeInsiDark

A minimal dark Beamer theme for Northeastern University / IINS presentations.
Dark navy background, ColorBrewer Paired palette for content, Fira Sans typography.

## Requirements

- `FiraSans` and `FiraMono` — `tlmgr install fira`
- `tikz`, `pgfplots` (with the `colorbrewer` library), `graphicx`, `currfile`
  (all included in a standard MacTeX/TeX Live installation)
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

| Option       | Effect                                                                                                                                             |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `acronyms`   | Loads `glossaries` configured for acronyms only, plus `\glsdisablehyper`. No `\makeglossaries`, so no makeindex pass. Supply your own `acronyms.tex`. |
| `algorithms` | Loads `algorithm2e` (`ruled, vlined, linesnumbered`) and styles it for slides.                                                                      |

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

| Command                       | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `\sectionframe`               | Dark full-bleed slide showing the current section name                                                         |
| `\closingframe{msg}{contact}` | Dark closing slide with message and contact line                                                               |
| `\InsiDarkBg`                 | `\includegraphics` call for the full-bleed background; use inside `\setbeamertemplate{background canvas}{...}` |
| `\nuLogos`                    | Overlays the INSI logo at the top-right corner                                                                 |
| `\event{name}`                | Sets conference/event metadata shown on the title page                                                         |
| `\nutocsep`                   | Length between `\tableofcontents` entries (default `0.7em`); `\setlength` it to retune a short or long outline |
| `\regularseries` / `\textregular{...}` | Fira Sans Regular -- one step up from the Light body default                                          |
| `\mediumseries` / `\textmedium{...}` | Fira Sans Medium -- two steps up                                                                        |
| `\sbseries` / `\textsb{...}`  | Fira Sans SemiBold, one notch under bold                                                                       |
| `\takeaway{text}`             | Coloured line under a figure/table saying why it matters; styled by the `takeaway` color/font                  |

## Color Palette

Content colors come from the ColorBrewer `Paired` 12-color set (loaded via the
`pgfplots` colorbrewer library) as `Paired-A` through `Paired-L`. Light/dark
pairs: A/B (blue), C/D (green), E/F (red), G/H (orange), I/J (purple),
K/L (yellow / brown). Use any of them with `\textcolor{Paired-B}{...}`, etc.

Reserved neutrals and accent:

| Name       | Hex       | Role                                            |
| ---------- | --------- | ----------------------------------------------- |
| `InsiDark` | `#01091E` | Title / section / header background             |
| `themeMid` | `#666666` | Footer / caption text                           |
| `themeBg`  | `#F4F4F4` | Neutral surface                                 |
| `nuGold`   | `#FDBB45` | Accent: title-slide subtitle, default block     |

Hyperlinks: URLs and citations are `Paired-B`; internal navigation links stay
`InsiDark` on purpose, since colouring them would repaint every `\tableofcontents`
entry and override the `section in toc` template. `\urlstyle{same}` keeps a URL in
the body face.

Block titles: `nuGold` (default), `Paired-E` (alert), `Paired-D` (example); each
body is a 25% tint of its title. The default and alert blocks carry dark text
rather than white -- white on gold is 1.7:1, dark navy on gold is 11.4:1, black on
`Paired-E` is 10.1:1. Titles are centred over the body. Bullets are plain black.
`\nublockpad` (0.35em) is the padding between a block's coloured edge and its text.

`\begin{narrow}[<width>]` (default `0.7\textwidth`) centres a width-limited
minipage. Since a minipage sets `\textwidth`, anything inside sized from it --
blocks, figures, tables -- narrows to match.

The block title is optional: `\begin{block}{}` (likewise `alertblock` and
`exampleblock`) drops the title bar instead of leaving an empty coloured strip,
for a callout that needs the box but no label.

## License

LPPL 1.3c — see [LICENSE](LICENSE).
