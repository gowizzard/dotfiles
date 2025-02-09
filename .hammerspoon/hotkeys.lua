-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
local hyper = {"cmd", "ctrl", "option", "shift"}

hs.hotkey.bind(hyper, "r", function() reload() end)
hs.hotkey.bind(hyper, "x", function() hs.toggleConsole() end)

hs.hotkey.bind(hyper, "right", function() hs.window.focusedWindow():moveOneScreenEast() end)
hs.hotkey.bind(hyper, "left", function() hs.window.focusedWindow():moveOneScreenWest() end)
hs.hotkey.bind(hyper, "return", function() hs.window.focusedWindow():maximize() end)
hs.hotkey.bind(hyper, "h", function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(hyper, "l", function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)

local caffeinate = hs.hotkey.modal.new(hyper, "c")

caffeinate:bind({}, "escape", function() caffeinate:exit() end)

caffeinate:bind({}, "q", function() hs.caffeinate.shutdownSystem() caffeinate:exit() end)
caffeinate:bind({}, "s", function() hs.caffeinate.systemSleep() caffeinate:exit() end)