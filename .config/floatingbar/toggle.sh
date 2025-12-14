#!/usr/bin/env sh

open() {
  floatingbar --animate cubic 20 --bar y_offset=350 color=0x80343430
}

close() {
  floatingbar --animate cubic 20 --bar y_offset=600 color=0x00343430
}

# allows:
#   toggle.sh open
#   toggle.sh close
"$@"

