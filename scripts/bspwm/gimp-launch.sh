#!/bin/bash

for desk in $(bspc query --monitor DP-4 -D --names); do
    if [ -z "$(bspc query -N -d "$desk")" ]; then
        #echo "$desk"
        break
    fi
done

# Focus that desktop
bspc desktop "$desk" --focus -m DP-4 

# Launch GIMP
gimp "$@"
