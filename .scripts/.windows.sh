#!/bin/bash

cd /Applications
ls | grep .app | fzf --height 20 --no-preview | xargs -I {} open -a "{}"