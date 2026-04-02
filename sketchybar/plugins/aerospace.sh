#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon_map.sh"

WORKSPACE_ID="$1"

case "$SENDER" in
  mouse.entered)
    APPS=$(aerospace list-windows --workspace "$WORKSPACE_ID" --format '%{app-name}' 2>/dev/null)
    if [ -z "$APPS" ]; then
      sketchybar --set "$NAME" popup.drawing=off
      exit 0
    fi

    # Remove any previous popup items for this workspace
    EXISTING=$(sketchybar --query "$NAME" 2>/dev/null | grep -o "\"$NAME\\.app\\..*\"" | tr -d '"')
    for item in $EXISTING; do
      sketchybar --remove "$item" 2>/dev/null
    done

    INDEX=0
    while IFS= read -r APP; do
      [ -z "$APP" ] && continue
      __icon_map "$APP"
      ITEM_NAME="$NAME.app.$INDEX"
      sketchybar --add item "$ITEM_NAME" popup."$NAME" \
                 --set "$ITEM_NAME" \
                 icon="$icon_result" \
                 icon.font="sketchybar-app-font:Regular:16.0" \
                 label="$APP" \
                 label.font="Hack Nerd Font:Regular:12.0"
      INDEX=$((INDEX + 1))
    done <<< "$APPS"

    sketchybar --set "$NAME" popup.drawing=on
    ;;

  mouse.exited)
    sketchybar --set "$NAME" popup.drawing=off
    ;;

  *)
    # Default: workspace change event — update active highlight
    VISIBLE_WORKSPACES=$(aerospace list-workspaces --monitor all --visible)

    if echo "$VISIBLE_WORKSPACES" | grep -qx "$WORKSPACE_ID"; then
      sketchybar --set "$NAME" background.drawing=off label.color=0xfff7768e
    else
      sketchybar --set "$NAME" background.drawing=off label.color=0xff7aa2f7
    fi
    ;;
esac
