# Add files to source here. This is the main configuration file for fish shell.
# Source the functions and completions.
starship init fish | source
source $HOME/.config/op/plugins.sh

# Add abbreviations here. Abbreviations are shortcuts for commands. For example, 
# `abbr -a vim nvim` will allow you to use `vim` as a shortcut for `nvim`.
abbr -a vim nvim
abbr -a make gmake
abbr -a cat bat
abbr -a neofetch fastfetch