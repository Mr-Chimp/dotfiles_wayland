#!/bin/bash

# OpenCode Agents Deployment Script
# Deploys agent configurations to their appropriate locations

set -e

# Configuration
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECTS_DIR="$REPO_ROOT/projects"

# Deployment targets
# Format: "source_folder:destination_path"
# Add new projects here!
DEPLOYMENT_TARGETS=(
    "global:$HOME/.config/opencode"
    "zprojects:/home/data/Coding/zProjects/.opencode"
    "local-hosting:/home/data/Synced/Main Bits/Local Hosting/.opencode"
    "archived-projects:/home/data/Synced/Main Bits/Archived Projects/.opencode"
)

echo "[INFO] Starting OpenCode Agents deployment..."
echo "[INFO] Repository root: $REPO_ROOT"
echo ""

# Process each deployment target
for target in "${DEPLOYMENT_TARGETS[@]}"; do
    # Parse the target
    source_folder="${target%%:*}"
    destination_path="${target##*:}"
    
    source_dir="$PROJECTS_DIR/$source_folder"
    
    echo "[INFO] Deploying project: $source_folder"
    
    # Check if source directory exists
    if [[ ! -d "$source_dir" ]]; then
        echo "[ERROR] Source directory does not exist: $source_dir"
        exit 1
    fi
    
    # Create destination directories
    mkdir -p "$destination_path/agent"
    
    # Deploy opencode.json if it exists
    if [[ -f "$source_dir/opencode.json" ]]; then
        echo "[INFO]   → Copying opencode.json"
        cp "$source_dir/opencode.json" "$destination_path/"
        echo "[SUCCESS]   ✓ opencode.json deployed"
    fi
    
    # Deploy agent files - use ls to avoid glob issues
    agent_files=$(ls -1 "$source_dir"/*.md 2>/dev/null | head -20)
    if [[ -n "$agent_files" ]]; then
        agent_count=0
        # Process each agent file
        for agent_file in $agent_files; do
            if [[ -f "$agent_file" ]]; then
                agent_name=$(basename "$agent_file" .md)
                echo "[INFO]   → Copying agent: $agent_name"
                cp "$agent_file" "$destination_path/agent/"
                echo "[SUCCESS]   ✓ $agent_name deployed"
                agent_count=$((agent_count + 1))
            fi
        done
        echo "[SUCCESS]   ✓ $agent_count agent(s) deployed"
    else
        echo "[WARNING]   ⚠ No agent files found"
    fi
    
    echo ""
done

echo "[SUCCESS] All deployments completed successfully!"
echo ""
echo "[INFO] Deployed targets:"
for target in "${DEPLOYMENT_TARGETS[@]}"; do
    source_folder="${target%%:*}"
    destination_path="${target##*:}"
    echo "  • $source_folder → $destination_path"
done

echo ""
echo "[INFO] To add new projects, edit DEPLOYMENT_TARGETS in this script"