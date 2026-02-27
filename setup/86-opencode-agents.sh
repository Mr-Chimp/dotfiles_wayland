#!/usr/bin/env bash
set -euo pipefail

# === CONFIG ===
REPO_DIR="$HOME/.dotfiles"
OPENTARGETS=(
    "global:$HOME/.config/opencode"
    "zprojects:/home/data/Coding/zProjects/.opencode"
    "local-hosting:/home/data/Synced/Main Bits/Local Hosting/.opencode"
    "archived-projects:/home/data/Synced/Main Bits/Archived Projects/.opencode"
)

echo "[*] Deploying OpenCode agents..."

for target in "${OPENTARGETS[@]}"; do
    src_folder="${target%%:*}"
    dest_path="${target##*:}"
    src_dir="$REPO_DIR/opencode/projects/$src_folder"

    if [[ ! -d "$src_dir" ]]; then
        echo "[!] Skipping $src_folder - source directory not found"
        continue
    fi

    mkdir -p "$dest_path/agents"

    if [[ -f "$src_dir/opencode.json" ]]; then
        echo "[*] Copying opencode.json → $dest_path/opencode.json"
        cp "$src_dir/opencode.json" "$dest_path/opencode.json"
    fi

    for agent_file in "$src_dir"/*.md; do
        if [[ -f "$agent_file" ]]; then
            agent_name=$(basename "$agent_file")
            echo "[*] Copying $agent_name → $dest_path/agents/$agent_name"
            cp "$agent_file" "$dest_path/agents/$agent_name"
        fi
    done
done

echo "[✔] OpenCode agents deployment complete!"
