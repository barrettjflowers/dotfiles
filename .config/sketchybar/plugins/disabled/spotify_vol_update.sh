#!/bin/bash

if [[ -n "$PERCENTAGE" ]]; then
  osascript -e "tell application \"Spotify\" to set sound volume to $PERCENTAGE"
else
  VOL=$(osascript -e 'tell application "Spotify" to sound volume')
  sketchybar --animate 10 --set spotify_vol_slider slider.percentage=$VOL
fi


