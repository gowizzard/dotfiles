function update_all --description "Update dotfiles, Homebrew, Brewfile, pipx and fish completions"
    if not set -q DOTFILES_DIRECTORY
        echo "❌ DOTFILES_DIRECTORY is not set." >&2
        return 1
    end

    set -l failed

    echo "📦 Updating dotfiles…"
    if git -C $DOTFILES_DIRECTORY pull --ff-only
        echo "📦 Dotfiles updated."
    else
        set -a failed dotfiles
    end

    if command -q brew
        echo "🍻 Updating Homebrew…"
        set -lx HOMEBREW_NO_ENV_HINTS 1
        set -lx HOMEBREW_NO_INSTALL_CLEANUP 1

        brew update; or set -a failed "brew update"
        brew upgrade; or set -a failed "brew upgrade"
        brew upgrade --cask --greedy; or set -a failed "brew upgrade --cask"
        brew cleanup

        if brew bundle dump --file=$DOTFILES_DIRECTORY/Brewfile --force
            echo "🍻 Homebrew and Brewfile updated."
        else
            set -a failed "brew bundle dump"
        end
    else
        echo "⚠️  Homebrew not found, skipping."
    end

    if command -q pipx
        echo "🐍 Updating pipx packages…"
        if pipx upgrade-all
            echo "🐍 Pipx packages updated."
        else
            set -a failed pipx
        end
    end

    echo "🐟 Updating fish completions…"
    fish_update_completions
    echo "🐟 Fish completions updated."

    if test (count $failed) -gt 0
        echo ""
        echo "⚠️  Finished with problems in: $failed" >&2
        return 1
    end

    echo ""
    echo "✅ All updates completed."
end
