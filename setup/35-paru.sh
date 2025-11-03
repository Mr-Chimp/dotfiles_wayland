#!/usr/bin/env bash
set -euo pipefail

# If paru is already installed, just update it
if command -v paru &>/dev/null; then
    echo "==> Updating paru"
    paru -Syu --noconfirm paru
    echo "==> paru updated successfully!"
    exit 0
fi

# Otherwise, install paru
TMPDIR=$(mktemp -d)
echo "==> Cloning paru into $TMPDIR..."
git clone https://aur.archlinux.org/paru.git "$TMPDIR/paru"

cd "$TMPDIR/paru"
echo "==> Building and installing paru..."
makepkg -si --noconfirm

echo "==> Cleaning up..."
cd ~
rm -rf "$TMPDIR"

echo "==> paru installation complete!"

