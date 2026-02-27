#!/bin/bash

# Focus the monitor
bspc monitor HDMI-0 -f

# Launch gsimplecal in background
gsimplecal &
CAL_PID=$!

# Wait a tiny bit for the window to exist
#sleep 0.1

# Move it just below Polybar (optional, adjust coordinates)
#wmctrl -i -r $(xdotool search --pid $CAL_PID | head -n1) -e 0,100,30,-1,-1

