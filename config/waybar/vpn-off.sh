#!/bin/bash

IFACE="usa1"

if systemctl is-active --quiet wg-quick@$IFACE; then
    notify-send "VPN" "Disconnecting..."
    sudo systemctl stop wg-quick@$IFACE
    notify-send "VPN" "Disconnected"
fi
