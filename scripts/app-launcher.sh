#!/bin/bash

# Function: show work submenu
work_menu() {
    work_options="Platform\nInfrastructure\nSockets\nWorkers\nGitNuro\nTeams\nPlatform (VS)\nInfrastructure (VS)\nSockets (VS)\nWorkers (VS)\nConfig Editing"
    work_choice=$(echo -e "$work_options" | rofi -dmenu -theme ~/.config/rofi/themes/work-menu.rasi -p "Work" -i)

    case "$work_choice" in
      "Platform")
        hyprctl dispatch workspace empty
        hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/MadeOpen/platform && opencode'"
        ;;
      "Platform (VS)")
        code --new-window /home/data/Coding/MadeOpen/platform & disown
        ;;
      "Infrastructure")
        hyprctl dispatch workspace empty
        hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/MadeOpen/Infrastructure && opencode'"
        ;;
      "Infrastructure (VS)")
        code --new-window /home/data/Coding/MadeOpen/Infrastructure & disown
        ;;
      "Sockets")
        hyprctl dispatch workspace empty
        hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/MadeOpen/Platform_sockets && opencode'"
        ;;
      "Sockets (VS)")
        code --new-window /home/data/Coding/MadeOpen/Platform_sockets & disown
        ;;
      "Workers")
        hyprctl dispatch workspace empty
        hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/MadeOpen/Platform_Workers && opencode'"
        ;;
      "Workers (VS)")
        code --new-window /home/data/Coding/MadeOpen/Platform_Workers & disown
        ;;
      "GitNuro")
        export _JAVA_AWT_WM_NONREPARENTING=1
        java -jar /home/data/Applications/Gitnuro-linux-x86_64-1.4.3.jar & disown
        ;;
      "Teams")
        nohup /home/data/Applications/teams-for-linux-2.1.4.AppImage  > /home/data/Applications/teams.log 2>&1 &
        ;;
      "Config Editing")
        hyprctl dispatch workspace empty
        hyprctl dispatch exec nemo
        hyprctl dispatch exec leafpad
        ;;
      *)
        echo "No valid work option selected."
        ;;
    esac
}

# Function: show projects submenu
projects_menu() {
    project_options="Dotfiles\nProject Management\nOmniEcho\nAnsible\nAnAuto\nRising Tides\nInfrastructure Docs\nDotfiles (VS)\nOmniEcho (VS)\nAnsible (VS)\nAnAuto (VS)\nInfrastructure Docs (VS)"
    project_choice=$(echo -e "$project_options" | rofi -dmenu -theme ~/.config/rofi/themes/projects-menu.rasi -p "Projects" -i)

      case "$project_choice" in
        "Dotfiles")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/richard/.dotfiles && opencode'"
          ;;
        "Dotfiles (VS)")
          code --new-window /home/richard/.dotfiles & disown
          ;;
        "Project Management")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/zProjects && opencode'"
          ;;
        "OmniEcho")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/OmniEcho/code && opencode'"
          ;;
        "OmniEcho (VS)")
          code --new-window /home/data/Coding/OmniEcho/code & disown
          ;;
        "Ansible")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd \"/home/data/Synced/Main Bits/Local Hosting/\" && opencode'"
          ;;
        "Ansible (VS)")
          code --new-window "/home/data/Synced/Main Bits/Local Hosting/Ansible" & disown
          ;;
        "AnAuto")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd /home/data/Coding/AnAuto && opencode'"
          ;;
        "AnAuto (VS)")
          code --new-window /home/data/Coding/AnAuto & disown
          ;;
        "Rising Tides")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd \"/home/data/Synced/Main Bits/Games/Roleplay/Campaigns/Rising Tides\" && opencode'"
          ;;
        "Infrastructure Docs")
          hyprctl dispatch workspace empty
          hyprctl dispatch exec "alacritty -e bash -ic 'cd \"/home/data/Synced/Main Bits/Local Hosting/infrastructure-documentation\" && opencode'"
          ;;
        "Infrastructure Docs (VS)")
          code --new-window "/home/data/Synced/Main Bits/Local Hosting/infrastructure-documentation" & disown
          ;;
        *)
          echo "No valid project selected."
          ;;

      esac
}

# List of apps to choose from
options="Work\nProjects\nNotes\nObsidian\nStart-up\nUpdate Check\nNight Light"

# Show wofi and capture choice
choice=$(echo -e "$options" | wofi --dmenu --prompt "Launch app:" --insensitive --height 400 --width 500)

# Act on choice
case "$choice" in
  Work)
    work_menu
    ;;
  Projects)
    projects_menu
    ;;
  Notes)
    /home/data/Applications/notesnook_linux_x86_64.AppImage & disown
    ;;
  Obsidian)
    /home/data/Applications/Obsidian-1.8.4.AppImage & disown
    ;;
  Start-up)
    /home/richard/.dotfiles/scripts/startup.sh & disown
    ;;
  "Update Check")
    /home/richard/.dotfiles/scripts/update_check.sh & disown
    ;;
  "Night Light")
    if pgrep -x hyprsunset > /dev/null; then
      pkill hyprsunset
      hyprctl hyprsunset identity
      notify-send "Night Light" "Disabled"
    else
      hyprctl hyprsunset identity & disown
      sleep 0.5
      hyprsunset --temperature 3700 & disown
      notify-send "Night Light" "Enabled (3700K)"
    fi
    ;;
  *)
    echo "No valid option selected."
    ;;
esac