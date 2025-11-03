#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    mesa
    vulkan-radeon
    lib32-vulkan-radeon
)

# Enable multilib if not already enabled
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo "Enabling multilib repository..."
    sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
fi

# Update package databases
sudo pacman -Syyu --noconfirm

echo "==> Installing GPU packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> GPU driver packages installed complete!"
