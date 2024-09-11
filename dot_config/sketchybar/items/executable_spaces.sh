#!/bin/bash

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)
#
sketchybar --add event aerospace_workspace_change
#echo $(aerospace list-workspaces --monitor 1 --visible no --empty no) >> ~/aaaa

space_listener=(
  icon=
  icon.font="$ICON_FONT:Regular:20.0"
  padding_right=8
  display=active
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color="$WHITE"
)

# sketchybar --add item space_listener left               \
#            --set space_listener "${space_listener[@]}"   \
#            --subscribe space_listener space_windows_change
sketchybar --add item space_listener left \
  --set space_listener "${space_listener[@]}" \
  --subscribe space_listener aerospace_workspace_change

# sketchybar  --add item change_windows left \
#             --set change_windows script="$PLUGIN_DIR/change_windows.sh" \
#             --subscribe change_windows space_changes

# Assign key-value pairs (number to string)
workspace_icons=(
  [1]="󱅱"
  [2]=""
  [3]=""
  [4]=""
  [5]=""
  [6]="󰇰"
  [7]=""
  [8]="󰧮"
)

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor "$m"); do
    workspace_id=$i

    space=(
      space="$workspace_id"
      icon="${workspace_icons[$workspace_id]}"
      icon.font="$ICON_FONT:Regular:14.0"
      icon.highlight_color="$RED"
      icon.padding_left=10
      icon.padding_right=10
      display="$m"
      padding_left=1
      padding_right=1
      label.padding_right=20
      label.color="$GREY"
      label.highlight_color="$WHITE"
      label.font="sketchybar-app-font:Regular:14.0"
      label.y_offset=-1
      background.drawing="on"
      background.color="$BACKGROUND_2"
      background.border_color="$BACKGROUND_1"
      script="$PLUGIN_DIR/space.sh"
    )

    apps=$(aerospace list-windows --workspace "$workspace_id" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    icon_strip=" "
    if [ "${apps}" != "" ]; then
      while read -r app; do
        icon_strip+=" $("$CONFIG_DIR/plugins/icon_map.sh" "$app")"
      done <<<"${apps}"
    else
      icon_strip=" —"
    fi

    sketchybar --add space "space.$workspace_id" left \
      --set "space.$workspace_id" "${space[@]}" label="$icon_strip" \
      --subscribe "space.$workspace_id" mouse.clicked

    # sketchybar --add space "space.$workspace_id.$window_id" left \
    #            --set "space.$workspace_id" "${space[@]}" label="$icon_strip"\
    #            --subscribe "space.$workspace_id" mouse.clicked
  done

  for i in $(aerospace list-workspaces --monitor "$m" --empty); do
    sketchybar --set "space.$i" display=0
  done
done
