#!/bin/bash

# Source paths
CURSOR_SOURCE="$HOME/.dotfiles/assets/icons/Neutral"
ICONS_SOURCE="$HOME/.dotfiles/assets/icons"
DEST="$HOME/.local/share/icons"

# Create the icons directory if it doesn't exist
mkdir -p "$DEST"

# Install cursor theme
echo "Installing Neutral cursor theme..."
if [ ! -d "$CURSOR_SOURCE" ]; then
    echo "Error: Cursor theme directory $CURSOR_SOURCE not found"
else
    if [ -d "$DEST/Neutral" ]; then
        echo "✓ Neutral cursor theme already installed (skipping)"
    else
        cp -r "$CURSOR_SOURCE" "$DEST/"
        echo "✓ Neutral cursor theme installed"
    fi
fi

# Extract icon packs
echo -e "\nProcessing icon packs..."
shopt -s nullglob
ICON_PACKS=("$ICONS_SOURCE"/*.tar.xz)

if [ ${#ICON_PACKS[@]} -eq 0 ]; then
    echo "No .tar.xz icon packs found in $ICONS_SOURCE"
else
    for pack in "${ICON_PACKS[@]}"; do
        pack_name=$(basename "$pack" .tar.xz)
        
        # Check if this theme is already extracted
        if [ -d "$DEST/$pack_name" ]; then
            echo "✓ $pack_name already installed (skipping)"
        else
            echo "Extracting $pack_name..."
            tar -xf "$pack" -C "$DEST"
            echo "✓ Extracted $pack_name"
        fi
    done
fi

echo -e "\n✓ Installation complete!"
echo "Restart nwg-look to see all changes"

# Run icon overrides
echo -e "\nApplying icon overrides..."
OVERRIDE_SCRIPT="$HOME/.dotfiles/assets/icons/overrides.sh"
if [ -f "$OVERRIDE_SCRIPT" ]; then
    cd "$HOME/.dotfiles/assets/icons"
    ./overrides.sh
    echo "✓ Icon overrides applied!"
else
    echo "Warning: Override script not found at $OVERRIDE_SCRIPT"
    echo "You may need to run it manually if you want to replace the executable icon."
fi