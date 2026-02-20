#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    ly
)

echo "==> Installing ly display manager"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> ly display manager setup complete!"

