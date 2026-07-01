#!/usr/bin/env bash
# Symlink this theme into the personal TEXMF tree so `\usetheme{InsiDark}` is
# found from any document. Idempotent; pass --uninstall to remove the link.
set -euo pipefail

NAME="beamerthemeInsiDark"
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$(kpsewhich -var-value TEXMFHOME)/tex/latex/$NAME"

if [[ "${1:-}" == "--uninstall" ]]; then
  if [[ -L "$DEST" ]]; then rm "$DEST" && echo "unlinked $DEST"; else echo "nothing to remove at $DEST"; fi
  exit 0
fi

mkdir -p "$(dirname "$DEST")"
ln -sfn "$SRC" "$DEST"
echo "linked $DEST -> $SRC"
