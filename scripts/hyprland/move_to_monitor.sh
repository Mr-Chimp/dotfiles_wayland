#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   move_to_adjacent_monitor.sh left [--follow]
#   move_to_adjacent_monitor.sh right [--follow]

DIRECTION=${1:-}
FOLLOW=false
if [[ "${2:-}" == "--follow" ]]; then FOLLOW=true; fi

if [[ "$DIRECTION" != "left" && "$DIRECTION" != "right" ]]; then
    echo "Usage: $0 left|right [--follow]"
    exit 1
fi

# Define monitors in left-to-right order (edit to match your physical layout)
MONITORS=("DP-2" "HDMI-A-1" "DP-1")

# Get current monitor (by name) of the active window
CURRENT_MONITOR=$(hyprctl activewindow -j | jq -r '.monitor')
if [[ -z "$CURRENT_MONITOR" || "$CURRENT_MONITOR" == "null" ]]; then
    echo "No active window found."
    exit 1
fi

# Find index of current monitor in MONITORS array
CUR_IDX=""
for i in "${!MONITORS[@]}"; do
    if [[ "${MONITORS[$i]}" == "$CURRENT_MONITOR" ]]; then
        CUR_IDX=$i
        break
    fi
done

if [[ -z "$CUR_IDX" ]]; then
    echo "Current monitor '$CURRENT_MONITOR' not found in MONITORS array."
    echo "MONITORS is: ${MONITORS[*]}"
    exit 1
fi

# Compute target index with wrap-around
if [[ "$DIRECTION" == "left" ]]; then
    TARGET_IDX=$((CUR_IDX - 1))
else
    TARGET_IDX=$((CUR_IDX + 1))
fi

if (( TARGET_IDX < 0 )); then
    TARGET_IDX=$((${#MONITORS[@]} - 1))
elif (( TARGET_IDX >= ${#MONITORS[@]} )); then
    TARGET_IDX=0
fi

TARGET_MONITOR=${MONITORS[$TARGET_IDX]}

# Get active workspace name on the target monitor (JSON safe, no "(ID)" junk)
TARGET_WS=$(hyprctl monitors -j | jq -r --arg mon "$TARGET_MONITOR" \
    '.[] | select(.name==$mon) | .activeWorkspace.name')

# Fallback persistent mapping (edit to match your hyprland.conf)
if [[ -z "$TARGET_WS" || "$TARGET_WS" == "null" ]]; then
    declare -A PERSISTENT_WS
    PERSISTENT_WS["DP-2"]="Passwords Teams A B C D"
    PERSISTENT_WS["HDMI-A-1"]="Internet Email 1 2 3 Steam"
    PERSISTENT_WS["DP-1"]="I II III IV V VI VII VIII IX X Game"

    TARGET_WS=${PERSISTENT_WS[$TARGET_MONITOR]:-}
fi

if [[ -z "$TARGET_WS" ]]; then
    echo "No target workspace found for monitor $TARGET_MONITOR."
    exit 1
fi

echo "Moving focused window from '$CURRENT_MONITOR' -> '$TARGET_MONITOR' (workspace: $TARGET_WS)"

# Move the focused window
hyprctl dispatch movetoworkspace "$TARGET_WS"

# Optionally follow the window to that workspace
if [[ "$FOLLOW" == true ]]; then
    hyprctl dispatch workspace "$TARGET_WS"
fi
