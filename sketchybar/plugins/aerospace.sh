#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=off label.color=0xfff7768e
else
    sketchybar --set $NAME background.drawing=off label.color=0xff7aa2f7
fi
