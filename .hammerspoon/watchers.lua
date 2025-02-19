-- This file is for all pathwatchers. I use pathwatchers to reload my configuration files when they change.
-- For my dotfiles, I use symbolic links, so I changed the path to the .hammerspoon directory to the path of my dotfiles directory.
hs.pathwatcher.new(hs.configdir, function(files)
    for _, v in ipairs(files) do
        if v:match("%.lua$") then
            reloadConfig() 
            return
        end
    end
end):start()