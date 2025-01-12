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
