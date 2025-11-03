#!/bin/bash

for desk in $(bspc query --monitor DP-4 -D --names); do
    if [ -z "$(bspc query -N -d "$desk")" ]; then
        #echo "$desk"
        break
    fi
done


bspc desktop "$desk" --focus -m DP-4 
code &
sleep 2
sakura &


# Resize split: make code ~73% width
#bspc node -z right -400 0   # tweak pixel value to match ~73%
#bspc node -p east # do the split
#bspc node -f @parent && bspc node --ratio 0.78
sleep 0.5
#while [ "$(bspc query --monitor DP-4 -N -d "$desk" -n .window | wc -l)" -lt 2 ]; do
#    sleep 0.1
#done

bspc node -f @parent && bspc node --ratio 0.70
#parent=$(bspc query -N -n -f @parent)
#bspc node "$parent" --ratio 0.73


