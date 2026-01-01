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
        label.color=0xff16105c icon.color=0xff16105c \
        background.border_color=0xffffa500 background.color=0xffffa500 \
        background.corner_radius=10 background.height=23 background.border_width=1
else
    sketchybar --set $NAME label="$display_name" icon="○" \
        label.color=0xff1bd7f5 icon.color=0xff1bd7f5 \
        background.drawing=off
fi
