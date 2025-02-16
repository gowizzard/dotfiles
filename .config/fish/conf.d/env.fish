# Disable the default welcome message.
set -gx fish_greeting

# Paths to specific directories.
set -gx PROJECTS_DIRECTORY $HOME/Documents/Projects
set -gx DOTFILES_DIRECTORY $PROJECTS_DIRECTORY/dotfiles

# Path for 1password ssh auth socket.
set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock

# Paths for homebrew installed packages, binaries, and more.
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

set -gx PATH /opt/homebrew/opt/make/libexec/gnubin $PATH

set -gx PATH /opt/homebrew/opt/node@20/bin $PATH

set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.cargo/env $PATH

set -gx PATH (python3 -c 'import site; print(site.USER_BASE)')/bin $PATH

set -gx PATH $PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"