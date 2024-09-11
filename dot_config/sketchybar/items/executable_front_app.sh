#!/bin/sh

front_app=(
  label.font="$FONT:Regular:12.0"
  icon.background.drawing=on
  display=active
  padding_right=8
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app right         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
