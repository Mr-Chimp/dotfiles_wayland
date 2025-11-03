#!/bin/bash

# Hyprland Named Workspace Navigator - HARDCODED VERSION
# Update this array if you change workspace names in hyprland.conf!

ACTION="${1}"  # "next" or "prev"

# HARDCODED workspace arrays for each monitor
# UPDATE THESE IF YOU CHANGE hyprland.conf!
DP1_WORKSPACES=("I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" "Game")
HDMI1_WORKSPACES=("Internet" "Email" "1" "2" "3" "Steam") 
DP2_WORKSPACES=("Passwords" "Teams" "A" "B" "C" "D")

# Get current monitor and workspace from hyprctl
ACTIVE_OUTPUT=$(hyprctl activeworkspace)

# Extract monitor name (e.g., "DP-2" from "workspace ID 5 (5) on monitor DP-2:")
CURRENT_MONITOR=$(echo "$ACTIVE_OUTPUT" | grep -oP 'on monitor \K[^:]+')
# Extract workspace name/number (e.g., "5" from "workspace ID 5 (5)")
CURRENT_WORKSPACE=$(echo "$ACTIVE_OUTPUT" | head -1 | grep -oP 'workspace ID [^ ]+ \(\K[^)]+')

# Select the right workspace array
case "$CURRENT_MONITOR" in
    "DP-1") WORKSPACES=("${DP1_WORKSPACES[@]}") ;;
    "HDMI-A-1") WORKSPACES=("${HDMI1_WORKSPACES[@]}") ;;
    "DP-2") WORKSPACES=("${DP2_WORKSPACES[@]}") ;;
    *) 
        echo "Unknown monitor: $CURRENT_MONITOR"
        exit 1
        ;;
esac

# Find current index
CURRENT_INDEX=0
for i in "${!WORKSPACES[@]}"; do
    if [ "${WORKSPACES[$i]}" = "$CURRENT_WORKSPACE" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate next/previous
if [ "$ACTION" = "next" ]; then
    NEW_INDEX=$(( (CURRENT_INDEX + 1) % ${#WORKSPACES[@]} ))
elif [ "$ACTION" = "prev" ]; then
    NEW_INDEX=$(( (CURRENT_INDEX - 1 + ${#WORKSPACES[@]}) % ${#WORKSPACES[@]} ))
else
    echo "Usage: $0 [next|prev]"
    exit 1
fi

# Switch workspace
NEW_WORKSPACE="${WORKSPACES[$NEW_INDEX]}"
echo "DEBUG: Switching to workspace: '$NEW_WORKSPACE' on monitor: '$CURRENT_MONITOR'" >&2
hyprctl dispatch workspace "$NEW_WORKSPACE"