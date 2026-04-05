#!/bin/bash

IFACE="usa1"

if systemctl is-active --quiet wg-quick@$IFACE; then
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        echo '{"text": " VPN ON", "class": "vpn-on"}'
    else
        echo "VPN ON"
    fi
else
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        echo '{"text": " VPN OFF", "class": "vpn-off"}'
    else
        echo "VPN OFF"
    fi
fi
