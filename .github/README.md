## The Config

This file is for all things related to barrettjflowers's
MacOS config.

Useful when migrating to a new mac, finding where
config files are, or just recalling what programs
and scripts I commonly used.

### Keyboard

I use Hammerspoon with a program called vimspoon to give
vim-like operations to my whole mac client.
Visit [https://github.com/dbalatero/VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) for installation instructions. \
See `.hammerspoon` file for special configurations.

### Utilties

**Homebrew** \
Ofcourse! Would this be a dotfiles repo without it? \
A package manager for MacOS. \
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

**Magnet** \
A window manager.

Modifier key: option \
Snap Left: option + h \
Snap Right: option + l \
Snap Left 2/3: option + j \
Snap Right 2/3: option + k \
[https://magnet.crowdcafe.com/](https://magnet.crowdcafe.com/)

**Monitor Control** \
Used to control brightness of displays. \
`brew install --cask MonitorControl`

**Proxy Audio Device** \
Routes all audio through a virtual audio device. \
Useful for external displays, or audio interfaces. \
`brew install --cask proxy-audio-device`

**Clipy** \
A clipboard manager. \
History bind: c-v \
`brew install --cask clipy`

**Scroll Reverser**
Maintains natural scrolling on trackpad without affecting mouse. \
`brew install --cask scroll-reverser`

**Hammerspoon** \
A lightweight key remapping program, uses lua! \
`brew install --cask hammerspoon`

### CLI

mcli: A general purposed cli for controlling MacOS functions.
`brew install m-cli`

fzf: Fuzzy finder!

See my `.zshrc` file for terminal configuration and aliases.

### System Preferences

Appearance > Sidebar icon size: medium

Desktop & Dock > Magnification: Off
Position on scrfeen: Left
Minimize window sinto application icon: On
Automatucally hide and show the Dock: On
Show suggested and recent apps in Dock: Off
Click wallpaper to revel desktop: Only in State Manager

Keyboard > Launchpad & Dock > Turn Dock hiding on/off: Command + Esc
Keyboard > Misson Control > Misson Control: Control + k
Application Windows: Control + j
Quick Note: Control + Q

Keyboard > Screenshots > Save picture of selected area as file: Shift + Command + S
Screenshot recording options: Option + Command + S

### The Dock

Hiding apps shows greyed out in dock. \
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock`

Small space separator between open apps and pinned apps. \
`''defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock''`
