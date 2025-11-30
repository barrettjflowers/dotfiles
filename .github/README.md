## The Config
Unix config. Useful when migrating to a new mac, locating config files,
or recalling programs and scripts.

See `.gitignore` to add files. This repo is initialized in my home directory.

### Keyboard
I use Hammerspoon with a program called vimspoon to give vim-like operations to my whole unix desktop.
Visit [https://github.com/dbalatero/VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) for installation instructions. \
See `.hammerspoon` file for special configurations.

### Casks
**Amythest** \
A window manager.
`brew install --cask amethyst`

**Monitor Control** \
Used to control brightness of external displays. \
`brew install --cask MonitorControl`

**Proxy Audio Device** \
Routes all audio through a virtual audio device. \
Useful for external displays, or audio interfaces. \
`brew install --cask proxy-audio-device`

**Raycast** \
Supercharged spotlight search \
Clipboard history bind: c-v \
`brew install --cask raycast`

**Scroll Reverser**
Maintains natural scrolling on trackpad without affecting mouse. \
`brew install --cask scroll-reverser`

**Hammerspoon** \
A lightweight key remapping program, uses lua! \
`brew install --cask hammerspoon`

### CLI
See `.zshrc`and `alacritty.toml`.

**mcli** \
A general purposed cli for controlling MacOS functions. \
`brew install m-cli`

**fzf** \
Fuzzy finder! \
`brew install fzf`

**tmux** \
Terminal multiplexer. \
`brew install tmux`\
_See_ `.tmux.conf` \

**ranger** \
CLI file browser equiped with vim motions. \
`brew install ranger`

### System Preferences
Appearance > Sidebar icon size: `Medium`

Keyboard > Misson Control > Misson Control: `Control + K` \
Show Desktop: `Control + J`

Keyboard > Screenshots > Save picture: `Shift + Command + S` \
Screenshot recording options: `Option + Command + S`

### The Dock
Hiding apps shows greyed out in dock. \
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock`

Small space separator between open apps and pinned apps. \
`''defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock''`

Slow down the dock animation to prevent accidental triggers. \
`defaults write com.apple.dock autohide-time-modifier -float 1.12; killall Dock`
