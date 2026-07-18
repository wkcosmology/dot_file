#!/bin/bash

(

for i in {20..1}
    do
        if [ $i -eq 20 ] || [ $(sketchybar --query take_a_break | grep -Eo '[0-9]+ MINs' | grep -Eo '[0-9]+') -le $((i + 1)) ]
        then
            sketchybar --set take_a_break padding_left=5 padding_right=5 \
                background.corner_radius=10 background.height=23 background.border_width=1 \
                background.border_color=0x00000000 background.color=0x00000000 background.clip=0 \
                icon.color=0xfff5b042 label.color=0xfff5b042 \
                width=80 label="$(printf "%02d" $((i))) MINs" icon="󰍹 " align=center
            sleep 60
        else
            exit
        fi
    done

sketchybar --set take_a_break padding_left=5 padding_right=5 \
    background.corner_radius=10 background.height=23 background.border_width=0 \
    background.clip=0 \
    background.border_color=0x00fb7602 background.color=0xfff5b042 background.clip=0 \
    width=80  label="BREAK" align=center\
    icon.color=0xff0000FF label.color=0xff0000FF icon=" "

) &
