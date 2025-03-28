#!/bin/sh

# CPU Usage (percentage)
CPU_USAGE=$(top -l 1 | grep -E "^CPU" | awk '{print $3 + $5}' | sed 's/%//')
CPU_USAGE=$(printf "%2.0f" "$CPU_USAGE")
# Memory Usage (percentage)
MEM_USAGE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100 - $5}' | sed 's/%//')
MEM_USAGE=$((100 - MEM_USAGE))
MEM_USAGE=$(printf "%2.0f" "$MEM_USAGE")

# Output for SketchyBar
sketchybar --set "$NAME"  \
        icon=" "  label="${CPU_USAGE}%/${MEM_USAGE}%" \
        icon.color=0xffcdd6f4 label.color=0xffcdd6f4 padding_left=5 padding_right=5 \
        background.border_color=0xffcdd6f4 background.color=0x10cdd6f4 \
        background.corner_radius=10 background.height=23 background.border_width=1
