#!/usr/bin/env bash
set -euo pipefail

# === Variables ===
WALLPAPER_SRC_DIR="$HOME/.dotfiles/assets/lock_screen_images"
WALLPAPER_DEST_DIR="/usr/share/backgrounds/dm"

# === Wallpapers ===
sudo mkdir -p "$WALLPAPER_DEST_DIR"
sudo cp -r "$WALLPAPER_SRC_DIR"/* "$WALLPAPER_DEST_DIR/"
sudo chmod 755 "$WALLPAPER_DEST_DIR"
sudo chmod 644 "$WALLPAPER_DEST_DIR"/*


systemctl --user daemon-reload
systemctl --user enable --now awww-wallpaper.timer