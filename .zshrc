# Define plugins for 1password.
source $HOME/.config/op/plugins.sh

# Enable the auto tab suggestion for terraform.
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Paths to specific directories.
export PROJECTS_DIRECTORY="$HOME/Documents/Projects"
export DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/dotfiles"

# Path for 1password ssh auth socket.
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"

# Paths for homebrew installed packages, binaries, and more.
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Define new aliases for source files & change cli applications to a more modern version.
alias szsh="source $HOME/.zshrc"
alias stmux="tmux source-file $HOME/.tmux.conf"

alias vim="nvim"
alias make="gmake"
alias cat="bat"
alias neofetch="fastfetch"

# Define new aliases to backup my dotfiles.
alias bbrew="brew bundle dump --file=$DOTFILES_DIRECTORY/Brewfile --force"

# Define functions to optimize workflow.
new_project() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		mkdir $PROJECTS_DIRECTORY/$1
		cd $PROJECTS_DIRECTORY/$1
		git init
	else
		echo "no project title given"
	fi
}