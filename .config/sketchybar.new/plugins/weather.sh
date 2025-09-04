#!/bin/bash
# Leave blank to get weather for your current location
CITY=""
TEMP="􂬮 $(curl -s -H "User-Agent: curl" "wttr.in/${CITY}?format=3&u" \
  | awk '{print $NF}' \
  | sed -e 's/^+//' -e 's/°F//g')"
echo $TEMP
sketchybar --set weather label="$TEMP"
