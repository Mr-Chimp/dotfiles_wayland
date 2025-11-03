#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    base-devel
    git
    curl
    wget
    ttf-dejavu
    bind
    systemd-resolvconf
)

# Enable multilib if not already enabled
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo "Enabling multilib repository..."
    sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
fi

# Update package databases
sudo pacman -Syyu --noconfirm

echo "==> Installing core packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> Base system setup complete!"

echo "==> Setting system timezone to Europe/London"
sudo timedatectl set-timezone Europe/London
sudo timedatectl set-ntp true   # ensure NTP is enabled
sudo hwclock --systohc           # sync hardware clock

