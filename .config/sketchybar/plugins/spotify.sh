#!/bin/bash
SONG_TEXT=$(osascript -e 'tell application "Spotify" to if it is running and player state is playing then name of current track & " — " & artist of current track')
if [ -n "$SONG_TEXT" ]; then
  if [ ${#SONG_TEXT} -gt 20 ]; then
    SONG_TEXT="${SONG_TEXT:0:20}..."
  fi
  SONG="􂙩 $SONG_TEXT"
else
  MEM_USAGE=$(vm_stat | awk -v ps=$(vm_stat | grep "page size" | awk '{print $8}' | tr -d '.') '
/Pages wired down/ {wired=$4}
/Pages active/ {active=$3}
/Pages speculative/ {spec=$3}
/Pages occupied by compressor/ {comp=$6}
END {printf "%.1f", (wired+active+spec+comp)*ps/1024/1024/1024}')
echo "Used RAM: ${MEM_USAGE} GB"
  SONG="􀫦 ${MEM_USAGE} GB"
fi

echo "$SONG"
sketchybar --animate sin 20 --set spotify label="$SONG" \
  icon.color=0xFFFFFFFF \
  label.color=0xFFFFFFFF

