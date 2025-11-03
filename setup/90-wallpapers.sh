#!/usr/bin/env bash
set -euo pipefail

# === Variables ===
DOTFILES_LIGHTDM_DIR="/home/richard/.dotfiles/dm"
WALLPAPER_SRC_DIR="$DOTFILES_LIGHTDM_DIR/backgrounds"
WALLPAPER_DEST_DIR="/usr/share/backgrounds/dm"

# === Wallpapers ===
sudo mkdir -p "$WALLPAPER_DEST_DIR"
sudo cp -r "$WALLPAPER_SRC_DIR"/* "$WALLPAPER_DEST_DIR/"
sudo chmod 755 "$WALLPAPER_DEST_DIR"
sudo chmod 644 "$WALLPAPER_DEST_DIR"/*


systemctl --user daemon-reload
systemctl --user enable --now swww-wallpaper.timer