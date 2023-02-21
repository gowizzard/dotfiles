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
	thefuck
)

source $ZSH/oh-my-zsh.sh
