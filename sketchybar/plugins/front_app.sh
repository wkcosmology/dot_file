#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO" icon=" " icon.color=0xfffab387 label.color=0xfffab387 \
        background.border_color=0xfffab387 background.color=0x10fab387 \
        icon.padding_left=10 label.padding_right=10 \
        background.corner_radius=10 background.height=23 background.border_width=1
fi
