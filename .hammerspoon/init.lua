hs.loadSpoon("SpoonInstall")
hs.application.enableSpotlightForNameSearches(true)

-- keybinds
hs.hotkey.bind({'control', 'shift'}, 'c', function()
    hs.execute('open "raycast://confetti"')
end)

hs.hotkey.bind({'control'}, 'm', function()
    hs.execute('open "raycast://extensions/raycast/navigation/search-menu-items"')
end)

--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim
  :disableForApp('zoom.us')
  :disableForApp('Windows App')
  :disableForApp('Obsidian')
  :disableForApp('kitty')
  :disableForApp('launcher')

--fallback mode
vim:useFallbackMode('Safari')

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- set this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("Menlo")

-- Enter normal mode by typing a key sequence
vim:enterWithSequence('jk', 90)
--vim:bindHotKeys({ enter = {{}, 'escape'} })

-- To customize the hot key you want, see the mods and key parameters at:
-- https://www.hammerspoon.org/docs/hs.hotkey.html#bind

--------------------------------
-- END VIM CONFIG
--------------------------------
