# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Projects"
export INSTALL_DIRECTORY="$HOME/.install"
export DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/dotfiles"

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
alias eomz="vim $HOME/.zshrc"
alias somz="source $HOME/.zshrc"

# Define new aliases for tmux.
alias etmux="vim $HOME/.tmux.conf"
alias stmux="tmux source-file $HOME/.tmux.conf"

# Define new aliases for general work.
alias hd="cd $HOME"
alias pd="projects"
alias np="new_project"
alias sd="cd $SCRIPTS_DIRECTORY"
alias dd="cd $HOME/Downloads"

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
alias essh="vim $HOME/.ssh/config"

# Docker aliases.
alias dkp="docker ps"
alias dkpa="docker ps --all"
alias dkl="docker logs"
alias dklf="docker logs --follow"

# Open project from project directory or actual directory.
alias glo="goland_open"
alias vco="vscode_open"
alias gko="gitkraken_open"

# Aliasses for update or install dependencies.
alias goud="sudo $INSTALL_DIRECTORY/golang.sh"
alias luaud="sudo $INSTALL_DIRECTORY/lua.sh"

# Aliasses for dump or load terminal profiles.
alias gtpd="gnome_terminal_profiles dump"
alias gtpl="gnome_terminal_profiles load"

# Add aliases for dotfiles.
alias dfo="cd $DOTFILES_DIRECTORY"

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

goland_open() {
    if [ $# -gt 1 ]; then
        echo "too many arguments were handed over"
    elif [ $# -eq 1 ]; then
        goland nosplash $PROJECTS_DIRECTORY/$1 > /dev/null 2>&1 &
    else
        goland nosplash $(pwd) > /dev/null 2>&1 &
    fi
}

vscode_open() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		code $PROJECTS_DIRECTORY/$1 -n
	else
		code $(pwd) -n
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

gnome_terminal_profiles() {
  if [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
  elif [ $# -eq 1 ]; then
    if [ $1 = "dump" ]; then
      mkdir -p $HOME/.config/gnome-terminal
      dconf dump /org/gnome/terminal/legacy/profiles:/ > $HOME/.config/gnome-terminal/profiles.conf
      echo "dumped terminal profiles"
    elif [ $1 = "load" ]; then
      dconf load /org/gnome/terminal/legacy/profiles:/ < $HOME/.config/gnome-terminal/profiles.conf
      echo "loaded terminal profiles"
    fi
  else
    echo "no profile operation given"
  fi
}
