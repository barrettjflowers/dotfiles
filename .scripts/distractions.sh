#!/bin/bash

if brew services list | grep -q "sketchybar.*started"; then
  brew services stop sketchybar
  osascript -e 'tell application "System Events" to key code 96 using {command down, option down}'
	yabai -m config \
    top_padding 18

	yabai --restart-service
  echo "distractions: ON"
else
  brew services start sketchybar
  osascript -e 'tell application "System Events" to key code 96 using {command down, option down}'
	killall yabai
  echo "distractions: OFF"
fi
