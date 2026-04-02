#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

case "$SENDER" in
  volume_change)
    VOLUME="$INFO"

    case "$VOLUME" in
      [6-9][0-9]|100) ICON="󰕾" ;;
      [3-5][0-9])     ICON="󰖀" ;;
      [1-9]|[1-2][0-9]) ICON="󰕿" ;;
      *)              ICON="󰖁" ;;
    esac

    sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" \
               --set volume_slider slider.percentage="$VOLUME"
    ;;

  mouse.scrolled)
    VOLUME=$(osascript -e 'output volume of (get volume settings)')
    if [ "$SCROLL_DELTA" -gt 0 ]; then
      VOLUME=$(( VOLUME + 5 > 100 ? 100 : VOLUME + 5 ))
    else
      VOLUME=$(( VOLUME - 5 < 0 ? 0 : VOLUME - 5 ))
    fi
    osascript -e "set volume output volume $VOLUME"
    ;;

  mouse.entered)
    VOLUME=$(osascript -e 'output volume of (get volume settings)')
    sketchybar --set volume_slider slider.percentage="$VOLUME" \
               --set volume popup.drawing=on
    ;;

  mouse.exited.global)
    sketchybar --set volume popup.drawing=off
    ;;
esac
