#!/bin/bash

show_menu() {
    local options="$1"
    local prompt="$2"
    echo -e "$options" | rofi -dmenu -p "$prompt" -i -theme "$HOME/.config/rofi/powermenu/theme.rasi"
}

show_submenu() {
    local options="$1"
    local prompt="$2"
    echo -e "$options" | rofi -dmenu -p "$prompt" -i -theme "$HOME/.config/rofi/shared/submenu.rasi"
}

go_to_workspace() {
    local target_desktop
    bspc monitor DisplayPort-0 -f
    for desktop in $(bspc query -D --names -m DisplayPort-0); do
        if [ -z "$(bspc query -N -d "$desktop")" ]; then
            target_desktop="$desktop"
            break
        fi
    done
    bspc desktop -f "$target_desktop"
}

launch_dev_terminal() {
    local dir="$1"
    alacritty -e bash -ic "cd \"$dir\" && opencode" & disown
}

open_code() {
    local dir="$1"
    code --new-window "$dir" & disown
}

toggle_night_light() {
    if pgrep -x redshift > /dev/null; then
        pkill redshift
        notify-send "Night Light" "Disabled"
    else
        redshift -c "$HOME/.config/redshift/redshift.conf" & disown
        notify-send "Night Light" "Enabled (3700K)"
    fi
}

regen_lock_screen() {
    notify-send "Lock Screen" "Regenerating lock screen image..."
    betterlockscreen -u /usr/share/backgrounds/dm/ --fx blur,pixel
    notify-send "Lock Screen" "Lock screen image regenerated"
}

source "$HOME/.dotfiles/scripts/menu-actions.sh"
show_main_menu
