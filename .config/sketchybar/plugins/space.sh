#!/bin/bash
source "$HOME/.config/colors/colors.sh"

if [[ "$SELECTED" == "true" ]]; then
  sketchybar --set "$NAME" \
	icon.color=0xFF000000 \
  background.color=$ACCENT_SECONDARY
else
  sketchybar --set "$NAME" \
  label.color=$TEXT \
  icon.color=$TEXT \
  background.drawing=off
fi
