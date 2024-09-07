#!/usr/bin/env bash

version="2.0.24"
echo "installing sh"
curl -L "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v${version}/icon_map.sh" -o "$HOME/.local/share/chezmoi/dot_config/sketchybar/plugins/executable_icon_map.sh"
echo "instaling font"
curl -L "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v${version}/sketchybar-app-font.ttf" -o "${HOME}/Library/Fonts/sketchybar-app-font.ttf"
