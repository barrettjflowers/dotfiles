#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Time Sheet
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName time-sheet

# Documentation:
# @raycast.description Format the date for time sheet.

DATE=$(date +"%a %b %d %Y")
echo "$DATE Time Sheet" | pbcopy


