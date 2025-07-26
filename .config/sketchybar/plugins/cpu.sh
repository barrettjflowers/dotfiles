#!/bin/bash
CPU=$(top -l 1 | grep "CPU usage" | awk -F'user' '{print $1}' | awk '{print $3}')  # e.g. 5.27% user
MEM=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
MEM_USED_MB=$((MEM * 4096 / 1024 / 1024))  # Convert pages to MB approx

sketchybar --set cpu label="􀟫 $CPU" \
  icon.color=0xFFFFFFFF \
  label.color=0xFFFFFFFF \
