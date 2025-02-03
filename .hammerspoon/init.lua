-- This is my hammerspoon configuration file. It is a Lua script that is executed by Hammerspoon when it starts up. 
-- It is located at ~/.hammerspoon/init.lua. This file is a great place to define hotkeys, functions, and other configuration options for Hammerspoon.
-- For my dotfiles, I use symbolic links, so I changed the path to the .hammerspoon directory to the path of my dotfiles directory.
local function reload(files)
    for _, v in ipairs(files) do
        if v:match("%.lua$") then
            hs.reload()
            return
        end
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/Documents/Projects/dotfiles/.hammerspoon", reload):start()
hs.notify.new({title="Hammerspoon", informativeText="Config files in ~/.hammerspoon reloaded"}):send()

hs.hotkey.bind({"cmd", "alt"}, "R", function() hs.reload() end)

-- Load all the modules for my hammerspoon configuration. This keeps my init.lua file clean and easy to read.
require("hotkeys")