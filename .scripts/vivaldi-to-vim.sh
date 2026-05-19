#!/bin/bash

# Get URL directly from Vivaldi (no clipboard, no key events)
URL=$(osascript <<EOF
tell application "Vivaldi"
    return URL of active tab of front window
end tell
EOF
)

# trim whitespace
URL=$(echo "$URL" | tr -d '\n')

if [ -z "$URL" ]; then
  echo "No URL found"
  exit 1
fi

# launch kitty and pipe into vim
/Applications/kitty.app/Contents/MacOS/kitty \
  sh -c "curl -L \"$URL\" | vim -"
