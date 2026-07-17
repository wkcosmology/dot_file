#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
#
# 

map_label() {
  case "$1" in
    QSpace)   echo "[1]" ;;
    Chrome)   echo "[2]" ;;
    Terminal) echo "[3]" ;;
    Zotero)   echo "[Q]" ;;
    DEVON)    echo "[W]" ;;
    Misc)     echo "[E]" ;;
    Preview)  echo "|A|" ;;
    s)        echo "|S|" ;;
    d)        echo "|D|" ;;
  esac
}

display_name="$(map_label "$1")"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME label="$display_name" icon="●"  \
        background.color=0xfff5b042 background.clip=0 \
        icon.color=0xff0000FF label.color=0xff0000FF \
        background.corner_radius=10 background.height=23 background.border_width=1
else
    sketchybar --set $NAME label="$display_name" icon="○" \
        icon.color=0xfff5b042 label.color=0xfff5b042 \
        background.drawing=off
fi
