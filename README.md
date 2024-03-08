## The Config

This file is for all things related to barrettjflowers's
MacOS config.

Could be useful when migrating to a new mac, finding where
config files are, or just recalling what programs
and scripts I commonly used.

### Keyboard

I use Hammerspoon with a program called vimspoon to give
vim-like operations to my whole mac client.

[See Here](https://github.com/dbalatero/VimMode.spoon)
See my .hammerspoon file for special configurations.

Logi Options Plus is also needed to switch between computers
and use special functions like: double tap function to toggle
between function keys and control.

### Utilties

Magnet: A window manager.
Modifier: option
Snap Left: option + h
Snap Right: option + l
Snap Left 2/3: option + j
Snap Right 2/3: option + k

BetterDisplay: Used to control functions of external displays.

Clippy: A clipboard manager.
History bind: c-v

Hammerspoon: Lightweight key remapping program, uses lua!

### CLI

mcli: A general purposed cli for controlling mac os functions.
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

Hiding apps shows greyed out in dock.
`defaults write com.apple.Dock showhidden -boolean yes; killall Dock`

Small space separator between open apps and pinned apps.
`''defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock''`