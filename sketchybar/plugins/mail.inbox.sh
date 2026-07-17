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

if [ "${UNREAD}" -eq 0 ]; then
    sketchybar --set unread drawing=off
else
    sketchybar --set unread label="${UNREAD}" icon=" " \
        label.padding_right=2 icon.padding_left=10\
        click_script="open -a Mail"
fi

if [ "${TOTAL}" -eq 0 ]; then
    sketchybar --set inbox drawing=off
else
    sketchybar --set inbox label="${TOTAL}" icon=" " \
        icon.padding_left=8\
        click_script="open -a Mail"
fi
