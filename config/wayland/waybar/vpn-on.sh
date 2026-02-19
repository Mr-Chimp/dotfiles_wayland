#!/bin/bash

IFACE="usa1"

if ! systemctl is-active --quiet wg-quick@$IFACE; then
    notify-send "VPN" "Connecting..."
    sudo systemctl start wg-quick@$IFACE
    notify-send "VPN" "Connected"
fi
