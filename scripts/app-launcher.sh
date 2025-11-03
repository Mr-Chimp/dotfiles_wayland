#!/bin/bash

# Function: show work submenu
work_menu() {
    work_options="Config Editing\nGitNuro\nPhpStorm\nVS Code & Editor\nTeams"
    work_choice=$(echo -e "$work_options" | wofi --dmenu --prompt "Work apps:" --insensitive --height 300 --width 400)

    case "$work_choice" in
      PhpStorm)
        /home/data/Applications/PhpStorm/bin/phpstorm.sh & disown
        ;;
      "GitNuro")
        export _JAVA_AWT_WM_NONREPARENTING=1
        java -jar /home/data/Applications/Gitnuro-linux-x86_64-1.4.3.jar & disown
        ;;
      "VS Code & Editor")
        /home/richard/.dotfiles/work/vscode_terminal.sh & disown
        ;;
      "Config Editing")
        /home/richard/.dotfiles/work/config_edit.sh & disown
        ;;
       "Teams")
        nohup /home/data/Applications/teams-for-linux-2.1.4.AppImage  > /home/data/Applications/teams.log 2>&1 &
        ;;
      *)
        echo "No valid work option selected."
        ;;
    esac
}

# List of apps to choose from
options="Work\nNotes\nObsidian\nStart-up\nUpdate Check\nNight Light On\nNight Light Off\nExit"

# Show wofi and capture choice
choice=$(echo -e "$options" | wofi --dmenu --prompt "Launch app:" --insensitive --height 400 --width 500)

# Act on choice
case "$choice" in
  Start-up)
    /home/richard/.dotfiles/scripts/startup.sh & disown
    ;;
   "Update Check")
    /home/richard/.dotfiles/scripts/update_check.sh & disown
    ;;
"Night Light On")
    hyprctl hyprsunset identity & disown
    sleep 0.5
    hyprsunset --temperature 3700 & disown
    notify-send "Night Light" "Enabled (3700K)"
    ;;
"Night Light Off")
    pkill hyprsunset
    hyprctl hyprsunset identity
    notify-send "Night Light" "Disabled"
    ;;
  Work)
    work_menu
    ;;
  Notes)
    /home/data/Applications/notesnook_linux_x86_64.AppImage & disown
    ;;
  Obsidian)
    /home/data/Applications/Obsidian-1.8.4.AppImage & disown
    ;;
  Exit)
    exit 0
    ;;
  *)
    echo "No valid option selected."
    ;;
esac