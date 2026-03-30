#!/usr/bin/env bash

VISIBLE_WORKSPACES=$(aerospace list-workspaces --monitor all --visible)

if echo "$VISIBLE_WORKSPACES" | grep -qx "$1"; then
    sketchybar --set $NAME background.drawing=off label.color=0xfff7768e
else
    sketchybar --set $NAME background.drawing=off label.color=0xff7aa2f7
fi
