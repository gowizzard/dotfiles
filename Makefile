# This Makefile is used to create symlinks to the dotfiles in this repository.

.PHONY: git tmux zsh ghostty all

DOTFILE_PATH := $(shell pwd)

$(HOME)/%: %
	ln -sf $(DOTFILE_PATH)/$< $@

git: $(HOME)/.gitconfig $(HOME)/.gitignore
tmux: $(HOME)/.tmux.conf
zsh: $(HOME)/.zshrc

ghostty:
	mkdir -p $(HOME)/.config/ghostty/themes
	ln -sf $(DOTFILE_PATH)/ghostty/config $(HOME)/.config/ghostty/config
	ln -sf $(DOTFILE_PATH)/ghostty/themes/jjideenschmiede $(HOME)/.config/ghostty/themes/jjideenschmiede

nvim:
	mkdir -p $(HOME)/.config/nvim/lua
	ln -sf $(DOTFILE_PATH)/nvim/init.lua $(HOME)/.config/nvim/init.lua
	ln -sf $(DOTFILE_PATH)/nvim/lua/default.lua $(HOME)/.config/nvim/lua/default.lua

all: git tmux zsh ghostty nvim