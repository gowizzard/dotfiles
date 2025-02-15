# The function bbrew is to dump the Brewfile to the Brewfile in the dotfiles directory.
function bbrew
    brew bundle dump --file=$DOTFILES_DIRECTORY/Brewfile --force
end