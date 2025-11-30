#!/bin/bash
source "$HOME/.config/colors/colors.sh"

CPU=$(top -l 1 | grep "CPU usage" | awk -F'user' '{print $1}' | awk '{printf "%.0f", $3}')
MEM=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
MEM_USED_MB=$((MEM * 4096 / 1024 / 1024))  # Convert pages to MB approx

sketchybar --animate sin 20 --set notch_right label="􂯞 $CPU" \
  icon.color=$TEXT \
  label.color=$TEXT
