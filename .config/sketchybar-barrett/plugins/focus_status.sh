#!/bin/bash

FOCUS_STATUS=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes" 2>/dev/null)

if [ "$FOCUS_STATUS" = "1" ]; then
    echo "Focus mode is enabled."
    sketchybar --animate sin 10 --set focus icon="$ICON" label="􀆼"
else
    echo "Focus mode is disabled."
    sketchybar  --animate sin 10 --set focus icon="$ICON" label=""
fi
