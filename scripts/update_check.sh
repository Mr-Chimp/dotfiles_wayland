#!/bin/bash

# Count pacman updates
PACMAN_UPDATES=$(checkupdates 2>/dev/null | wc -l)

# Count AUR updates if paru is installed
if command -v paru >/dev/null; then
    AUR_UPDATES=$(paru -Qua 2>/dev/null | wc -l)
else
    AUR_UPDATES=0
fi

TOTAL=$((PACMAN_UPDATES + AUR_UPDATES))

if [ "$TOTAL" -gt 0 ]; then
    notify-send "Updates Available" "$TOTAL packages need updating ($PACMAN_UPDATES repo, $AUR_UPDATES AUR)"
else
    notify-send "No updates"
fi

sleep 1
