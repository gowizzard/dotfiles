# This Makefile is used to create symlinks to the dotfiles in this repository.

.PHONY: git tmux zsh fastfetch ghostty karabiner nvim hammerspoon all

DOTFILE_PATH := $(shell pwd)

$(HOME)/%: %
	ln -sf $(DOTFILE_PATH)/$< $@

git: $(HOME)/.gitconfig $(HOME)/.gitignore
tmux: $(HOME)/.tmux.conf
zsh: $(HOME)/.zshrc

fastfetch:
	@[ -d $(HOME)/.config/fastfetch ] || mkdir $(HOME)/.config/fastfetch
	ln -sf $(DOTFILE_PATH)/.config/fastfetch/config.jsonc $(HOME)/.config/fastfetch/config.jsonc

ghostty:
	@[ -d $(HOME)/.config/ghostty/themes ] || mkdir -p $(HOME)/.config/ghostty/themes
	ln -sf $(DOTFILE_PATH)/.config/ghostty/config $(HOME)/.config/ghostty/config
	ln -sf $(DOTFILE_PATH)/.config/ghostty/themes/jjideenschmiede $(HOME)/.config/ghostty/themes/jjideenschmiede

karabiner:
	@[ -d $(HOME)/.config/karabiner ] || ln -sf $(DOTFILE_PATH)/.config/karabiner $(HOME)/.config/karabiner

nvim:
	@[ -d $(HOME)/.config/nvim/lua ] || mkdir -p $(HOME)/.config/nvim/lua
	ln -sf $(DOTFILE_PATH)/.config/nvim/init.lua $(HOME)/.config/nvim/init.lua
	ln -sf $(DOTFILE_PATH)/.config/nvim/lua/default.lua $(HOME)/.config/nvim/lua/default.lua

hammerspoon:
	@[ -d $(HOME)/.hammerspoon ] || ln -sf $(DOTFILE_PATH)/.hammerspoon $(HOME)/.hammerspoon

all: git tmux zsh fastfetch ghostty karabiner nvim hammerspoon