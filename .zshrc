# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path for golang installation.
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Theme that oh-my-zsh uses.
ZSH_THEME="agnoster"

# Define all plugins for oh-my-zsh.
plugins=(
	git
	golang
	docker
	docker-compose
	vi-mode
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Define new aliases for oh-my-zsh.
alias eomz="vim ~/.zshrc"
alias somz="source ~/.zshrc"

# Define new aliases for general work.
alias hd="cd ~"
alias pd="project"
alias np="new_project"
alias dd="cd ~/Downloads"
alias esshc="vim ~/.ssh/config"
alias gomi="go_mod_init"

# Define functions to optimize workflow.
project() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		cd ~/Projects/$1
	else 
		cd ~/Projects
	fi
}

new_project() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		mkdir ~/Projects/$1
		cd ~/Projects/$1
		git init
	else
		echo "no project title given"
	fi
}

go_run() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		go run $1
	else 
		go run main.go
	fi
}

go_mod_init() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		go mod init github.com/$1
	else
		echo "no owner/repository specified or the correct number of arguments have not been"
	fi
}

