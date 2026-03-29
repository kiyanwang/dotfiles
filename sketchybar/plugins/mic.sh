#!/bin/sh

if [ "$SENDER" = "mouse.clicked" ]; then
  MUTED=$(osascript -e 'input volume of (get volume settings)')
  if [ "$MUTED" -eq 0 ]; then
    osascript -e 'set volume input volume 100'
    sketchybar --set $NAME icon=󰍬 icon.color=0xffffffff
  else
    osascript -e 'set volume input volume 0'
    sketchybar --set $NAME icon=󰍭 icon.color=0xfff7768e
  fi
else
  MUTED=$(osascript -e 'input volume of (get volume settings)')
  if [ "$MUTED" -eq 0 ]; then
    sketchybar --set $NAME icon=󰍭 icon.color=0xfff7768e
  else
    sketchybar --set $NAME icon=󰍬 icon.color=0xffffffff
  fi
fi
