i3-install:
	mkdir -p $(HOME)/.config/i3
	cp -r $(DOTFILES_DIRECTORY)/.config/i3 $(HOME)/.config/i3

gtk3-install:
	mkdir -p $(HOME)/.config/gtk-3.0
	cp -r $(DOTFILES_DIRECTORY)/.config/gtk-3.0 $(HOME)/.config/gtk-3.0

xresources-install:
	cp $(DOTFILES_DIRECTORY)/.Xresources $(HOME)	

kitty-install:
	mkdir -p $(HOME)/.config/kitty
	cp -r $(DOTFILES_DIRECTORY)/.config/kitty $(HOME)/.config/kitty

zsh-install:
	cp $(DOTFILES_DIRECTORY)/.zshrc $(HOME)

tmux-install:
	cp $(DOTFILES_DIRECTORY)/.tmux.conf $(HOME)

nvim-install:
	mkdir -p $(HOME)/.config/nvim
	cp -r $(DOTFILES_DIRECTORY)/.config/nvim $(HOME)/.config/nvim

git-install:
	cp $(DOTFILES_DIRECTORY)/.gitconfig $(DOTFILES_DIRECTORY)/.gitignore $(HOME)

scripts-install:
	mkdir -p $(HOME)/.scripts
	cp -r $(DOTFILES_DIRECTORY)/.scripts $(HOME)/scripts

i3-backup:
	mkdir -p $(DOTFILES_DIRECTORY)/.config/i3
	cp $(HOME)/.config/i3/config $(DOTFILES_DIRECTORY)/.config/i3

gtk3-backup:
	mkdir -p $(DOTFILES_DIRECTORY)/.config/gtk-3.0
	cp $(HOME)/.config/gtk-3.0/settings.ini $(DOTFILES_DIRECTORY)/.config/gtk-3.0

xresources-backup:
	cp $(HOME)/.Xresources $(DOTFILES_DIRECTORY)

kitty-backup:
	mkdir -p $(DOTFILES_DIRECTORY)/.config/kitty
	cp $(HOME)/.config/kitty/kitty.conf $(DOTFILES_DIRECTORY)/.config/kitty

zsh-backup:
	cp $(HOME)/.zshrc $(DOTFILES_DIRECTORY)

tmux-backup:
	cp $(HOME)/.tmux.conf $(DOTFILES_DIRECTORY)

nvim-backup:
	mkdir -p $(DOTFILES_DIRECTORY)/.config/nvim/lua
	cp -r $(HOME)/.config/nvim/init.lua $(HOME)/.config/nvim/lua $(DOTFILES_DIRECTORY)/.config/nvim

git-backup:
	cp $(HOME)/.gitconfig $(HOME)/.gitignore $(DOTFILES_DIRECTORY)

scripts-backup:
	mkdir -p $(DOTFILES_DIRECTORY)/.scripts
	cp -r $(HOME)/.scripts $(DOTFILES_DIRECTORY)

install: i3-install gtk3-install kitty-install zsh-install tmux-install nvim-install git-install scripts-backup
backup: i3-backup gtk3-backup kitty-backup zsh-backup tmux-backup nvim-backup git-backup scripts-backup