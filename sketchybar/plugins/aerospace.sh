#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=off label.color=0xfffa8072
else
    sketchybar --set $NAME background.drawing=off label.color=0xffa8c8e8
fi
