#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [1-9]|[1-9][0-9]|100) ICON="󰕾"
    ;;
    *) ICON="󰖁"
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" label.width=30 label.align="left" \
        padding_left=5 padding_right=5 \
        background.border_color=0xffcdd6f4 background.color=0x10cdd6f4 \
        background.corner_radius=10 background.height=23 background.border_width=1
fi
