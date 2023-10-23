#!/bin/bash

URL="https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi"

TARGET_DIR="nvim-win64"

curl -L -o nvim-win64.msi "$URL"

mkdir -p "$TARGET_DIR"

msiexec /i nvim-win64.msi /quiet TARGETDIR="$TARGET_DIR"

XDG_CONFIG_HOME=$(PWD) "$TARGET_DIR/bin/nvim.exe" . --cmd "set runtimepath+=config/nvim" --cmd "source config/nvim/init.lua"

rm nvim-win64.msi

