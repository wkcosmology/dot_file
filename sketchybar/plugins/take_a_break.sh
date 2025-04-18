#!/bin/bash

(

for i in {20..1}
    do
        if [ $i -eq 20 ] || [ $(sketchybar --query take_a_break | grep -Eo 'WORK [0-9]+ mins' | grep -Eo '[0-9]+') -le $((i + 1)) ]
        then
            sketchybar --set take_a_break padding_left=5 padding_right=5 \
                background.corner_radius=10 background.height=23 background.border_width=1 \
                width=110 label="WORK $(printf "%02d" $((i))) mins" icon="󰍹 " align=center\
                background.border_color=0x8fcdd6f4 background.color=0x10cdd6f4 background.clip=0.2 \
                icon.color=0x8fcdd6f4 label.color=0x8fcdd6f4
            sleep 60
        else
            exit
        fi
    done

sketchybar --set take_a_break padding_left=5 padding_right=5 \
    background.corner_radius=10 background.height=23 background.border_width=0 \
    background.border_color=0x00fb7602 background.color=0xff00ffff background.clip=0 \
    width=110  label="BREAK(¬_¬)" align=center\
    icon.color=0xff0000FF label.color=0xff0000FF icon=" "

) &
