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

# Define alias for fzf.
source <(fzf --zsh)

# Define alias for thefuck.
eval $(thefuck --alias)

# Define new aliases for oh-my-zsh.
alias ezsh="vim $HOME/.zshrc"
alias ezshenv="vim $HOME/.zshenv"
alias szsh="source $HOME/.zshrc"

# Define new aliases for tmux.
alias etmux="vim $HOME/.tmux.conf"
alias stmux="tmux source-file $HOME/.tmux.conf"

# Define new alias for vim/nvim.
alias vim="nvim"

# Define new alias for make.
alias make="gmake"

# Define new alias for bat.
alias cat="bat"

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