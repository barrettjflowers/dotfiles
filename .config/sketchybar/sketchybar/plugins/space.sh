#!/bin/bash

if [[ "$SELECTED" == "true" ]]; then
  sketchybar --set "$NAME" \
    icon.color=0xFF000000 \
    background.color=0xFFFFFFFF
else
  sketchybar --set "$NAME" \
    icon.color=0xAAFFFFFF \
    background.color=0xff3C3E4F
fi
