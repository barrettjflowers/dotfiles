#!/bin/bash

DATE=$(date +"%-m.%-d.%y │ %-l:%M")

sketchybar --set $NAME label="$DATE" \
icon.color=0xFF000000
