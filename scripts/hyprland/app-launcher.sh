#!/bin/bash

show_menu() {
    local options="$1"
    local prompt="$2"
    echo -e "$options" | wofi --dmenu --prompt "$prompt" --insensitive --height 400 --width 500
}

show_submenu() {
    local options="$1"
    local prompt="$2"
    echo -e "$options" | wofi --dmenu --prompt "$prompt" --insensitive --height 500 --width 800
}

go_to_workspace() {
    hyprctl dispatch workspace empty
}

launch_dev_terminal() {
    local dir="$1"
    hyprctl dispatch exec "alacritty -e bash -ic 'cd \"$dir\" && opencode'"
}

open_code() {
    local dir="$1"
    code --new-window "$dir" & disown
}

toggle_night_light() {
    if pgrep -x hyprsunset > /dev/null; then
        pkill hyprsunset
        hyprctl hyprsunset identity
        notify-send "Night Light" "Disabled"
    else
        hyprctl hyprsunset identity & disown
        sleep 0.5
        hyprsunset --temperature 3700 & disown
        notify-send "Night Light" "Enabled (3700K)"
    fi
}

regen_lock_screen() {
    notify-send "Lock Screen" "Hyprlock uses live backgrounds, no regen needed"
}

source "$HOME/.dotfiles/scripts/menu-actions.sh"
show_main_menu
