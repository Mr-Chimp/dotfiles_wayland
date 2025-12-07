#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    xorg-xwayland
    nemo
    alacritty
    gedit
    mousepad
    leafpad
    wofi
    rofi
    keepassxc
    thunderbird
    fastfetch
    go
    vlc
    ffmpeg
    libde265
    x264
    x265
    dav1d
    aom
    vlc-plugin-ffmpeg
    ansible
    ansible-lint
    python-passlib
    podman
    podman-compose
    pacman-contrib
    engrampa
    file-roller
    nemo-fileroller
    libreoffice-fresh
    hunspell
    hunspell-en_gb
    libmythes
    mythes-en
    mesa-utils
    gimp
    gimp-help-en_gb
    gimp-nufraw
    mysql-workbench
    noto-fonts-emoji
    grim
    slurp
    wl-clipboard
    steam
    syncthing
    gammastep
    nwg-look
    gnome-calculator
    waybar
    noto-fonts-cjk
    nemo-emblems
    ttf-firacode-nerd
    code
    firefox
    mako
    fuse2
    gammastep
    reflector
    qt6-multimedia-ffmpeg
    podman
    podman-compose
    tree
    mkvtoolnix-gui
    mpv
    rsync
    baobab
    gparted
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    gst-libav
    ffmpeg
    ghome-keyring
)

echo "==> Installing core packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
echo "==> Base system setup complete!"

