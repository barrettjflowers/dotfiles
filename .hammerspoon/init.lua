hs.loadSpoon("SpoonInstall")

-- macos kb backlight toggle
local backlight = false
hs.hotkey.bind({'control', 'shift'}, 'b', function()
    if backlight then
        hs.execute('mac-brightnessctl 00.0')
        backlight = false
    else
        hs.execute('mac-brightnessctl 0.10')
        backlight = true
    end
end)

-- native macos menubar toggle
local menubar = false
hs.hotkey.bind({'control'}, 'm', function()
    if menubar then
        hs.execute('yabai -m config menubar_opacity 1.0')
        menubar = false
    else
        hs.execute('yabai -m config menubar_opacity 0.0')
        menubar = true
    end
end)

-- ==============================
--  Yabai
-- ==============================
local alt = { "alt" }
local yabai = "/opt/homebrew/bin/yabai"

local function y(args)
    hs.task.new(yabai, nil, args):start()
end

-- --------------------------------
-- ⌥ + H → focus previous window
-- ⌥ + L → focus next window
-- --------------------------------
hs.hotkey.bind(alt, "H", function()
    y({ "-m", "window", "--focus", "prev" })
end)

hs.hotkey.bind(alt, "L", function()
    y({ "-m", "window", "--focus", "next" })
end)

-- --------------------------------
-- ⌥ + K → fullscreen
-- --------------------------------
hs.hotkey.bind(alt, "K", function()
    y({ "-m", "window", "--toggle", "zoom-fullscreen" })
end)

-- --------------------------------
-- ⌥ + H → resize left
-- ⌥ + L → resize right
-- --------------------------------
hs.hotkey.bind({ "alt", "shift" }, "h", function()
    y({ "-m", "window", "--resize", "left:-80:0" })
end)

hs.hotkey.bind({ "alt", "shift" }, "l", function()
    y({ "-m", "window", "--resize", "right:80:0" })
end)

hs.hotkey.bind({ "alt", "shift" }, "k", function()
    y({ "-m", "window", "--resize", "top:0:-80" })
end)

hs.hotkey.bind({ "alt", "shift" }, "j", function()
    y({ "-m", "window", "--resize", "bottom:0:80" })
end)

-- --------------------------------
-- ⌥ + O → float
-- --------------------------------
hs.hotkey.bind(alt, "O", function()
    y({ "-m", "window", "--toggle", "float" })
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

--fallback mode
vim:useFallbackMode('Brave Browser')

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
