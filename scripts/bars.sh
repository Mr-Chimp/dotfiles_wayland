#!/bin/bash
pkill waybar
sleep 0.5
waybar --config ~/.config/waybar/config-right  &
waybar --config ~/.config/waybar/config-left  &
waybar --config ~/.config/waybar/config-middle &