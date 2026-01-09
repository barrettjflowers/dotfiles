#!/bin/bash

sel=$(cat ~/.clipboard_history | fzf --tac --no-border --reverse --prompt="clipboard > " --color=bw --no-preview) \
  && printf "%s" "$sel" | pbcopy \
  && nvim +"/$(printf '%s' "$sel" | sed 's/[\/&]/\\&/g')" ~/.clipboard_history

