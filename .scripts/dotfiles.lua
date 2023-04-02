-- Save the dotfiles to the dotfiles repo
local home_directory = os.getenv("HOME")
local projects_directory = os.getenv("PROJECTS_DIRECTORY")

local files = {
    ".gitconfig",
    ".tmux.conf",
    ".zshrc",
    ".config/nvim/init.lua",
    ".config/nvim/lua/*",
    ".scripts/*"
}

if arg[1] == "backup" then

    for _, value in pairs(files) do
        os.execute("cp -r " .. home_directory .. "/" .. value .. " " .. projects_directory .. "/dotfiles/" .. value)
    end

    os.execute("cd " .. projects_directory .. "/dotfiles; git aac \"ci: The data was added automatically.\"")

    print("dotfiles backed up successfully")

elseif arg[1] == "restore" then
    
    for _, value in pairs(files) do
        os.execute("cp -r " .. projects_directory .. "/dotfiles/" .. value .. " " .. home_directory .. "/" .. value)
    end

    print("dotfiles restored successfully")

else

    print("invalid argument")

end