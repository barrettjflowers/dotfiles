hs.loadSpoon("SpoonInstall")
hs.application.enableSpotlightForNameSearches(true)

-- hide our custom launcher if its unfocused
local appName = "launcher"
local watcher

local function startWatcher()
  if watcher then watcher:stop() end

  watcher = hs.application.watcher.new(function(name, event)
    if name == appName and event == hs.application.watcher.deactivated then
      local app = hs.application.get(appName)
      if app then app:hide() end
    end
  end)

  watcher:start()
end

startWatcher()
hs.timer.doEvery(60, startWatcher)

-- keybinds
hs.hotkey.bind({'control'}, 'space', function()
  local app = hs.application.get(appName)
  if app and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(appName)
  end
end)

hs.hotkey.bind({'control', 'shift'}, 'c', function()
    hs.execute('open "raycast://confetti"')
end)

hs.hotkey.bind({'control', 'shift'}, 'r', function()
    hs.execute('open "raycast://"')
end)

hs.hotkey.bind({'control'}, 'm', function()
    hs.execute('open "raycast://extensions/raycast/navigation/search-menu-items"')
end)

hs.hotkey.bind({'control', 'shift'}, 's', function()
    hs.execute('open -g "raycast://extensions/raycast/screenshots/paste-recent-screenshot"')
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
