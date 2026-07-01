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

After that, `\usetheme{InsiDark}` works from any document. The theme locates
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
| `themeBg`  | `#F4F4F4` | Neutral block body background                   |
| `nuGold`   | `#FDBB45` | Title-slide subtitle accent (title slide only)  |

Default block colors: `Paired-B` (info), `Paired-F` (alert), `Paired-D`
(example). Bullets are plain black.

## License

LPPL 1.3c — see [LICENSE](LICENSE).
