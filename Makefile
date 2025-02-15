# This Makefile is used to create symlinks to the dotfiles in this repository.

.PHONY: git tmux zsh fastfetch fish ghostty karabiner nvim hammerspoon all

DOTFILES := $(shell pwd)

$(HOME)/%: %
	ln -sf $(DOTFILES)/$< $@

git: $(HOME)/.gitconfig $(HOME)/.gitignore
tmux: $(HOME)/.tmux.conf
zsh: $(HOME)/.zshrc

fastfetch:
	@rm -rf $(HOME)/.config/fastfetch
	ln -sf $(DOTFILES)/.config/fastfetch $(HOME)/.config/fastfetch

fish:
	@rm -rf $(HOME)/.config/fish
	ln -sf $(DOTFILES)/.config/fish $(HOME)/.config/fish

ghostty:
	@rm -rf $(HOME)/.config/ghostty
	ln -sf $(DOTFILES)/.config/ghostty $(HOME)/.config/ghostty

karabiner:
	@rm -rf $(HOME)/.config/karabiner
	ln -sf $(DOTFILES)/.config/karabiner $(HOME)/.config/karabiner

nvim:
	@rm -rf $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/.config/nvim $(HOME)/.config/nvim

hammerspoon:
	@rm -rf $(HOME)/.hammerspoon
	ln -sf $(DOTFILES)/.hammerspoon $(HOME)/.hammerspoon

all: git tmux zsh fastfetch fish ghostty karabiner nvim hammerspoon