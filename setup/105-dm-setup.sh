#!/usr/bin/env bash
set -euo pipefail

# === Variables ===
DOTFILES_LY_DIR="/home/richard/.dotfiles/dm"
LY_CONFIG_DIR="/etc/ly"

# === Root Check ===
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    echo "Usage: sudo $0"
    exit 1
fi

# === Enable ly ===
if ! systemctl is-enabled ly.service >/dev/null 2>&1; then
    echo "Enabling ly service..."
    systemctl enable ly.service
fi

# === Copy ly config ===
echo "Copying ly configuration file..."
if [[ -f "$DOTFILES_LY_DIR/ly.ini" ]]; then
    cp "$DOTFILES_LY_DIR/ly.ini" "$LY_CONFIG_DIR/config.ini"
    chown root:root "$LY_CONFIG_DIR/config.ini"
    chmod 644 "$LY_CONFIG_DIR/config.ini"
    echo "  -> Installed config.ini"
else
    echo "  -> Warning: config.ini not found in $DOTFILES_LY_DIR"
fi


echo ""
echo "✓ ly configuration complete!"
echo "Reboot to see the changes."