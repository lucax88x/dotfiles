#!/bin/sh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$ICON_FONT:Regular:19.0"
  icon.padding_right=5
  icon.padding_left=10
  label.padding_left=5
  label.padding_right=10
  background.color="$BACKGROUND_1"
  background.border_color="$BACKGROUND_0"
  update_freq=120
  updates=on
)
sketchybar --add item battery right \
           --set battery "${battery[@]}" \
              script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery power_source_change system_woke

