# Here you can create symlink to your dotfiles, update or backup files.
.PHONY: create-symlinks update-files backup-files

create-symlinks: 
	ln -sfn $(PWD)/.compose ~/.compose
	ln -sfn $(PWD)/.images ~/.images
	ln -sfn $(PWD)/.playbooks ~/.playbooks
	ln -sfn $(PWD)/.scripts ~/.scripts

update-files:
	cp -r .config/dunst/* ~/.config/dunst/
	cp -r .config/gtk-3.0/* ~/.config/gtk-3.0/
	cp -r .config/i3/* ~/.config/i3/
	cp -r .config/kitty/* ~/.config/kitty/
	cp -r .config/nvim/* ~/.config/nvim/
	cp .gitconfig ~
	cp .gitignore ~
	cp .gtkrc-2.0 ~
	cp .tmux.conf ~
	cp .xinitrc ~
	cp .Xresources ~
	cp .zshrc ~

backup-files:
	cp -r ~/.config/dunst/* .config/dunst/
	cp -r ~/.config/gtk-3.0/* .config/gtk-3.0/
	cp -r ~/.config/i3/* .config/i3/
	cp -r ~/.config/kitty/* .config/kitty/
	cp -r ~/.config/nvim/* .config/nvim/
	cp ~/.gitconfig .
	cp ~/.gitignore .
	cp ~/.gtkrc-2.0 .
	cp ~/.tmux.conf .
	cp ~/.xinitrc .
	cp ~/.Xresources .	
	cp ~/.zshrc .