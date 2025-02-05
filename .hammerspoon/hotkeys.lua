-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
local hyper = {"cmd", "ctrl", "option", "shift"}

hs.hotkey.bind(hyper, "r", function() notifications("reload_config") end)
hs.hotkey.bind(hyper, "l", function() hs.caffeinate.lockScreen() end)
hs.hotkey.bind(hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

hs.hotkey.bind({"cmd", "shift"}, "h", function() 
    local browser = hs.application.find("company.thebrowser.Browser")
    if browser then
        browser:activate()
    end
end)