#!/bin/bash

# --- Configuration ---
CUSTOM_ICON_FILE="overrides/appimage.svg"
PRIMARY_ICON_PATH="mimetypes/scalable/application-executable.svg"
BASE_ICON_DIR="$HOME/.local/share/icons"

TARGET_ICONS=(
    "mimetypes/scalable/application-x-executable.svg"
    "mimetypes/scalable/binary.svg"
    "mimetypes/scalable/exec.svg"
    "mimetypes/scalable/gnome-fs-executable.svg"
    "mimetypes/scalable/gnome-mime-application-x-executable.svg"
    "mimetypes/scalable/gnome-mime-application-x-ms-dos-executable.svg"
)

# --- Script Logic ---
# Check if we're in the right directory and the custom icon exists
if [ ! -f "$CUSTOM_ICON_FILE" ]; then
    echo "Error: Custom icon file '$CUSTOM_ICON_FILE' not found!"
    echo "Make sure you're running this script from the icons/ directory."
    exit 1
fi

echo "Applying custom executable icon to theme: $THEME_NAME"
for THEME_DIR in "$BASE_ICON_DIR"/Flat-Remix-*; do
    # Check if the path is a valid directory
    if [ -d "$THEME_DIR" ]; then
        THEME_NAME=$(basename "$THEME_DIR")
        echo "Processing theme: $THEME_NAME"

        # 1. Copy the master icon to its primary location
        MASTER_ICON_FULL_PATH="$THEME_DIR/$PRIMARY_ICON_PATH"
        if [ -f "$MASTER_ICON_FULL_PATH" ]; then
            cp "$CUSTOM_ICON_FILE" "$MASTER_ICON_FULL_PATH"
            echo "  Master icon '$PRIMARY_ICON_PATH' has been replaced."
        else
            echo "  Warning: Primary icon not found at $MASTER_ICON_FULL_PATH. Skipping this theme."
            continue # Move to the next theme in the loop
        fi

        # 2. Loop through the other files and symlink them to the master icon
        for path in "${TARGET_ICONS[@]}"; do
            TARGET_FILE_FULL_PATH="$THEME_DIR/$path"
            
            # Remove the existing file to make way for the symlink
            if [ -e "$TARGET_FILE_FULL_PATH" ]; then
                rm "$TARGET_FILE_FULL_PATH"
            fi

            # Create the symbolic link
            ln -s "$MASTER_ICON_FULL_PATH" "$TARGET_FILE_FULL_PATH"
            echo "  Symlinked '$path'."
        done

        # 3. Create a specific AppImage icon as well (good practice)
        APPIMAGE_ICON_PATH="$THEME_DIR/apps/scalable/AppImage.svg"
        mkdir -p "$(dirname "$APPIMAGE_ICON_PATH")"
        cp "$CUSTOM_ICON_FILE" "$APPIMAGE_ICON_PATH"
        echo "  Created specific AppImage icon."

        # Update the icon cache for the current theme
        gtk-update-icon-cache -f -t "$THEME_DIR"
        echo "  Icon cache updated for $THEME_NAME."
        echo "----------------------------------------"
    fi
done

echo "Icon installation script finished."