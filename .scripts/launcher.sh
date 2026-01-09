#!/bin/bash

# run the service for my custom kitty launcher
nohup /Applications/launcher.app/Contents/MacOS/launcher --config ~/.config/kitty/launcher.conf >/dev/null 2>&1 &

