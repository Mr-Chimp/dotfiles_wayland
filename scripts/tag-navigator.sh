#!/bin/bash

# Get current focused tags
current_tags=$(riverctl get-focused-tags)

# Define tag sets for each monitor
dp1_tags=(1 2 3 4 5 6 7 8 9 10 11)           # I, II, III, ..., X, Game
hdmi1_tags=(12 13 14 15 16 17)               # Internet, Email, 1, 2, 3, Steam  
dp2_tags=(18 19 20 21 22 23)                 # Passwords, Teams, A, B, C, D

# Combine all tags in order
all_tags=("${dp1_tags[@]}" "${hdmi1_tags[@]}" "${dp2_tags[@]}")

find_current_index() {
    for i in "${!all_tags[@]}"; do
        if [[ $((1 << (all_tags[i] - 1))) -eq $current_tags ]]; then
            echo $i
            return
        fi
    done
    echo 0
}

current_index=$(find_current_index)

case "$1" in
    "next")
        next_index=$(( (current_index + 1) % ${#all_tags[@]} ))
        riverctl set-focused-tags $((1 << (all_tags[next_index] - 1)))
        ;;
    "prev")
        prev_index=$(( (current_index - 1 + ${#all_tags[@]}) % ${#all_tags[@]} ))
        riverctl set-focused-tags $((1 << (all_tags[prev_index] - 1)))
        ;;
    "move-next")
        next_index=$(( (current_index + 1) % ${#all_tags[@]} ))
        riverctl send-to-tags $((1 << (all_tags[next_index] - 1)))
        riverctl set-focused-tags $((1 << (all_tags[next_index] - 1)))
        ;;
    "move-prev")  
        prev_index=$(( (current_index - 1 + ${#all_tags[@]}) % ${#all_tags[@]} ))
        riverctl send-to-tags $((1 << (all_tags[prev_index] - 1)))
        riverctl set-focused-tags $((1 << (all_tags[prev_index] - 1)))
        ;;
esac