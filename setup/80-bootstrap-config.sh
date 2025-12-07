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
    "$REPO_DIR/config/hypr/hyprlock.conf:$HOME/.config/hypr/hyprlock.conf"
    "$REPO_DIR/config/hypr/hyprland.conf:$HOME/.config/hypr/hyprland.conf"
    "$REPO_DIR/config/hypr/hypridle.conf:$HOME/.config/hypr/hypridle.conf"
    "$REPO_DIR/config/waybar/config-left:$HOME/.config/waybar/config-left"
    "$REPO_DIR/config/waybar/config-middle:$HOME/.config/waybar/config-middle"
    "$REPO_DIR/config/waybar/config-right:$HOME/.config/waybar/config-right"
    "$REPO_DIR/config/waybar/style.css:$HOME/.config/waybar/style.css"
    "$REPO_DIR/config/mako/config:$HOME/.config/mako/config"
    "$REPO_DIR/config/gammastep/config.ini:$HOME/.config/gammastep/config.ini"
    "$REPO_DIR/config/wofi/config:$HOME/.config/wofi/config"
    "$REPO_DIR/config/wofi/style.css:$HOME/.config/wofi/style.css"
    "$REPO_DIR/config/rofi/config.rasi:$HOME/.config/rofi/config.rasi"
    "$REPO_DIR/config/rofi/themes/colors.rasi:$HOME/.config/rofi/themes/colors.rasi"
    "$REPO_DIR/config/rofi/themes/fonts.rasi:$HOME/.config/rofi/themes/fonts.rasi"
    "$REPO_DIR/config/rofi/themes/projects-menu.rasi:$HOME/.config/rofi/themes/projects-menu.rasi"
    "$REPO_DIR/config/rofi/themes/work-menu.rasi:$HOME/.config/rofi/themes/work-menu.rasi"
    "$REPO_DIR/.bash_profile:$HOME/.bash_profile"
    "$REPO_DIR/systemd/swww-wallpaper.service:$HOME/.config/systemd/user/swww-wallpaper.service"
    "$REPO_DIR/systemd/swww-wallpaper.timer:$HOME/.config/systemd/user/swww-wallpaper.timer"
    #"$REPO_DIR/config/bspwm/bspwmrc:$HOME/.config/bspwm/bspwmrc"
    #"$REPO_DIR/config/sxhkd/sxhkdrc:$HOME/.config/sxhkd/sxhkdrc"
    #"$REPO_DIR/config/picom/picom.conf:$HOME/.config/picom/picom.conf"
    #"$REPO_DIR/config/polybar/config.ini:$HOME/.config/polybar/config.ini"
    #"$REPO_DIR/config/polybar/clock.sh:$HOME/.config/polybar/clock.sh"
    "$REPO_DIR/config/gsimplecal/config:$HOME/.config/gsimplecal/config"
    #"$REPO_DIR/config/polybar/show_calendar.sh:$HOME/.config/polybar/show_calendar.sh"
    #"$REPO_DIR/config/polybar/weekday.sh:$HOME/.config/polybar/weekday.sh"
    #"$REPO_DIR/config/dunst/dunstrc:$HOME/.config/dunst/dunstrc"
    "$REPO_DIR/.bashrc:$HOME/.bashrc"
    "$REPO_DIR/opencode/start.ts:$HOME/.config/opencode/tool/start.ts"
    #"$REPO_DIR/gtk/gtk3.0/settings.ini:$HOME/.config/gtk-3.0/settings.ini"
    #"$REPO_DIR/gtk/gtk3.0/bookmarks:$HOME/.config/gtk-3.0/bookmarks"
    #"$REPO_DIR/gtk/gtk2.0/.gtkrc-2.0:$HOME/.gtkrc-2.0"
    #"$REPO_DIR/gtk/gtk4.0/settings.ini:$HOME/.config/gtk-4.0/settings.ini"
    #"$REPO_DIR/.xinitrc:$HOME/.xinitrc"
    #"$REPO_DIR/desktop_entries/gimp.desktop:$HOME/.local/share/applications/gimp.desktop"
    #"$REPO_DIR/desktop_entries/gedit.desktop:$HOME/.local/share/applications/gedit.desktop"
    #"$REPO_DIR/config/mimeapps.list:$HOME/.config/mimeapps.list"
    #"$REPO_DIR/config/barrier.conf:$HOME/.config/barrier.conf"
    #"$REPO_DIR/config/redshift/redshift.conf:$HOME/.config/redshift/redshift.conf"
    
     #"$REPO_DIR/systemd/feh-wallpaper.service:$HOME/.config/systemd/user/feh-wallpaper.service"
     #"$REPO_DIR/systemd/feh-wallpaper.timer:$HOME/.config/systemd/user/feh-wallpaper.timer"
     #"$REPO_DIR/systemd/xsession.target:$HOME/.config/systemd/user/xsession.target"
     
     #"$REPO_DIR/config/rofi/powermenu/theme.rasi:$HOME/.config/rofi/powermenu/theme.rasi"
     #"$REPO_DIR/config/rofi/launcher/theme.rasi:$HOME/.config/rofi/launcher/theme.rasi"
     #"$REPO_DIR/config/rofi/shared/colors.rasi:$HOME/.config/rofi/shared/colors.rasi"
     #"$REPO_DIR/config/rofi/shared/fonts.rasi:$HOME/.config/rofi/shared/fonts.rasi"
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

# 3. Symlink files
for entry in "${LINKS[@]}"; do
    src="${entry%%:*}"
    dest="${entry#*:}"
    echo "[*] Linking $src → $dest"
    ln -sf "$src" "$dest"
done

echo "[✔] Done! Your config is now live."
