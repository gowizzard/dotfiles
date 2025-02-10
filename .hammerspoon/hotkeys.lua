-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
local hyper = {"cmd", "ctrl", "option", "shift"}

hs.hotkey.bind(hyper, "r", function() reloadConfig() end)
hs.hotkey.bind(hyper, "x", function() hs.toggleConsole() end)

hs.hotkey.bind(hyper, "m", function() muteOrUnmute() end)

hs.hotkey.bind(hyper, "return", function() hs.window.focusedWindow():maximize() end)
hs.hotkey.bind(hyper, "left", function() moveWindow("left") end)
hs.hotkey.bind(hyper, "up", function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) end)
hs.hotkey.bind(hyper, "down", function() hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5}) end)
hs.hotkey.bind(hyper, "right", function() moveWindow("right") end)

local caffeinate = hs.hotkey.modal.new(hyper, "c")

caffeinate:bind({}, "escape", function() caffeinate:exit() end)

caffeinate:bind({}, "q", function() hs.caffeinate.shutdownSystem() caffeinate:exit() end)
caffeinate:bind({}, "s", function() hs.caffeinate.systemSleep() caffeinate:exit() end)