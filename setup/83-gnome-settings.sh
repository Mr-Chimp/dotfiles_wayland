#!/bin/bash

# --- System/GNOME Settings Setup ---

echo "Applying system-wide GNOME settings..."

# Set GNOME color scheme to prefer dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "✓ System settings applied"