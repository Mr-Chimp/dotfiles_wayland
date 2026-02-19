# !/bin/bash

IFACE="usa1"

if systemctl is-active --quiet wg-quick@$IFACE; then
    echo '{"text": " VPN ON", "class": "vpn-on"}'
else
    echo '{"text": " VPN OFF", "class": "vpn-off"}'
fi