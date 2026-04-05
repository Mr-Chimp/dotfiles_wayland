#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    bspwm
    sxhkd
    picom
    polybar
    rofi
    dunst
    redshift
    feh
    flameshot
    sakura
)

echo "==> Installing bspwm ecosystem packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> bspwm ecosystem setup complete!"
