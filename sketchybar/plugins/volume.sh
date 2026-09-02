#!/bin/sh
SLIDER="volume_slider"
case "$SENDER" in
  "volume_change")
    VOLUME="$INFO"
    case "$VOLUME" in
      [1-9]|[1-9][0-9]|100) ICON="󰕾"
      ;;
      *) ICON="󰖁"
    esac
    sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" label.width=30 label.align="left" \
               --set "$SLIDER" slider.percentage="$VOLUME"
    ( sleep 10
      sketchybar --animate sin 20 --set "$SLIDER" slider.width=0 ) &
    ;;
  "mouse.clicked")
    if [ "$NAME" = "$SLIDER" ]; then
      # clicked the bar itself: set the volume
      [ -n "$PERCENTAGE" ] && \
        osascript -e "set volume output volume $PERCENTAGE" \
                  -e "set volume without output muted"
    else
      # clicked the icon or label: toggle mute
      osascript -e "set volume output muted not (output muted of (get volume settings))"
    fi
    ;;
  "mouse.entered")
    sketchybar --animate sin 20 --set "$SLIDER" slider.width=100
    ;;
  "front_app_switched"|"space_change"|"mouse.exited.global")
    sketchybar --animate sin 20 --set "$SLIDER" slider.width=0
    ;;
esac
