#!/bin/bash
STATE="$HOME/.cache/take_a_break"
DURATION=$((20 * 60))
mkdir -p "${STATE%/*}"

start() {  # write the new deadline atomically
    echo $(( $(date +%s) + DURATION )) > "$STATE.tmp" && mv "$STATE.tmp" "$STATE"
}

case "$SENDER" in
    mouse.clicked) start ;;
    system_woke)   start ;;   # optional: counts sleep as a break; delete this line if unwanted
esac

[ -f "$STATE" ] || start
left=$(( $(cat "$STATE") - $(date +%s) ))
[ "$left" -lt -3600 ] && { start; left=$DURATION; }   # overdue by >1h (e.g. after reboot): start fresh

if [ "$left" -gt 0 ]; then
    sketchybar --set "$NAME" update_freq=10 \
        background.corner_radius=10 background.height=23 background.border_width=1 \
        background.border_color=0x00000000 background.color=0x00000000 background.clip=0 \
        icon.color=0xfff5b042 label.color=0xfff5b042 \
        width=80 label="$(printf "%02d" $(( (left + 59) / 60 ))) MINs" icon="󰍹 " align=center
else
    sketchybar --set "$NAME" update_freq=1 \
        background.corner_radius=10 background.height=23 background.border_width=0 \
        background.clip=0 width=80 label="BREAK" icon=" " align=center \
        --animate sin 25 --set "$NAME" \
        background.color=0x33f5b042 background.color=0xfff5b042 \
        icon.color=0x550000FF icon.color=0xff0000FF \
        label.color=0x550000FF label.color=0xff0000FF
fi
