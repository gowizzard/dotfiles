-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
hs.hotkey.bind({"cmd", "alt"}, "R", function() hs.reload() end)
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)