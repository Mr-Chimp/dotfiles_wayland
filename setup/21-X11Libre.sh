# IMPORTANT: Run this script BEFORE installing Wayland/Hyprland on a fresh system.
# xorg-server-common (pulled in by xorg-xwayland) conflicts with xlibre-xserver-common.
# If Wayland is already installed, remove the conflict first:
#   sudo pacman -Rns xorg-server-common
# Then reinstall xorg-xwayland after - it will use xlibre-xserver-common instead.
#!/usr/bin/env bash
set -euo pipefail

XLIBRE_REPO="[xlibre]
Server = https://x11libre.net/repo/arch_based/x86_64"

echo "==> Adding XLibre binary repo signing key"
sudo pacman-key --recv-keys 73580DE2EDDFA6D6
sudo pacman-key --finger 73580DE2EDDFA6D6
sudo pacman-key --lsign-key 73580DE2EDDFA6D6

echo "==> Adding XLibre repo to pacman.conf"
if ! grep -q '^\[xlibre\]' /etc/pacman.conf; then
    echo "$XLIBRE_REPO" | sudo tee -a /etc/pacman.conf > /dev/null
else
    echo "  -> XLibre repo already configured"
fi

echo "==> Syncing package databases"
sudo pacman -Syy --noconfirm

echo "==> Installing XLibre X server and input driver (replaces xorg-server)"
sudo pacman -S --noconfirm xlibre-xserver xlibre-input-libinput

echo "==> Migrating any existing X.Org video drivers to XLibre counterparts"
MIGRATE_PKGS=$(pacman -Q 2>/dev/null | grep '^xorg-server-\|^xf86' | cut -d' ' -f1 | \
    sed 's/^xorg-server-/xlibre-xserver-/' | \
    sed 's/^xf86-/xlibre-/' || true)

if [[ -n "$MIGRATE_PKGS" ]]; then
    echo "  -> Replacing: $MIGRATE_PKGS"
    echo "$MIGRATE_PKGS" | xargs -r sudo pacman -Syy --noconfirm
else
    echo "  -> No existing X.Org drivers found, installing AMD video driver"
    sudo pacman -S --needed --noconfirm xlibre-video-amdgpu
fi

echo "==> Installing X11 client libraries and utilities"
sudo pacman -S --needed --noconfirm \
    libx11 libxext libxrender libxfixes libxcomposite libxdamage \
    libxrandr libxcursor libxft libxinerama libxres libxxf86vm \
    xorg-xkbcomp xorg-xrdb xorg-xrandr xorg-xset xorg-xsetroot \
    numlockx xclip xdo xdotool xsel

echo "==> X11Libre setup complete!"
