## The Config
Unix config. Useful when migrating to a new system, locating config files,
or recalling programs and scripts.
See `.gitignore` to add files. This repo is initialized in my home directory.

![Screenshot 2026-01-16 at 3 42 36 PM](https://github.com/user-attachments/assets/4df1f96f-fc92-4afc-8668-ef614ab0537e)

### Keyboard
I use Hammerspoon with a program called vimspoon to give vim-like operations to my whole unix desktop.
Visit [https://github.com/dbalatero/VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) for installation instructions. \
See `.hammerspoon` file for special configurations.

### Casks
**Amythest** \
A window manager.
`brew install --cask amethyst`

**Proxy Audio Device** \
Routes all audio through a virtual audio device. \
Useful for external displays, or audio interfaces. \
`brew install --cask proxy-audio-device`

**Raycast** \
Supercharged spotlight search \
Clipboard history bind: c-v \
`brew install --cask raycast`

**Scroll Reverser** \
Maintains natural scrolling on trackpad without affecting mouse. \
`brew install --cask scroll-reverser`

**Hammerspoon** \
A lightweight key remapping program, uses lua! See `.config/hammerspoon` \
`brew install --cask hammerspoon`

### Formulae
See `.zshrc`and `kittyrc`.

**mcli** \
A general purposed cli for controlling MacOS functions. \
`brew install m-cli`

**jankyborders** \
Windows borders on MacOS. See `.config/borders` \
`brew install jankyborders`

**yabai** \
Tiling window manager. \
`brew install yabai`

### MacOS Specific
**System Preferences** \
Appearance > Sidebar icon size: `Medium` \
Keyboard > Misson Control > Misson Control: `Control + K` \
Show Desktop: `Control + J` \
Keyboard > Screenshots > Save picture: `Shift + Command + S`  \
Screenshot recording options: `Option + Command + S` 

Hiding apps shows greyed out in dock. \
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock` \
Small space separator between open apps and pinned apps. \
`''defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock''`  \
Slow down the dock animation to prevent accidental triggers. \
`defaults write com.apple.dock autohide-time-modifier -float 1.12; killall Dock`   \
Allow window dragging from anywhere with command + control.
`defaults write -g NSWindowShouldDragOnGesture -bool true`

### Todo
- [ ] Move remaining trigger scripts from raycast to hammerspoon. (Goal is to completely get rid of raycast dependancy)
- [ ] Move amythest config to yabai.
- [ ] Cleanup or remove hammerspoon UI.
