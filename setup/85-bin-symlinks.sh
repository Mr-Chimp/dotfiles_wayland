#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$HOME/.dotfiles"
BIN_SOURCE="$REPO_DIR/bin"
BIN_DEST="$HOME/.local/bin"

if [[ ! -d "$BIN_SOURCE" ]]; then
    echo "[*] No bin directory found at $BIN_SOURCE"
    exit 0
fi

mkdir -p "$BIN_DEST"

for file in "$BIN_SOURCE"/*; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        echo "[*] Linking $filename → $BIN_DEST/$filename"
        ln -sf "$file" "$BIN_DEST/$filename"
    fi
done

echo "[✔] Done! Binaries are now available in $BIN_DEST"
