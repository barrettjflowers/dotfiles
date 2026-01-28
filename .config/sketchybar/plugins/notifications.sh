#!/bin/bash

count=$(osascript -e 'tell application "System Events" to tell process "Dock" to value of attribute "AXStatusLabel" of UI element "Microsoft Teams" of list 1'
)

echo "$count"
if [ "$count" -ge 1 ] 2>/dev/null; then
    sketchybar --set notifications label="􀝗 $count" 
	exit 0
fi
sketchybar --set notifications label="" 
echo "$count"
