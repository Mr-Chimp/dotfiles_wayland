#!/bin/bash

#notify-send "Start-up" "Running update check..."
#bash "$HOME/.dotfiles/scripts/update_check.sh" &

notify-send "Start-up" "Launching applications..."

brave &
firefox &
keepassxc &
thunderbird &

# Steam games - assign to Game workspace
steamlib="$HOME/.local/share/Steam"
mygames=$(ls "$steamlib/steamapps/appmanifest_"*.acf 2>/dev/null | sed 's/[^0-9]*//g')

for game in $mygames; do
    bspc rule -a steam_app_$game desktop=^Game state=fullscreen
done

notify-send "Start-up" "Done!"
