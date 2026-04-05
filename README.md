# Dotfiles

Personal configuration files for my Arch Linux system with Hyprland (Wayland) and future XLibre/BSPWM (X11) compatibility.

## Components

### Window Manager
- **Hyprland** - Wayland compositor configuration
  - Main config: `config/hypr/hyprland.conf`
  - Keybindings: `config/hypr/keybinds.conf`
  - Window rules: `config/hypr/windowrules.conf`
  - Monitor setup: `config/hypr/monitors.conf`
  - Workspaces: `config/hypr/workspaces.conf`

### UI Components
- **Waybar** - Status bar configuration
- **Wofi** - Application launcher
- **Mako** - Notification daemon
- **ly** - Display manager configuration

### Utilities
- **Gammastep** - Screen temperature adjustment
- **gsimplecal** - Calendar widget
- **hypridle** - Idle management
- **hyprlock** - Screen locker

### Shell
- Bash configuration (`.bashrc`, `.bash_profile`)

## Directory Structure

```
.dotfiles/
├── bookmarks/          # Web browser start page
├── config/             # Application configs
├── dm/                 # Lock screen backgrounds
├── icons/              # Icon themes, cursor themes, and icon overrides (configured via overrides.sh)
├── nemo/               # File manager actions and scripts
├── scripts/            # Utility scripts
│   ├── bspwm/         # BSPWM/XLibre scripts
│   └── hyprland/      # Hyprland/Wayland scripts
├── setup/              # Installation and setup scripts
├── systemd/            # Systemd units
```

## Installation

Run setup scripts in order:
```bash
cd setup
./10-base-system.sh      # Base packages
./20-Wayland.sh          # Wayland setup
./30-core.sh             # Core utilities
./40-audio.sh            # Audio setup
./50-aur_packages.sh     # AUR packages
./70-user-tasks.sh       # User configuration
./80-bootstrap-config.sh # Link configs
```

## Scripts

### Hyprland/Wayland
- `scripts/hyprland/app-launcher.sh` - Application launcher with Work/Projects/Apps menus
- `scripts/hyprland/powermenu.sh` - Power management menu
- `scripts/hyprland/startup.sh` - Startup applications
- `scripts/hyprland/workspace-navigator.sh` - Workspace switching
- `scripts/hyprland/awww.sh` - Wallpaper rotation (for Hyprland)

### BSPWM/XLibre
- `scripts/bspwm/gimp-launch.sh` - GIMP launcher for BSPWM
- `scripts/bspwm/tag-navigator.sh` - Tag/workspace navigation for River/BSPWM
- `scripts/bspwm/swap_background.sh` - Wallpaper rotation (feh-based for X11)

## Notes

Configuration optimized for AMD graphics with Wayland. Includes compatibility for future XLibre/BSPWM setup.
