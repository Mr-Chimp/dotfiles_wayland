#!/usr/bin/env bash
set -euo pipefail


PACKAGES=(
    pipewire
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    pavucontrol
    wireplumber
   
)


sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> Installed Audio Bits!"

# --- Start Pipewire services for current user ---
echo "==> Starting Pipewire services"
systemctl --user enable --now pipewire pipewire-pulse wireplumber

echo "==> User setup complete!"

