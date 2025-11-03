#!/usr/bin/env bash
set -euo pipefail

STATE="${XDG_CACHE_HOME:-$HOME/.cache}/hypr-pc-monitors.json"

# Save current monitor state (JSON)
hyprctl monitors -j > "$STATE"

# Change these to match your actual output names
PRIMARYS=( "DP-1" "HDMI-A-1" )

for OUT in "${PRIMARYS[@]}"; do
  if hyprctl monitors | grep -q "name: $OUT"; then
    hyprctl keyword monitor "$OUT,disable"
  fi
done

# Optional: turn off DPMS for those heads immediately (cosmetic)
# hyprctl dispatch dpms off

command -v notify-send >/dev/null 2>&1 && notify-send "Work mode (PC)" "Disabled DP-1 & HDMI-A-1 and saved layout."
echo "PC → Work mode: DP-1 & HDMI-A-1 disabled. Layout saved to $STATE"
