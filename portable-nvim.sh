#!/bin/bash

if [ -n "$1" ]; then
    REPO_URL="$1"
    CONFIG_DIR="config/nvim"

    echo "Downloading Neovim configuration files from $REPO_URL..."
    rm -rf "$CONFIG_DIR/*"
    git clone "$REPO_URL" "$CONFIG_DIR/"

else
    echo "No REPO_URL specified. Skipping download-config and clean-config."
fi

URL="https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi"
TARGET_DIR="nvim-win64"

curl -L -o nvim-win64.msi "$URL"

mkdir -p "$TARGET_DIR"

msiexec /i nvim-win64.msi /quiet TARGETDIR="$TARGET_DIR"

XDG_CONFIG_HOME=$(PWD) "$TARGET_DIR/bin/nvim.exe" . --cmd "set runtimepath+=config/nvim" --cmd "source config/nvim/init.lua"

rm nvim-win64.msi

