#!/bin/bash

sketchybar --set take_a_break padding_left=30 padding_right=5 \
        background.corner_radius=10 background.height=23 background.border_width=1 \
        width=80 label="WORK~" icon="󰍹 " align=center\
        background.border_color=0x8fcdd6f4 background.color=0x10cdd6f4 background.clip=0.2 \
        icon.color=0x8fcdd6f4 label.color=0x8fcdd6f4

sleep 1200

sketchybar --set take_a_break padding_left=30 padding_right=5 \
        background.corner_radius=10 background.height=23 background.border_width=0 \
        background.border_color=0x00fb7602 background.color=0xff00ffff background.clip=0 \
        width=80  label="BREAK" align=center\
        icon.color=0xff0000FF label.color=0xff0000FF icon=" "
