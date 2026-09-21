#!/bin/bash
ITEM=take_a_break
DIR="${TMPDIR:-/tmp}"
PIDFILE="$DIR/take_a_break.pid"
LOCKDIR="$DIR/take_a_break.lock"

countdown() {
    sketchybar --set "$ITEM" \
        background.corner_radius=10 background.height=23 background.border_width=1 \
        background.border_color=0x00000000 background.color=0x00000000 background.clip=0 \
        icon.color=0xfff5b042 label.color=0xfff5b042 \
        width=80 label="$(printf "%02d" "$1") MINs" icon="󰍹 " align=center
}

break_state() {
    sketchybar --set "$ITEM" \
        background.corner_radius=10 background.height=23 background.border_width=0 \
        background.border_color=0x00fb7602 background.color=0xfff5b042 background.clip=0 \
        width=80 label="BREAK" align=center \
        icon.color=0xff0000FF label.color=0xff0000FF icon=" "
}

flash() {
    sketchybar --animate sin 25 --set "$ITEM" \
        background.color=0x33f5b042 background.color=0xfff5b042 \
        icon.color=0x550000FF icon.color=0xff0000FF \
        label.color=0x550000FF label.color=0xff0000FF
}

nap() { sleep "$1" & wait $!; }

# 1. Serialise invocations (mkdir is atomic); steal lock if stale after 5 s
acquired=0
for _ in {1..50}; do
    if mkdir "$LOCKDIR" 2>/dev/null; then acquired=1; break; fi
    sleep 0.1
done
if [ "$acquired" -eq 0 ]; then
    rm -rf "$LOCKDIR"; mkdir "$LOCKDIR" || exit 1
fi
trap 'rmdir "$LOCKDIR" 2>/dev/null' EXIT

# 2. Stop the old timer only if it's really ours (PID + start time match)
if [ -f "$PIDFILE" ]; then
    { read -r OLD; read -r OLD_START; } < "$PIDFILE"
    if [ -n "$OLD" ] && [ "$(ps -o lstart= -p "$OLD" 2>/dev/null)" = "$OLD_START" ]; then
        kill "$OLD" 2>/dev/null
        # 3. Wait until it is actually gone (max 2 s), then force
        for _ in {1..40}; do
            kill -0 "$OLD" 2>/dev/null || break
            sleep 0.05
        done
        kill -0 "$OLD" 2>/dev/null && kill -9 "$OLD" 2>/dev/null
    fi
fi

# 4. Start the new timer
(
    trap - EXIT
    trap 'kill $(jobs -p) 2>/dev/null; exit 0' TERM INT

    countdown 20
    nap 1
    countdown 20        # redraw: overrides any animation still queued in sketchybar
    nap 59

    for i in {19..1}; do
        countdown "$i"
        nap 60
    done

    break_state
    while true; do
        flash
        nap 1
    done
) &
NEW=$!

# 5. Record PID + start time atomically, still under the lock
printf '%s\n%s\n' "$NEW" "$(ps -o lstart= -p "$NEW")" > "$PIDFILE.tmp" && mv "$PIDFILE.tmp" "$PIDFILE"
