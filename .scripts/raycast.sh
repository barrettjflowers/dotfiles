#!/bin/bash

items=$(
  cat <<'EOF'
Shutdown	raycast://extensions/raycast/system/shut-down
Restart	raycast://extensions/raycast/system/restart
Toggle Bluetooth	raycast://extensions/raycast/system/toggle-bluetooth
Eject All Disks	raycast://extensions/raycast/system/eject-all-disks
Empty Trash	raycast://extensions/raycast/system/empty-trash
Toggle Appearance	raycast://extensions/raycast/system/toggle-system-appearance

EOF
)

selection=$(printf '%s\n' "$items" \
  | fzf --prompt="System > " --with-nth=1 --delimiter=$'\t') || exit 0

open "${selection#*$'\t'}"

