#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    wayland
    hyprland
    hyprlock
    hypridle
    xdg-desktop-portal-hyprland
    swww
)

echo "==> Installing core packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> Base system setup complete!"

