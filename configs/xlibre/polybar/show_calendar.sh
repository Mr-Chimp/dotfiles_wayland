#!/bin/bash

bspc monitor HDMI-A-0 -f
gsimplecal &
sleep 0.1
xdotool search --class "Gsimplecal" windowmove -- 3480 50
