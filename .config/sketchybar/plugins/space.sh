#!/bin/bash

if [[ "$SELECTED" == "true" ]]; then
  sketchybar --set "$NAME" \
	icon.color=0xFF000000 \
    background.color=0xFFFFFFFF
else
  sketchybar --set "$NAME" \
   label.color=0xAAFFFFFF \
   icon.color=0xAAFFFFFF \
   background.drawing=off
fi
