#!/bin/bash
#seconds
DATE=$(date +"%a %-d %b %-l:%M:%S")

sketchybar --set $NAME label="$DATE" \
icon.color=0xFF000000
