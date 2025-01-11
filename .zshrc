# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Documents/Projects"
export DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/dotfiles"

# Path for homebrew installed packages.
export PATH="/opt/homebrew/bin:$PATH"

# Path for rust toolchain.
export PATH="$HOME/.cargo/bin:$PATH"

# Path for pipx installed modules.
export PATH="/Users/gowizzard/.local/bin:$PATH"

# Path for make with is installed as gmake via homebrew.
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Path for pipx to install packages in isolated environments.
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

# Path for node.js installed via homebrew.
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Path for visual studio code shell commands.
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path for 1password ssh auth socket.
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Theme that oh-my-zsh uses.
ZSH_THEME="agnoster"

# Define all plugins for oh-my-zsh.
plugins=(
	sudo
	tmux
	git
	golang
	redis-cli
	docker
	docker-compose
	jsontools
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Define plugins for 1password.
source $HOME/.config/op/plugins.sh

# Define alias for thefuck.
eval $(thefuck --alias)

# Define new aliases for oh-my-zsh.
alias eomz="vim $HOME/.zshrc"
alias somz="source $HOME/.zshrc"

# Define new aliases for tmux.
alias etmux="vim $HOME/.tmux.conf"
alias stmux="tmux source-file $HOME/.tmux.conf"

# Define new aliases for vim/nvim.
alias vim="nvim"

# Define new aliases for bat.
alias cat="bat"

# Define new aliases for general work.
alias hd="cd $HOME"
alias pd="cd $PROJECTS_DIRECTORY"
alias np="new_project"
alias dd="cd $HOME/Downloads"
alias sshd="cd $HOME/.ssh"

# Define new aliases for open files.
alias ddo="open $HOME/Downloads"

# Define new aliases for open files in code.
alias sshdo="code $HOME/.ssh"

# Remove folders and files.
alias rmr="rm -r"
alias rma="rm -r *"

# Open project from project directory or actual directory.
alias glo="goland ."
alias rro="rustrover ."
alias pco="pycharm ."
alias vco="code ."

# Add aliases for dotfiles.
alias dfo="cd $DOTFILES_DIRECTORY"

# Add aliases for notes.
alias nto="obsidian $PROJECTS/notes"
alias ntgh="notes_to_github"

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

notes_to_github() {
	cd $PROJECTS_DIRECTORY/notes
	git add .
	git commit -m "ci: Add or update notes."
	git push
	cd -
}
