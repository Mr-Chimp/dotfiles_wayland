#!/bin/bash

uptime=$(uptime -p | sed -e 's/up //g')

lock=$(printf '\U000f023 Lock')
logout=$(printf '\U000f0343 Logout')
reboot=$(printf '\U000f2ea Reboot')
shutdown=$(printf '\U000f011 Shutdown')

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    chosen=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | wofi --dmenu --prompt "$host | Up: $uptime" --insensitive --height 250 --width 300)
else
    chosen=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi -dmenu -no-prompt -mesg "Up: $uptime" -theme ~/.config/rofi/powermenu/theme.rasi)
fi

case "$chosen" in
    "$lock")
        if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
            hyprlock
        else
            betterlockscreen -l
        fi
        ;;
    "$logout")
        if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
            hyprctl dispatch exit
        else
            bspc quit
        fi
        ;;
    "$reboot") systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac
