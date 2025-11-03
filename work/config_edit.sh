#!/bin/bash

for desk in $(bspc query --monitor DP-4 -D --names); do
    if [ -z "$(bspc query -N -d "$desk")" ]; then
        #bspc desktop "$desk" --focus -m DP-4
        break
    fi
done

#bspc rule --add '*:*' --one-shot --desktop "$desk" --monitor DP-4
bspc rule --add '*:*' --one-shot --desktop "$desk" --monitor "$TARGET_MONITOR"

nemo &
bspc desktop "$desk" --focus -m DP-4
sleep 0.5 
gedit &

bspc rule --remove '*:*'
