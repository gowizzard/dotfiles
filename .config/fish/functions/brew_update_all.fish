# The function brew_update_all is used to update Homebrew and all installed packages.
# After updating Homebrew, the Brewfile is updated with the latest installed packages.
# The function fish_update_completions is used to update completions for fish shell.
function brew_update_all
    brew update && brew upgrade && brew cleanup
    brew bundle dump --file=$DOTFILES_DIRECTORY/Brewfile --force
    echo "Brew update complete."

    fish_update_completions
    echo "Fish completions updated."
end