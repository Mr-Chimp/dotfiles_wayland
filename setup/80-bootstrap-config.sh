#!/usr/bin/env bash
set -euo pipefail

# === CONFIG ===
# Where the repo will live locally
REPO_DIR="$HOME/.dotfiles"

# Your Git repo URL
REPO_URL="git@github.com:USERNAME/dotfiles.git"

# Array of: "source_path:destination_path"
#"$REPO_DIR/scripts/startup.sh:$HOME/.local/bin/startup.sh"
#"$REPO_DIR/config/dmenu/dmenu_launch.sh:$HOME/.local/bin/dmenu_launch.sh"
LINKS=(
    #"$REPO_DIR/config/sway:$HOME/.config/sway"
    "$REPO_DIR/configs/wayland/hypr/hyprlock.conf:$HOME/.config/hypr/hyprlock.conf"
    "$REPO_DIR/configs/wayland/hypr/hyprland.conf:$HOME/.config/hypr/hyprland.conf"
    "$REPO_DIR/configs/wayland/hypr/hypridle.conf:$HOME/.config/hypr/hypridle.conf"
    "$REPO_DIR/configs/wayland/waybar/config-left:$HOME/.config/waybar/config-left"
    "$REPO_DIR/configs/wayland/waybar/config-middle:$HOME/.config/waybar/config-middle"
    "$REPO_DIR/configs/wayland/waybar/config-right:$HOME/.config/waybar/config-right"
    "$REPO_DIR/configs/wayland/waybar/style.css:$HOME/.config/waybar/style.css"
    "$REPO_DIR/configs/wayland/mako/config:$HOME/.config/mako/config"
    "$REPO_DIR/configs/wayland/wofi/config:$HOME/.config/wofi/config"
    "$REPO_DIR/configs/wayland/wofi/style.css:$HOME/.config/wofi/style.css"
    "$REPO_DIR/configs/shared/rofi/config.rasi:$HOME/.config/rofi/config.rasi"
    "$REPO_DIR/configs/shared/rofi/themes/colors.rasi:$HOME/.config/rofi/themes/colors.rasi"
    "$REPO_DIR/configs/shared/rofi/themes/fonts.rasi:$HOME/.config/rofi/themes/fonts.rasi"
    "$REPO_DIR/configs/shared/rofi/themes/projects-menu.rasi:$HOME/.config/rofi/themes/projects-menu.rasi"
    "$REPO_DIR/configs/shared/rofi/themes/work-menu.rasi:$HOME/.config/rofi/themes/work-menu.rasi"
    "$REPO_DIR/configs/xlibre/gsimplecal/config:$HOME/.config/gsimplecal/config"
    "$REPO_DIR/configs/xlibre/barrier.conf:$HOME/.config/barrier.conf"
    "$REPO_DIR/system/.bash_profile:$HOME/.bash_profile"
    "$REPO_DIR/system/systemd/swww-wallpaper.service:$HOME/.config/systemd/user/swww-wallpaper.service"
    "$REPO_DIR/system/systemd/swww-wallpaper.timer:$HOME/.config/systemd/user/swww-wallpaper.timer"
    "$REPO_DIR/system/systemd/hyprland-session.target:$HOME/.config/systemd/user/hyprland-session.target"
    "$REPO_DIR/system/.bashrc:$HOME/.bashrc"

    # XLibre/BSPWM configs (commented out - enable when switching to BSPWM)
    #"$REPO_DIR/config/xlibre/bspwm/bspwmrc:$HOME/.config/bspwm/bspwmrc"
    #"$REPO_DIR/config/xlibre/sxhkd/sxhkdrc:$HOME/.config/sxhkd/sxhkdrc"
    #"$REPO_DIR/config/xlibre/picom/picom.conf:$HOME/.config/picom/picom.conf"
    #"$REPO_DIR/config/xlibre/polybar/config.ini:$HOME/.config/polybar/config.ini"
    #"$REPO_DIR/config/xlibre/polybar/clock.sh:$HOME/.config/polybar/clock.sh"
    #"$REPO_DIR/config/xlibre/polybar/show_calendar.sh:$HOME/.config/polybar/show_calendar.sh"
    #"$REPO_DIR/config/xlibre/polybar/weekday.sh:$HOME/.config/polybar/weekday.sh"
    #"$REPO_DIR/config/xlibre/dunst/dunstrc:$HOME/.config/dunst/dunstrc"
    #"$REPO_DIR/.xinitrc:$HOME/.xinitrc"
    #"$REPO_DIR/config/xlibre/redshift/redshift.conf:$HOME/.config/redshift/redshift.conf"
    #"$REPO_DIR/systemd/feh-wallpaper.service:$HOME/.config/systemd/user/feh-wallpaper.service"
    #"$REPO_DIR/systemd/feh-wallpaper.timer:$HOME/.config/systemd/user/feh-wallpaper.timer"
    #"$REPO_DIR/systemd/xsession.target:$HOME/.config/systemd/user/xsession.target"
    #"$REPO_DIR/config/shared/rofi/powermenu/theme.rasi:$HOME/.config/rofi/powermenu/theme.rasi"
    #"$REPO_DIR/config/shared/rofi/launcher/theme.rasi:$HOME/.config/rofi/launcher/theme.rasi"
)

# Files to copy instead of symlink (for tools, etc.)
COPIES=(
)

# === SCRIPT ===
echo "[*] Bootstrapping your environment..."

# 1. Clone repo if it doesn't exist
#if [[ ! -d "$REPO_DIR/.git" ]]; then
#    echo "[*] Cloning $REPO_URL to $REPO_DIR"
#    git clone "$REPO_URL" "$REPO_DIR"
#else
#    echo "[*] Repo already exists, pulling latest changes..."
#    git -C "$REPO_DIR" pull
#fi

# 2. Ensure directories exist
for entry in "${LINKS[@]}"; do
    dest="${entry#*:}"
    mkdir -p "$(dirname "$dest")"
done

for entry in "${COPIES[@]}"; do
    dest="${entry#*:}"
    mkdir -p "$(dirname "$dest")"
done

# 3. Symlink files
for entry in "${LINKS[@]}"; do
    src="${entry%%:*}"
    dest="${entry#*:}"
    echo "[*] Linking $src → $dest"
    ln -sf "$src" "$dest"
done

# 4. Copy files (for tools that need to be in the right location)
for entry in "${COPIES[@]}"; do
    src="${entry%%:*}"
    dest="${entry#*:}"
    echo "[*] Copying $src → $dest"
    mkdir -p "$(dirname "$dest")"
    cp -f "$src" "$dest"
done

echo "[✔] Done! Your config is now live."