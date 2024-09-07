#!/bin/sh

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)
# 
sketchybar --add event aerospace_workspace_change
#echo $(aerospace list-workspaces --monitor 1 --visible no --empty no) >> ~/aaaa

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
      icon.font="$ICON_FONT"
      icon.highlight_color="$RED"
      icon.padding_left=10
      icon.padding_right=10
      display="$m"
      padding_left=2
      padding_right=2
      label.padding_right=20
      label.color="$GREY"
      label.highlight_color="$WHITE"
      label.font="sketchybar-app-font:Regular:16.0"
      label.y_offset=-1
      background.color="$BACKGROUND_1"
      background.border_color="$BACKGROUND_2"
      script="$PLUGIN_DIR/space.sh"
    )

    sketchybar --add space "space.$workspace_id" left \
               --set "space.$workspace_id" "${space[@]}" \
               --subscribe "space.$workspace_id" mouse.clicked

    apps=$(aerospace list-windows --workspace "$workspace_id" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    icon_strip=" "
    if [ "${apps}" != "" ]; then
      while read -r app
      do
        icon_strip+=" $("$CONFIG_DIR/plugins/icon_map.sh" "$app")"
      done <<< "${apps}"
    else
      icon_strip=" —"
    fi

    sketchybar --set "space.$workspace_id" label="$icon_strip"
  done

  for i in $(aerospace list-workspaces --monitor "$m" --empty); do
    sketchybar --set "space.$i" display=0
  done
  
done
