# This is the main configuration file for fish shell. It is loaded every time a new shell is opened.
# Add abbreviations here. Abbreviations are shortcuts for commands. For example, 
# `abbr -a vim nvim` will allow you to use `vim` as a shortcut for `nvim`.
abbr -a ls eza
abbr -a cd z
abbr -a vim nvim
abbr -a make gmake
abbr -a cat bat
abbr -a neofetch fastfetch

# Add files or initialization scripts here to be loaded every time a new shell is opened. 
source $HOME/.config/op/plugins.sh

starship init fish | source
zoxide init fish | source