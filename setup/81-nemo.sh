#!/bin/bash

# --- Configuration ---
DOTFILES_NEMO_ACTIONS="$HOME/.dotfiles/nemo/nemo_actions"
NEMO_ACTIONS_DIR="$HOME/.local/share/nemo/actions"

# --- Script Logic ---

echo "Starting to copy Nemo action files..."

if [ ! -d "$NEMO_ACTIONS_DIR" ]; then
    echo "Destination directory does not exist. Creating it at $NEMO_ACTIONS_DIR"
    mkdir -p "$NEMO_ACTIONS_DIR"
fi


cp -v "$DOTFILES_NEMO_ACTIONS"/* "$NEMO_ACTIONS_DIR"/

gsettings set org.cinnamon.desktop.default-applications.terminal exec 'alacritty'
gsettings set org.cinnamon.desktop.default-applications.terminal exec-arg '-e'

echo "Nemo action files have been copied."
echo "Remember to restart Nemo with 'nemo -q' to see the changes."