#!/bin/bash

calendar=(
  icon=
  icon.font="$ICON_FONT:Regular:12.0"
  icon.padding_right=5
  icon.padding_left=10
  label.padding_left=5
  label.padding_right=10
  background.color="$BACKGROUND_1"
  background.border_color="$BACKGROUND_0"
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
