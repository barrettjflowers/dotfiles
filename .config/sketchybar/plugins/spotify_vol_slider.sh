#!/bin/bash

	sketchybar --animate sin 10 --set notch_left drawing=off
	wait 0.2

sketchybar --add slider spotify_vol_slider q 100 \
  --animate sin 10 \
  --set spotify_vol_slider script='~/.config/sketchybar/plugins/spotify_vol_update.sh' \
                           slider.highlight_color=0xff1DB954 \
                           slider.knob="●" \
                           background.color=0x90222726 \
                           drawing=on \
                           updates=on

sketchybar --subscribe spotify_vol_slider mouse.clicked

sleep 4
sketchybar --animate sin 10 --set spotify_vol_slider drawing=off
sketchybar --animate sin 10 --set notch_left drawing=on

