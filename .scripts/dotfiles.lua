-- Save and restore dotfiles from a git repository or to the git repository
local shell = os.getenv("SHELL")
if shell == nil or not string.find(shell, "zsh") then
    print("shell is not zsh")
    return
end

local directories = {
    home = os.getenv("HOME"),
    projects = os.getenv("PROJECTS_DIRECTORY")
}

local files = {
    ".gitconfig",
    ".tmux.conf",
    ".zshrc",
    ".config/nvim/init.lua",
    ".config/nvim/lua/default.lua",
    ".scripts/dotfiles.lua"
}

local function copy_file(source, destination) 
    
    local source_file = io.open(source, "r")
    if source_file == nil then
        print("file " .. source .. " does not exist")
        return
    end

    local destination_file = io.open(destination, "w")
    if destination_file == nil then
        print("file " .. destination .. " does not exist")
        return
    end

    destination_file:write(source_file:read("*all"))

    source_file:close()
    destination_file:close()

end

if arg[1] == "backup" then
    for _, value in pairs(files) do
        copy_file(directories.home .. "/" .. value, directories.projects .. "/dotfiles/" .. value)
    end
    print("dotfiles backed up successfully")
elseif arg[1] == "restore" then
    for _, value in pairs(files) do
        copy_file(directories.projects .. "/dotfiles/" .. value, directories.home .. "/" .. value)
    end
    print("dotfiles restored successfully")
else
    print("invalid argument")
end