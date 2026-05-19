## The Config
Unix config. Useful when migrating to a new system, locating config files,
or recalling programs and scripts. (SIP enabled)
See `.gitignore` to add files. This repo is initialized in my home directory.

![Screenshot 2026-02-03 at 9 56 43 AM](https://github.com/user-attachments/assets/8229ab4e-01d0-4cd7-9d4e-3277ebf82acb)

Keyboard
---
Vimspoon gives vim operations to my whole unix desktop.
Visit [dbalatero/VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) for package instructions. \
See `.hammerspoon` for keybinds, scripting, and sketchybar integration.

![Screenshot 2026-02-02 at 4 29 40 PM](https://github.com/user-attachments/assets/0f6d94dc-e6c1-4c12-a5c9-ff686251f9d5)

Launcher
---
Alfred.
`Command + Space` to open. \
See `.config/alfred` for additional preferences.

Brew
---
For a full list currently installed see `.config/macos/brew` \
[https://docs.brew.sh/](https://docs.brew.sh/)

**Proxy Audio Device** \
Routes all audio through a virtual audio device. \
Useful for external displays, or audio interfaces. \
`brew install --cask proxy-audio-device`

**Scroll Reverser** \
Maintains natural scrolling on trackpad without affecting mouse. \
`brew install --cask scroll-reverser`

**Hammerspoon** \
A lightweight key remapping program, uses lua! See `.config/hammerspoon` \
`brew install --cask hammerspoon`

**sketchybar** \
Waybar clone for macos. \
`brew install sketchybar`

**jankyborders** \
Windows borders on MacOS. See `.config/borders` \
`brew install jankyborders`

**yabai** \
Tiling window manager. \
`brew install yabai`

**InstantSpaceSwitcher** \
Disables the macos crossfade or wipe transition. \
`brew install --cask jurplel/tap/instant-space-switcher` 

**betterpwa**
Create swift native web apps to build your own custom clients. \
[barrettjflowers/betterpwa](https://github.com/barrettjflowers/betterpwa)

MacOS Specific
---
See `.config/macos`.

**System Preferences** \
See preferences script `.config/pref` \
All preferences are dumped to `.config/settings`

**Dock** \
Disabled the dock entirely \
`defaults write com.apple.dock autohide -bool true && killall Dock`
`defaults write com.apple.dock autohide-delay -float 1000 && killall Dock`
`defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock`

**Menubar** \
Disabled the native menubar entirely in lieu of sketchybar \
`yabai -m config menubar_opacity 0.0`
