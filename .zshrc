# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Projects"
export SCRIPTS_DIRECTORY="$HOME/.scripts"
export DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/dotfiles"

# Path for golang installation.
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Path for docker labs debug tools.
export PATH=$PATH:/home/gowizzard/.local/bin

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
    redis-cli
	docker
	docker-compose
	jsontools
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Define new aliases for oh-my-zsh.
alias eomz="vim $HOME/.zshrc"
alias somz="source $HOME/.zshrc"

# Define new alias for i3.
alias ei3="vim $HOME/.config/i3/config"

# Define new aliases for kitty.
alias ekitty="vim $HOME/.config/kitty/kitty.conf"

# Define new aliases for tmux.
alias etmux="vim $HOME/.tmux.conf"
alias stmux="tmux source-file $HOME/.tmux.conf"

# Define new aliases for bat.
alias cat="batcat"

# Define new aliases for general work.
alias hd="cd $HOME"
alias pd="cd $PROJECTS_DIRECTORY"
alias np="new_project"
alias dd="cd $HOME/Downloads"
alias drm="rm -r $HOME/Downloads/*"

# Define new aliases for open files.
alias ddo="xdg-open $HOME/Downloads"

# Define new aliases for move around.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdb="cd -"

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

# Open project from project directory or actual directory.
alias vco="vscode_open"
alias gko="gitkraken_open"

# Aliasses for update or install dependencies.
alias goud="sudo $SCRIPTS_DIRECTORY/install/golang.sh"
alias luaud="sudo $SCRIPTS_DIRECTORY/install/lua.sh"

# Add aliases for dotfiles.
alias dfo="cd $DOTFILES_DIRECTORY"

# Add aliases for notes.
alias nto="obsidian $PROJECTS/notes"
alias ntgh="notes_to_github"

# Add aliases for golang.
alias gmi="go mod init"
alias gmt="go mod tidy"
alias gg="go get"

# Add aliases for docker.
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcdr="docker-compose down --rmi all"
alias dcr="docker-compose restart"

# Add aliases for redis-cli.
alias rcc="redis-cli -h localhost -p 6379"

# Add aliases for bluetooth.
alias btc="bluetooth_connect"

# Add alias for neofetch.
alias nf="neofetch"

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

notes_to_github() {
  cd $PROJECTS_DIRECTORY/notes
  git add .
  git commit -m "ci: Add or update notes."
  git push
  cd -
}

bluetooth_connect() {
  if [ $# -gt 1]; then
    echo "too many arguments were handed over"
  elif [ $# -eq 1 ]; then
    case $1 in
      "work")
        bluetoothctl connect C8:7B:23:56:3D:95
        ;;
      "home")
        bluetoothctl connect 78:2B:64:D1:66:57
        ;;
    esac
  else
    echo "no bluetooth device given"
  fi
}
