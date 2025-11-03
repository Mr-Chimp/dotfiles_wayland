#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    greetd
    greetd-regreet
    cage
)

echo "==> Installing LightDM"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> LightDM setup complete!"

