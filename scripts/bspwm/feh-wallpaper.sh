#!/bin/bash

WALLPAPER_DIR="/home/data/Pictures/backgrounds/Anime_1440"

WALLPAPER_HDMI=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
WALLPAPER_DP1=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
WALLPAPER_DP2=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

feh --no-fehbg --bg-scale "$WALLPAPER_DP2" --bg-scale "$WALLPAPER_HDMI" --bg-scale "$WALLPAPER_DP1"
