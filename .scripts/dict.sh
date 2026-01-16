#!/bin/bash

fzf --preview 'dict {}' --color=bw --no-border --reverse < /usr/share/dict/words | while read word; do dict "$word" | less; done

