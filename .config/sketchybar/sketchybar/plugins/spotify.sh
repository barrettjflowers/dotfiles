#!/bin/bash
SONG_TEXT=$(osascript -e 'tell application "Spotify" to if it is running and player state is playing then name of current track & " — " & artist of current track')
if [ -n "$SONG_TEXT" ]; then
  if [ ${#SONG_TEXT} -gt 25 ]; then
    SONG_TEXT="${SONG_TEXT:0:25}..."
  fi
  SONG="$SONG_TEXT"
else
  SONG="No music playing"
  sketchybar --set spotify \
	  label.padding_left=0 \
	  label.padding_right=8
fi

echo "$SONG"
sketchybar --animate sin 20 --set spotify label="$SONG" \
  icon.color=0xFFFFFFFF \
  label.color=0xFFFFFFFF

