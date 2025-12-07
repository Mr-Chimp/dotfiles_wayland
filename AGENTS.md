# Dotfiles AI Agent Guide

This file helps AI agents understand and manipulate Richard's dotfiles configuration.

## Project Type
Personal Arch Linux dotfiles for Hyprland (Wayland compositor) - shell scripts, config files, no compilation needed.

## Testing/Running
- **Apply config changes**: `ln -sf ~/.dotfiles/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf` (or run `setup/80-bootstrap-config.sh`)
- **Reload Hyprland**: `hyprctl reload` or `Super+Shift+R`
- **Restart Waybar**: `scripts/bars.sh`
- **Test scripts**: Execute directly, e.g. `bash scripts/app-launcher.sh`
- **No build/lint/test suite** - manual testing required

## Code Style
- **Shell scripts**: Use `#!/bin/bash` or `#!/usr/bin/env bash`, snake_case functions, 2-4 space indents
- **Comments**: Inline comments for complex logic, function headers for menus
- **Error handling**: Use `set -euo pipefail` for setup scripts only (not interactive scripts)
- **Paths**: Absolute paths preferred (`/home/richard/.dotfiles/` or `~/.dotfiles/`), use `$HOME` in scripts
- **Hyprland commands**: `hyprctl dispatch exec`, `hyprctl dispatch workspace`, etc.
- **Background jobs**: End with `& disown` for GUI apps launched from scripts

## Key Components
- **Hyprland config**: `config/hypr/` - modular config (main, keybinds, monitors, workspaces, windowrules)
- **App launcher**: `scripts/app-launcher.sh` - Wofi menu for Work/Projects/Apps, Night Light toggle
- **Projects**: Dotfiles, `/home/data/Coding/zProjects`, `/home/data/Coding/OmniEcho/code`
- **Bootstrap**: `setup/80-bootstrap-config.sh` - creates symlinks from repo to `~/.config/`
