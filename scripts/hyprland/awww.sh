#!/bin/bash

WALLPAPER_DIR="/home/data/Pictures/backgrounds/Anime_1440"

# Get random wallpaper for each monitor
WALLPAPER_HDMI=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
WALLPAPER_DP1=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
WALLPAPER_DP2=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# Set wallpapers per monitor
awww img -o HDMI-A-1 "$WALLPAPER_HDMI" --transition-type fade --transition-duration 2
awww img -o DP-1 "$WALLPAPER_DP1" --transition-type fade --transition-duration 2
awww img -o DP-2 "$WALLPAPER_DP2" --transition-type fade --transition-duration 2