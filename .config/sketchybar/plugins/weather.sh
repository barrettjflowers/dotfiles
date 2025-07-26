#!/bin/bash
CITY="Dublin"
TEMP="􀦜 "$(curl -s -H "User-Agent: curl" "wttr.in/${CITY}?format=3&u" | awk '{print $NF}' | sed 's/^+//') 
echo $TEMP
sketchybar --set weather label="DUB $TEMP"
