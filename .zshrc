# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Projects"

# Path for golang installation.
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Theme that oh-my-zsh uses.
ZSH_THEME="agnoster"

# Allow tmux to autostart.
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

# Define all plugins for oh-my-zsh.
plugins=(
	sudo
	tmux
	git
	golang
	docker
	docker-compose
	vi-mode
	jsontools
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Define new aliases for oh-my-zsh.
alias eomz="vim ~/.zshrc"
alias somz="source ~/.zshrc"

# Define new aliases for tmux.
alias etmux="vim ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"

# Define new aliases for general work.
alias hd="cd ~"
alias pd="projects"
alias np="new_project"
alias dd="cd ~/Downloads"

# Remove folders and files.
alias rmr="rm -r"
alias rma="rm -r *"

# Package manager aliases.
alias pml="sudo apt list --installed"
alias pmud="sudo apt update"
alias pmug="sudo apt upgrade -y"
alias pmar="sudo apt autoremove -y"
alias pmi="sudo apt install"
alias pmr="sudo apt remove"

# To edit easy the ssh config file.
alias essh="vim ~/.ssh/config"

# Docker aliases.
alias dkp="docker ps"
alias dkpa="docker ps --all"
alias dkl="docker logs"
alias dklf="docker logs --follow"

# Open project from project directory or actual directory.
alias gko="gitkraken_open"

# Backup dotfiles to repository.
alias bdf="backup_dotfile"

# Define functions to optimize workflow.
projects() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		cd $PROJECTS_DIRECTORY/$1
	else 
		cd $PROJECTS_DIRECTORY
	fi
}

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

gitkraken_open() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		gitkraken -p $PROJECTS_DIRECTORY/$1 -s false
	else
		gitkraken -p $(pwd) -s false	
	fi
}

backup_dotfile() {	
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		cp -r $1 $PROJECTS_DIRECTORY/dotfiles
	else
		echo "no file or folder was specified"
	fi
}
