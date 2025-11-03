#!/bin/bash

uptime=$(uptime -p | sed -e 's/up //g')
host=$(hostname)

# Nerd Font Icons
lock="  Lock"
logout="󰍃  Logout"
reboot="  Reboot"
shutdown="  Shutdown"

# Show wofi menu
chosen=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | wofi --dmenu --prompt "$host | Up: $uptime" --insensitive --height 250 --width 300)

case "$chosen" in
    "$lock") hyprlock ;;
    "$logout") hyprctl dispatch exit ;;
    "$reboot") systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac