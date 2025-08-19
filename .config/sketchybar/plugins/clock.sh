#!/bin/bash

DATE=$(date "+%I:%M")

sketchybar --set $NAME label="$DATE" \
icon.color=0xFF000000
