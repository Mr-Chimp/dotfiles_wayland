# Dotfiles

Personal configuration files for my Arch Linux system with Hyprland.

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
├── setup/              # Installation and setup scripts
├── systemd/            # Systemd units
└── work/               # Work-related scripts
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

- `launcher.sh` - Application launcher
- `powermenu.sh` - Power management menu
- `startup.sh` - Startup applications
- `workspace-navigator.sh` - Workspace switching
- `swap_background.sh` - Wallpaper rotation

## Notes

Configuration optimized for AMD graphics with Wayland.
