#!/bin/bash

BACKEND_REPO="https://github.com/soroqn1/v-desk-api.git"
FRONTEND_REPO="https://github.com/soroqn1/v-desk-web.git"

echo "Starting workspace setup..."

setup_repo() {
    local dir=$1
    local url=$2
    
    if [ -d "$dir/.git" ]; then
        echo "Updating $dir..."
        cd "$dir" && git pull && cd ..
    else
        echo "Cloning $dir..."
        # If it's a submodule but folder is empty/missing .git,
        # we try to use submodule update first
        if git submodule status "$dir" >/dev/null 2>&1; then
            git submodule update --init --recursive "$dir"
        else
            rm -rf "$dir"
            git clone "$url" "$dir"
        fi
    fi
}

setup_repo "backend" "$BACKEND_REPO"
setup_repo "frontend" "$FRONTEND_REPO"

echo "Setup complete!"
