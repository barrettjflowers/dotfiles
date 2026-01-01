#!/bin/bash
CLIPFILE="$HOME/.clipboard_history"
last_hash=""

while true; do
  current="$(pbpaste)"
  [ -z "$current" ] && sleep 1 && continue

  hash="$(printf "%s" "$current" | shasum | cut -d' ' -f1)"

  if [ "$hash" != "$last_hash" ]; then
    printf "%s\n" "$current" >> "$CLIPFILE"
    last_hash="$hash"
  fi

  sleep 1
done

