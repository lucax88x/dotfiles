#!/bin/bash
# shellcheck disable=SC1091

source "$CONFIG_DIR/colors.sh"

echo "space.sh $NAME reacting $SENDER"

# when spaces are created, sets focused with highlight
space_change() {
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

  if [[ "space.$FOCUSED_WORKSPACE" == "$NAME" ]]; then
    sketchybar --set "space.$FOCUSED_WORKSPACE" icon.highlight=true \
      label.highlight=true \
      background.border_color="$GREY"
  fi
}

# when you click on space, change space
mouse_clicked() {
  aerospace workspace "${NAME#*.}"
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"space_change")
  space_change
  ;;
esac
