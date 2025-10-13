#!/bin/bash

DATE=$(date +"%a %-d %b %-l:%M")

sketchybar --set $NAME label="$DATE" \
icon.color=0xFF000000
