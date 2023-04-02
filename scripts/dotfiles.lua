-- Save the dotfiles to the dotfiles repo
local home = os.getenv("HOME")
local projects = os.getenv("PROJECTS_DIRECTORY")

local files = {
    ".gitconfig",
    ".tmux.conf",
    ".zshrc",
    ".config/nvim/init.lua",
    ".config/nvim/lua"
}

if arg[1] == "backup" then

    for _, value in pairs(files) do
        os.execute("cp -r " .. home .. "/" .. value .. " " .. projects .. "/dotfiles")
    end

    os.execute("git aac \"ci: The data was added automatically.\"")

    print("dotfiles backed up successfully")

elseif arg[1] == "restore" then
    
    for _, value in pairs(files) do
        os.execute("cp -r " .. projects .. "/dotfiles/" .. value .. " " .. home)
    end

    print("dotfiles restored successfully")

else

    print("invalid argument")

end