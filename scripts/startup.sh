#!/bin/bash

/home/richard/.dotfiles/scripts/update_check.sh &

# Launch applications
firefox &
sleep 12
keepassxc &
thunderbird &

# Steam games - assign to Game workspace
#steamlib="$HOME/.local/share/Steam"
#mygames=$(ls "$steamlib/steamapps/appmanifest_"*.acf 2>/dev/null | sed 's/[^0-9]*//g')

#for game in $mygames; do
#    hyprctl keyword windowrulev2 "workspace:Game, class:^(steam_app_$game)$"
#done

echo "All Done"