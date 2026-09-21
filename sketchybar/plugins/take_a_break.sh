#!/bin/bash
PIDFILE="${TMPDIR:-/tmp}/take_a_break.pid"

# Kill the previous timer and its child processes (e.g. sleep)
if [ -f "$PIDFILE" ]; then
    OLD=$(cat "$PIDFILE")
    pkill -P "$OLD" 2>/dev/null
    kill "$OLD" 2>/dev/null
fi

(
for i in {20..1}; do
    sketchybar --set take_a_break \
        background.corner_radius=10 background.height=23 background.border_width=1 \
        background.border_color=0x00000000 background.color=0x00000000 background.clip=0 \
        icon.color=0xfff5b042 label.color=0xfff5b042 \
        width=80 label="$(printf "%02d" "$i") MINs" icon="󰍹 " align=center
    sleep 60
done

sketchybar --set take_a_break \
    background.corner_radius=10 background.height=23 background.border_width=0 \
    background.border_color=0x00fb7602 background.color=0xfff5b042 background.clip=0 \
    width=80 label="BREAK" align=center \
    icon.color=0xff0000FF label.color=0xff0000FF icon=" "

while true; do
    sketchybar --animate sin 25 --set take_a_break \
        background.color=0x33f5b042 background.color=0xfff5b042 \
        icon.color=0x550000FF icon.color=0xff0000FF \
        label.color=0x550000FF label.color=0xff0000FF
    sleep 1
done
) &
echo $! > "$PIDFILE"
