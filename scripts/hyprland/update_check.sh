#!/bin/bash

# Count pacman updates
PACMAN_UPDATES=$(checkupdates 2>/dev/null | wc -l)

# Count AUR updates if paru is installed
if command -v paru >/dev/null; then
    AUR_UPDATES=$(paru -Qua 2>/dev/null | wc -l)
else
    AUR_UPDATES=0
fi

# Count npm global package updates if npm is installed
if command -v npm >/dev/null; then
    NPM_UPDATES=$(npm outdated -g --parseable 2>/dev/null | wc -l)
else
    NPM_UPDATES=0
fi

TOTAL=$((PACMAN_UPDATES + AUR_UPDATES + NPM_UPDATES))

if [ "$TOTAL" -gt 0 ]; then
    MESSAGE="$TOTAL packages need updating"
    DETAILS="$PACMAN_UPDATES repo, $AUR_UPDATES AUR"
    
    if [ "$NPM_UPDATES" -gt 0 ]; then
        DETAILS="$DETAILS, $NPM_UPDATES npm"
    fi
    
    notify-send "Updates Available" "$MESSAGE ($DETAILS)"
else
    notify-send "No updates"
fi

sleep 1
