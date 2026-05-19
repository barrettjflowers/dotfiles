#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

INFO=$(media-control get --no-artwork 2>/dev/null)
TITLE=$(echo "$INFO" | jq -r '.title // empty')
ARTIST=$(echo "$INFO" | jq -r '.artist // empty')

if [ -z "$TITLE" ]; then
  sketchybar --set media label="" icon.drawing=off
else
  sketchybar --set media label="$TITLE - $ARTIST" icon.drawing=on
fi
