#!/bin/sh

HAS_BATTERY=$(system_profiler SPPowerDataType | grep -q "Battery Information"; echo $?)

if [ "$HAS_BATTERY" -ne 0 ]; then
  # Hide the battery item on Mac Mini/desktop
  sketchybar --set "$NAME" drawing=off
  exit 0
fi


PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="󰁹"
  ;;
  [6-8][0-9]) ICON="󰂀"
  ;;
  [3-5][0-9]) ICON="󰁼"
  ;;
  [1-2][0-9]) ICON="󰁺"
  ;;
  *) ICON=""
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="󰂄"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" \
        icon.color=0xffcdd6f4 label.color=0xffcdd6f4  \
