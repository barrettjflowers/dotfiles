#!/bin/bash

count=$(osascript -e '
tell application "System Events"
  tell process "NotificationCenter"
    if (count of windows) is 0 then return -1
    set total to 0
    repeat with g in UI elements of window 1
      try
        set total to total + (count of UI elements of g)
      end try
    end repeat
    return total
  end tell
end tell
')

echo "$count"
if [ "$count" = "-1" ]; then
	exit 0
fi

if [ "$count" = "1" ] || [ -z "$count" ]; then
    sketchybar --set notifications label="􀝗" 
    exit 0
fi

echo "$count"
sketchybar --set notifications label="􀝗"

