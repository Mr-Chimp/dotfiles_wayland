#!/bin/bash
# Menu actions for the Rofi/Wofi app launcher.
# NOTE: The Projects menu now uses 'cam' (X11 only). The old PROJECT_ITEMS
# list and show_projects_menu() are retained for reference until the Work menu
# and Hyprland/Wofi path are also migrated. At that point this entire system
# can be simplified or removed.

WORK_ITEMS="Platform\nInfrastructure\nSockets\nWorkers\nGitNuro\nTeams\nPlatform (VS)\nInfrastructure (VS)\nSockets (VS)\nWorkers (VS)\nDevsite Deployment\nDevsite Deployment (VS)\nDevsite Dashboard\nDevsite Dashboard (VS)\nConfig Editing"

PROJECT_ITEMS="Dotfiles (Both)\nProject Management\nOmniEcho (Both)\nInfrastructure\nAnAuto (Both)\nRising Tides\nInfrastructure Docs (Both)\nPlanka AI Integration (Both)\nAnsible (VS)\nOpenTofu (VS)\nManga Watcher"

launch_dev_terminal_and_code() {
    local term_dir="$1"
    local code_dir="${2:-$1}"
    go_to_workspace
    launch_dev_terminal "$term_dir"
    sleep 0.5
    go_to_workspace
    open_code "$code_dir"
}

show_work_menu() {
    local choice
    choice=$(show_submenu "$WORK_ITEMS" "Work")
    case "$choice" in
        "Platform") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/platform" ;;
        "Platform (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/platform" ;;
        "Infrastructure") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/Infrastructure" ;;
        "Infrastructure (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/Infrastructure" ;;
        "Sockets") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/Platform_sockets" ;;
        "Sockets (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/Platform_sockets" ;;
        "Workers") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/Platform_Workers" ;;
        "Workers (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/Platform_Workers" ;;
        "Devsite Deployment") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/Devsite Deployment/devsite-deployment" ;;
        "Devsite Deployment (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/Devsite Deployment/devsite-deployment" ;;
        "Devsite Dashboard") go_to_workspace; launch_dev_terminal "/home/data/Coding/MadeOpen/Code/DevsiteDashboard" ;;
        "Devsite Dashboard (VS)") go_to_workspace; open_code "/home/data/Coding/MadeOpen/Code/DevsiteDashboard" ;;
        "GitNuro")
            go_to_workspace
            export _JAVA_AWT_WM_NONREPARENTING=1
            java -jar /home/data/Applications/Gitnuro-linux-x86_64-1.4.3.jar & disown
            ;;
        "Teams")
            go_to_workspace
            nohup /home/data/Applications/teams-for-linux-2.1.4.AppImage > /home/data/Applications/teams.log 2>&1 &
            ;;
        "Config Editing")
            go_to_workspace
            nemo & disown
            sleep 0.5
            go_to_workspace
            leafpad & disown
            ;;
    esac
}

show_projects_menu() {
    local choice
    choice=$(show_submenu "$PROJECT_ITEMS" "Projects")
    case "$choice" in
        "Dotfiles (Both)") launch_dev_terminal_and_code "$HOME/.dotfiles" ;;
        "Project Management") go_to_workspace; launch_dev_terminal "/home/data/Coding/zProjects" ;;
        "OmniEcho (Both)") launch_dev_terminal_and_code "/home/data/Coding/OmniEcho/code" ;;
        "Infrastructure") go_to_workspace; launch_dev_terminal "/home/data/Synced/Main Bits/Local Hosting" ;;
        "AnAuto (Both)") launch_dev_terminal_and_code "/home/data/Coding/AnAuto" ;;
        "Rising Tides") go_to_workspace; launch_dev_terminal "/home/data/Synced/Main Bits/Games/Roleplay/Campaigns/Rising Tides" ;;
        "Infrastructure Docs (Both)") launch_dev_terminal_and_code "/home/data/Synced/Main Bits/Local Hosting/infrastructure-documentation" ;;
        "Planka AI Integration (Both)") launch_dev_terminal_and_code "/home/data/CodeArchive/planka-cli" ;;
        "Ansible (VS)") go_to_workspace; open_code "/home/data/Synced/Main Bits/Local Hosting/Ansible" ;;
        "OpenTofu (VS)") go_to_workspace; open_code "/home/data/Synced/Main Bits/Local Hosting/open-tofu" ;;
        "Manga Watcher") launch_dev_terminal_and_code "/home/data/Coding/MangaWatcher" "/home/data/Coding/MangaWatcher/code" ;;
    esac
}

show_main_menu() {
    local items="Work\nProjects\nNotes\nObsidian\nStart-up\nUpdate Check\nNight Light\nRegen Lock Screen"
    local choice
    choice=$(show_menu "$items" "Launch app:")
    case "$choice" in
        Work) show_work_menu ;;
        Projects) ~/.local/bin/cam --config ~/.config/cam/projects.json --log & disown ;;
        Notes) go_to_workspace; /home/data/Applications/notesnook_linux_x86_64.AppImage & disown ;;
        Obsidian) go_to_workspace; /home/data/Applications/Obsidian-1.8.4.AppImage & disown ;;
        "Start-up") bash "$HOME/.dotfiles/scripts/startup.sh" & disown ;;
        "Update Check") bash "$HOME/.dotfiles/scripts/update_check.sh" & disown ;;
        "Night Light") toggle_night_light ;;
        "Regen Lock Screen") regen_lock_screen ;;
    esac
}
