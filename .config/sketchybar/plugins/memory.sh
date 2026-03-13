#!/bin/bash
source "$HOME/.config/colors/colors.sh"

MEM_USAGE=$(vm_stat | awk -v ps=$(vm_stat | grep "page size" | awk '{print $8}' | tr -d '.') '
/Pages wired down/ {wired=$4}
/Pages active/ {active=$3}
/Pages speculative/ {spec=$3}
/Pages occupied by compressor/ {comp=$6}
END {printf "%.1f", (wired+active+spec+comp)*ps/1024/1024/1024}')
echo "Used RAM: ${MEM_USAGE} GB"

echo "$SONG"
sketchybar --set mem label="􀫦 $MEM_USAGE" \
  scroll_texts=on \
  label.max_chars=20 \
  icon.color=$TEXT \
  label.color=$TEXT 

