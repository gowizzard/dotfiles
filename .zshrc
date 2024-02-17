# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Projects"
export SCRIPTS_DIRECTORY="$HOME/.scripts"
export DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/dotfiles"

# Path for jetbrains toolbox scripts.
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

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

# Define autocompletion for zoxide.
eval "$(zoxide init zsh)"

# Define autocompletion for kubectl.
source <(kubectl completion zsh)

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

# Define new aliases for zoxide.
alias cd="z"
alias fzf="zi"

# Define new aliases for vim/nvim.
alias vim="nvim"

# Define new aliases for bat.
alias cat="bat"

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

# Open project from project directory or actual directory.
alias glo="jetbrains_ide_open \"goland\""
alias rro="jetbrains_ide_open \"rustrover\""
alias pco="jetbrains_ide_open \"pycharm\""
alias vco="vscode_open"
alias gko="gitkraken_open"

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

jetbrains_ide_open() {
	if [ $# -gt 2 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 2 ]; then
		arg-runner $1 nosplash $PROJECTS_DIRECTORY/$2
	else
		arg-runner $1 nosplash .
	fi
}

vscode_open() {
	if [ $# -gt 1 ]; then
		echo "too many arguments were handed over"
	elif [ $# -eq 1 ]; then
		arg-runner code $PROJECTS_DIRECTORY/$1 -n
	else
		arg-runner code $(pwd) -n
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
