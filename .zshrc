# Paths for the zsh shell & oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="agnoster"

# Define all plugins for oh-my-zsh.
plugins=(
	1password
	ansible
	brew
	docker
	docker-compose
	fzf
	jsontools
	terraform
	thefuck
	tmux
	zsh-autosuggestions
)

# Define the path to the oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# Define plugins for 1password.
source $HOME/.config/op/plugins.sh

# Enable the auto tab suggestion for terraform.
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Documents/Projects"

# Path for 1password ssh auth socket.
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"

# Paths for homebrew installed packages.
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Path for make with is installed as gmake via homebrew.
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Path for node.js installed via homebrew.
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Paths for rust toolchain.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"

# Paths for pipx installed modules.
export PATH="$HOME/.local/bin:$PATH"
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

# Path for visual studio code shell commands.
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Define new aliases for source files.
alias szsh="source $HOME/.zshrc"
alias stmux="tmux source-file $HOME/.tmux.conf"

# Define new alias to change cli applications to a more modern version.
alias vim="nvim"
alias make="gmake"
alias cat="bat"
alias neofetch="fastfetch"

# Define new aliases for general work.
alias pd="cd $PROJECTS_DIRECTORY"
alias np="new_project"
alias dd="cd $HOME/Downloads"
alias sshd="cd $HOME/.ssh"

# Define new alias for open directories in different applications.
alias ddo="open $HOME/Downloads"
alias dfo="code $PROJECTS_DIRECTORY/dotfiles"

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