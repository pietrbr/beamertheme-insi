# beamerthemeInsiDark

A minimal dark Beamer theme for Northeastern University / IINS presentations.
Dark navy background, gold accent, Fira Sans typography.

## Requirements

- `FiraSans` and `FiraMono` — `tlmgr install fira`
- `tikz`, `graphicx`, `currfile` (all included in a standard MacTeX/TeX Live installation)
- `assets/bg-dark.png` and `assets/logo-insi.png` — bundled in this repo

## Installation

Symlink or copy the repo into your personal TEXMF tree:

```bash
ln -s /path/to/beamer-template ~/Library/texmf/tex/latex/beamerthemeInsiDark
```

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

| Name             | Hex       | Role                                 |
| ---------------- | --------- | ------------------------------------ |
| `InsiDark`       | `#01091E` | Title/section/header background      |
| `nuGold`         | `#FDBB45` | Primary accent (bullets, subtitle)   |
| `nuMetallicGold` | `#A4804A` | Example block header                 |
| `nuRed`          | `#C8102E` | NU brand red                         |
| `nuTeal`         | `#2CBBAB` | Alert block header, secondary accent |
| `nuLightBlue`    | `#5BC9E1` | Tertiary accent                      |
| `nuBlue`         | `#006DB7` | Definition block header              |
| `nuGray`         | `#F4F4F4` | Block body background                |
| `nuMid`          | `#666666` | Footer / caption text                |

## License

LPPL 1.3c — see [LICENSE](LICENSE).
