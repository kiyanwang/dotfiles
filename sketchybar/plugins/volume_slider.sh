#!/bin/sh

# Handles click/drag on the volume slider popup.
# $PERCENTAGE is set by sketchybar to the click position on the slider.

case "$SENDER" in
  mouse.clicked)
    osascript -e "set volume output volume $PERCENTAGE"
    ;;
  mouse.exited)
    sketchybar --set volume popup.drawing=off
    ;;
esac
