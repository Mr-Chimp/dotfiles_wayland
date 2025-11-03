#!/bin/bash
# ~/.config/polybar/weekday.sh

while true; do
    DAY=$(date +"%A")  # Full day name
    echo "$DAY"
    sleep 60
done
