hs.loadSpoon("SpoonInstall")
hs.ipc.cliInstall()

local brightnessctl = "/opt/homebrew/bin/mac-brightnessctl"
local yabai = "/opt/homebrew/bin/yabai"

-- macos kb backlight toggle
local backlight = false
hs.hotkey.bind({'control', 'shift'}, 'b', function()
    if backlight then
        hs.task.new(brightnessctl, nil, {"0.0"}):start()
        backlight = false
    else
        hs.task.new(brightnessctl, nil, {"0.10"}):start()
        backlight = true
    end
end)

-- native macos menubar toggle
local menubar = false
hs.hotkey.bind({'control'}, 'm', function()
    if menubar then
        hs.task.new(yabai, nil, {"-m", "config", "menubar_opacity", "1.0"}):start()
        menubar = false
    else
        hs.task.new(yabai, nil, {"-m", "config", "menubar_opacity", "0.0"}):start()
        menubar = true
    end
end)

-- distractions (Cmd+Opt+F5 = Do Not Disturb)
--hs.hotkey.bind({"ctrl", "shift"}, "d", function()
--    hs.execute("/Users/barrettjflowers/.scripts/distractions.sh")
--end)

-- ==============================
--  yabai
-- ==============================
local alt = { "alt" }

local function y(args)
    hs.task.new(yabai, nil, args):start()
end

-- --------------------------------
-- ⌥ + h → focus previous window
-- ⌥ + l → focus next window
-- --------------------------------
hs.hotkey.bind(alt, "H", function()
    y({ "-m", "window", "--focus", "prev" })
end)

hs.hotkey.bind(alt, "L", function()
    y({ "-m", "window", "--focus", "next" })
end)

-- --------------------------------
-- ⌥ + k → fullscreen
-- --------------------------------
hs.hotkey.bind(alt, "K", function()
    y({ "-m", "window", "--toggle", "zoom-fullscreen" })
end)

-- --------------------------------
-- ⌥ + shift + h → resize left
-- ⌥ + shift + l → resize right
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
-- ⌥ + o → float
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
  :disableForApp('System Settings')

--fallback mode
vim:useFallbackMode('Vivaldi')

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
-------------------------------

-- ==============================
--  Spaces (InstantSpaceSwitcher)
-- ==============================
local issc = "/Applications/InstantSpaceSwitcher.app/Contents/MacOS/ISSCli"

local ctrlKeys = {[18]=1, [19]=2, [20]=3, [21]=4, [23]=5, [22]=6}
hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(e)
    local mods = e:getFlags()
    if mods.ctrl and not mods.alt and not mods.cmd and not mods.shift then
        local idx = ctrlKeys[e:getKeyCode()]
        if idx then
            hs.execute(issc .. " index " .. idx)
            return true
        end
    end
    return false
end):start()
