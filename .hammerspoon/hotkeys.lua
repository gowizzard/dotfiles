-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "R", function() hs.reload() end)
hs.hotkey.bind(hyper, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)