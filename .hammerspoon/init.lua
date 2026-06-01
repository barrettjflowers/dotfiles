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

-- dock toggle (ctrl+d)
local dock_hidden = false
hs.hotkey.bind({'control'}, 'd', function()
    if dock_hidden then
        hs.execute('defaults write com.apple.dock autohide -bool false && defaults write com.apple.dock autohide-delay -float 0 && defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock')
        dock_hidden = false
    else
        hs.execute('defaults write com.apple.dock autohide -bool true && defaults write com.apple.dock autohide-delay -float 1000 && defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock')
        dock_hidden = true
    end
end)

-- ==============================
--  yabai
-- ==============================
local alt = { "alt" }

local function y(args)
    hs.task.new(yabai, nil, args):start()
end
-- --------------------------------
-- ⌥ + 1-6 send window to space
-- --------------------------------
for i = 1, 6 do
    hs.hotkey.bind(alt, tostring(i), function()
        y({ "-m", "window", "--space", tostring(i) })
    end)
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
-- ⌥ + k → yabai zoom-fullscreen
-- --------------------------------
hs.hotkey.bind(alt, "K", function()
    y({ "-m", "window", "--toggle", "zoom-fullscreen" })
end)

-- --------------------------------
-- ⌥ + j → toggle move all windows off-screen (show desktop) via yabai
-- --------------------------------
local show_desktop = false
local saved_frames = {}
local function y_sync(args)
    local cmd = yabai
    for _, v in ipairs(args) do
        cmd = cmd .. " " .. tostring(v)
    end
    os.execute(cmd)
end
hs.hotkey.bind(alt, "j", function()
    if show_desktop then
        for id, pos in pairs(saved_frames) do
            y_sync({ "-m", "window", tostring(id), "--move", "abs:" .. pos.x .. ":" .. pos.y })
            if not pos.floating then
                y_sync({ "-m", "window", tostring(id), "--toggle", "float" })
            end
        end
        saved_frames = {}
        show_desktop = false
    else
        local handle = io.popen(yabai .. " -m query --windows --space")
        local output = handle:read("*a")
        handle:close()
        if output then
            local ok, windows = pcall(hs.json.decode, output)
            if ok then
                for _, w in ipairs(windows) do
                    if not w["is-minimized"] and w["is-visible"] then
                        if w["is-floating"] then
                            saved_frames[w.id] = { x = w.frame.x, y = w.frame.y, floating = true }
                            y_sync({ "-m", "window", tostring(w.id), "--move", "abs:20000:0" })
                        else
                            saved_frames[w.id] = { x = w.frame.x, y = w.frame.y, floating = false }
                            y_sync({ "-m", "window", tostring(w.id), "--toggle", "float" })
                            y_sync({ "-m", "window", tostring(w.id), "--move", "abs:20000:0" })
                        end
                    end
                end
                show_desktop = next(saved_frames) ~= nil
            end
        end
    end
end)

-- --------------------------------
-- ⌥ + f → toggle padding/gaps + sketchybar
-- --------------------------------
local sketchybar = "/opt/homebrew/bin/sketchybar"
local no_padding = false
local pad_defaults = { top = 28, bottom = 16, left = 16, right = 16, gap = 6 }

hs.hotkey.bind(alt, "F", function()
    if no_padding then
        y({ "-m", "space", "--padding", "abs:" .. pad_defaults.top .. ":" .. pad_defaults.bottom .. ":" .. pad_defaults.left .. ":" .. pad_defaults.right })
        y({ "-m", "space", "--gap", "abs:" .. pad_defaults.gap })
        hs.task.new(sketchybar, nil, {"--reload"}):start()
        no_padding = false
    else
        y({ "-m", "space", "--padding", "abs:0:0:0:0" })
        y({ "-m", "space", "--gap", "abs:0" })
        hs.task.new(sketchybar, nil, {"--bar", "y_offset=-100"}):start()
        no_padding = true
    end
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

