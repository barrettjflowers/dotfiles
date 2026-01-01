#!/bin/bash

while true; do
  app=$(ls /Applications /System/Applications \
    | grep '\.app$' \
    | fzf --layout=reverse --no-preview --no-border --color=bw \
  ) || exit

  osascript -e '
    tell application "System Events"
      tell process "launcher"
        keystroke "h" using {command down}
      end tell
    end tell
  '

  open -a "$app"
done

