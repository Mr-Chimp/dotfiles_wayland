#!/usr/bin/env bash
set -euo pipefail

# --- Install AUR packages ---
AUR_PACKAGES=(
    qogir-gtk-theme
    brave-bin
    barrier
    betterlockscreen
    wdisplays
)

# Check if paru exists
if ! command -v paru &>/dev/null; then
    echo "==> paru is not installed. Run ./35-paru.sh first."
    exit 1
fi

echo "==> Installing AUR packages: ${AUR_PACKAGES[*]}"
paru -S --needed --noconfirm "${AUR_PACKAGES[@]}"


