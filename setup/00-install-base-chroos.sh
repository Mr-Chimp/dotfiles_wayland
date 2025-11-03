#!/usr/bin/env bash

# This script would be run in the chroot environment when installing Arch
#
#

set -euo pipefail

# List of official repo packages
PACKAGES=(
    base-devel
    base
    linux
    linux-firmware
    nano
    sudo
    amd-ucode
    systemd
    wireguard-tools
    openssh
    less
    inetutils
)

echo "==> Installing official repo packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo "==> Base package installation complete!"
