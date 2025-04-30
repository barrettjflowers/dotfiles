#!/bin/bash

if [[ "$SELECTED" == "true" ]]; then
  sketchybar --set $NAME \
    icon.color=0x66A8FF60\
    label.color=0x66A8FF60
else
  sketchybar --set $NAME \
    icon.color=0xFFFFFFFF \
    label.color=0xFFFFFFFF
fi
