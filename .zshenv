# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my project directory.
export PROJECTS_DIRECTORY="$HOME/Documents/Projects"

# Path for homebrew installed packages.
export PATH="/opt/homebrew/bin:$PATH"

# Path for rust toolchain.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"

# Path for pipx installed modules.
export PATH="/Users/gowizzard/.local/bin:$PATH"

# Path for make with is installed as gmake via homebrew.
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Path for pipx to install packages in isolated environments.
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

# Path for node.js installed via homebrew.
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Path for visual studio code shell commands.
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path for 1password ssh auth socket.
export SSH_AUTH_SOCK="~/.1password/agent.sock"