-- In this file, I define little utility functions that I use in my other files like hotkeys.lua and pathwatchers.lua.
-- I can then require this file in my other files to keep my configuration files clean and easy to read.
function reload()
    local notification = hs.notify.new({
        informativeText = "Config files in ~/.hammerspoon reloaded",
        title = "Hammerspoon",
    })
    notification:send()
    
    hs.timer.doAfter(2, function()
        notification:withdraw()
        hs.reload()
    end)
end