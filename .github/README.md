## The Config
Unix config. Useful when migrating to a new system, locating config files,
or recalling programs and scripts.
See `.gitignore` to add files. This repo is initialized in my home directory.

![Screenshot 2026-02-03 at 9 56 43 AM](https://github.com/user-attachments/assets/8229ab4e-01d0-4cd7-9d4e-3277ebf82acb)

### Keyboard
Vimspoon gives vim operations to my whole unix desktop.
Visit [https://github.com/dbalatero/VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) for installation instructions. \
See `.hammerspoon` file for special configurations and sketchybar integration.

![Screenshot 2026-02-02 at 4 29 40 PM](https://github.com/user-attachments/assets/0f6d94dc-e6c1-4c12-a5c9-ff686251f9d5)

### Launcher
Second instance of kitty entitled `launcher`. \
<Ctrl> + <Space> to open launcher. \
See `.config/kitty` for additional key bindings. \
See `/.scripts` for launcher trigger scripts.

### Brew Casks
**Amythest** \
A window manager.
`brew install --cask amethyst`

**Proxy Audio Device** \
Routes all audio through a virtual audio device. \
Useful for external displays, or audio interfaces. \
`brew install --cask proxy-audio-device`

**Raycast** \
Supercharged spotlight search \
`brew install --cask raycast`

**Scroll Reverser** \
Maintains natural scrolling on trackpad without affecting mouse. \
`brew install --cask scroll-reverser`

**Hammerspoon** \
A lightweight key remapping program, uses lua! See `.config/hammerspoon` \
`brew install --cask hammerspoon`

### Formulae
See `.zshrc`and `kittyrc`.

**sketchybar** \
Waybar clone for macos.
`brew install sketchybar`

**jankyborders** \
Windows borders on MacOS. See `.config/borders` \
`brew install jankyborders`

**yabai** \
Tiling window manager. \
`brew install yabai`

### MacOS Specific
**System Preferences** \
Appearance > Sidebar icon size: `Small` \
Keyboard > Misson Control > Misson Control: `Control + K` \
Show Desktop: `Control + J` \
Keyboard > Screenshots > Save picture: `Shift + Command + S`  \
Screenshot recording options: `Option + Command + S` 

**Dock** \
Hiding apps shows greyed out in dock. \
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock`

Small space separator between open apps and pinned apps. \
`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock` 

Slow down the dock animation to prevent accidental triggers. \
`defaults write com.apple.dock autohide-time-modifier -float 1.12; killall Dock`  

Allow window dragging from anywhere with command + control. \
`defaults write -g NSWindowShouldDragOnGesture -bool true`

### Todo
- [x] Move remaining trigger scripts from raycast to hammerspoon. (Goal is to completely get rid of raycast dependancy)
- [ ] Move amythest config to yabai.
- [ ] Fix launcher autohide on unfocus.
- [x] Cleanup or remove hammerspoon UI.
