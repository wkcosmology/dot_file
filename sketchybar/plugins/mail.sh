#!/bin/sh

# Get both counts in one AppleScript call
read -r UNREAD TOTAL <<< $(osascript <<'EOF' | tr ',' ' '
tell application "Mail"
    set unreadCount to count (messages of inbox whose read status is false)
    set totalCount to count messages of inbox
    return unreadCount & " " & totalCount
end tell
EOF
)

sketchybar --set "$NAME" \
    label="${UNREAD}:${TOTAL}"  icon=" " \
    padding_left=5 padding_right=5 \
    background.drawing=on icon.color=0xffcdd6f4 label.color=0xffcdd6f4 \
    background.border_color=0xffcdd6f4 background.color=0x10cdd6f4 \
    background.corner_radius=10 background.height=23 background.border_width=1 \
