#!/bin/bash
DATE_FORMAT="%Y-%m-%d"   # Y-m-d
TIME_FORMAT="%H:%M:%S"   # H:i:s

while true; do
    DATE=$(date +"$DATE_FORMAT")
    TIME=$(date +"$TIME_FORMAT")
    
    # Print two lines: date on first, time on second
    echo "$DATE %{F#F0C674}$TIME%{F-}"

    sleep 1
done
