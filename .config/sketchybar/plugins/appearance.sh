#!/bin/bash
# Description: Open Control Center on macOS using AppleScript
osascript -e 'tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell'

MODE=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')

if [ "$MODE" = "true" ]; then
  sketchybar --set appearance label="􀡎"
else
  sketchybar --set appearance label="􀆮"
fi
