#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

sketchybar --set "$NAME" label="$(date '+%d-%b-%Y %a %H:%M')" icon=" "\
        padding_left=5 padding_right=5 \
        background.border_color=0xffcdd6f4 background.color=0x10cdd6f4 \
        background.corner_radius=10 background.height=23 background.border_width=1 \
        icon.color=0xffcdd6f4 label.color=0xffcdd6f4 

