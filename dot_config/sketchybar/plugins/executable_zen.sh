#!/bin/bash

zen_on() {
  sketchybar --set '/cpu.*/' drawing=off \
    --set calendar icon.drawing=off \
    --set front_app drawing=off
}

zen_off() {
  sketchybar --set '/cpu.*/' drawing=on \
    --set calendar icon.drawing=on \
    --set front_app drawing=on
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  zen_off
fi
