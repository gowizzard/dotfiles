-- In this file, I define all my hotkey functions. 
-- I can then require this file in my init.lua file to keep my configuration file clean and easy to read.
local hyper = {"cmd", "ctrl", "option", "shift"}

hs.hotkey.bind(hyper, "r", function() notifications("reload_config") end)
hs.hotkey.bind(hyper, "l", function() hs.caffeinate.lockScreen() end)
hs.hotkey.bind(hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

hs.hotkey.bind(hyper, "o", function()
    apps = {
        ["a"] = "Arc",
        ["c"] = "ChatGPT",
        ["d"] = "Discord",
        ["f"] = "Finder",
        ["m"] = "Thunderbird",
        ["n"] = "Notion",
        ["p"] = "Spotify",
        ["s"] = "Slack",
        ["t"] = "Ghostty",
    }

    for i, v in pairs(apps) do
        hs.hotkey.bind(hyper, i, function() hs.application.launchOrFocus(v) end)
    end
end)