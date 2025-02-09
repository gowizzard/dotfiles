-- In this file, I define little utility functions that I use in my other files like hotkeys.lua and pathwatchers.lua.
-- I can then require this file in my other files to keep my configuration files clean and easy to read.
function reload()
    hs.notify.new({autoWithdraw=true, informativeText="Config files in ~/.hammerspoon reloaded", title="Hammerspoon", withdrawAfter=2}):send()
    hs.reload()
end