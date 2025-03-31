#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
#
# 

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME label="$1" icon="●"  \
        label.color=0xffcba6f7 icon.color=0xffcba6f7 \
        background.border_color=0xffcba6f7 background.color=0x30cba6f7 \
        background.corner_radius=10 background.height=23 background.border_width=1
else
    sketchybar --set $NAME label="$1" icon="○" \
        label.color=0xdfcba6f7 icon.color=0x8fcba6f7 \
        background.drawing=off
fi
