# The function update_all is used to update Homebrew, Brewfile, pipx packages, and fish completions.
# First, it updates Homebrew and Brewfile by running brew update, brew upgrade, and brew cleanup.
# Then, it updates pipx packages by running pipx upgrade-all.
# Finally, it updates fish completions by running fish_update_completions.
function update_all
    git -C $DOTFILES_DIRECTORY pull
    echo "📦 Dotfiles updated."

    brew update && brew upgrade && brew cleanup
    brew bundle dump --file=$DOTFILES_DIRECTORY/Brewfile --force
    echo "🍻 Homebrew and Brewfile updated."

    pipx upgrade-all
    echo "🐍 Pipx packages updated."

    fish_update_completions
    echo "🐟 Fish completions updated."
end
