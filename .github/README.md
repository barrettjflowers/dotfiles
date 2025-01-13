## The Config
This repo is for all things related to barrettjflowers's
MacOS config. Useful when migrating to a new mac, finding where config files are,
or just recalling what programs and scripts I commonly use.

See `.gitignore` to add files. This repo is initialized in my home directory.

### Keyboard
I use Hammerspoon with a program called vimspoon to give vim-like operations to my whole mac client.
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
See 'ALIASES' section in the `.zshrc` file for terminal configuration and aliases.

**mcli** \
A general purposed cli for controlling MacOS functions. \
`brew install m-cli`

**fzf** \
Fuzzy finder! \
`brew install fzf`

**sherlock** \
Hunt down social media accounts by username across social networks. \
`brew install sherlock`

**tmux** \
Terminal multiplexer. \
`brew install tmux`\
_See_ `.tmux.conf` \

**ranger** \
CLI file browser equiped with vim motions. \
`brew install ranger`

### System Preferences
Appearance > Sidebar icon size: `Medium`

Desktop & Dock > Magnification: `Off` \
Position on screen: `Left` \
Minimize windows into application icon: `On` \
Automatically hide and show the Dock: `On` \
Show suggested and recent apps in Dock: `Off` \
Click wallpaper to reveal desktop: `Only in Stage Manager`

Keyboard > Launchpad & Dock > Turn Dock hiding on/off: `Command + Esc` \
Keyboard > Misson Control > Misson Control: `Control + K` \
Application Windows: `Control + J`

Keyboard > Screenshots > Save picture: `Shift + Command + S` \
Screenshot recording options: `Option + Command + S`

### The Dock
Hiding apps shows greyed out in dock. \
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock`

Small space separator between open apps and pinned apps. \
`''defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock''`
