-- In this file, I define little utility functions that I use in my other files like hotkeys.lua and pathwatchers.lua.
-- I can then require this file in my other files to keep my configuration files clean and easy to read.
function notifications(type)
    if type == "reload_config" then 
        hs.notify.new({title="Hammerspoon", informativeText="Config files in ~/.hammerspoon reloaded"}):send()
        hs.reload()
    end
end