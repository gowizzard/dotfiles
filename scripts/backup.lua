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

for _, file in pairs(files) do
    os.execute("cp -r " .. home .. "/" .. file .. " " .. projects .. "/dotfiles")
end

os.execute("git aac \"ci: The data was added automatically.\"")