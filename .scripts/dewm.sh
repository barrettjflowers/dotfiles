#!/bin/bash

INPUT="$1"

restart() {
  m lock
  sleep 0.3

  killall SystemUIServer &
  killall Finder &
  killall Dock &

  brew services restart sketchybar &
  brew services restart borders &
  yabai --restart-service &
}

if [ "$INPUT" = "restart" ]; then
  restart
else
  echo "Usage: $0 restart"
  exit 1
fi

