# dotfiles

Here you can find my dotfiles and configurations that I use on my macOS system. I have been using these configurations for a while now, and I am quite happy with them. I have tried to keep the configurations as simple as possible, so that they can be easily understood and modified.

> [!NOTE]
> I have recently switched to macOS, so I am still in the process of setting up my system. I will update this repository as I make changes.

![macOS](https://github.com/user-attachments/assets/f7ce588e-80bd-48b8-af45-e4899843cf01)

This repository contains dotfiles and configuration settings for:

- Fish: My shell of choice.
- Ghostty: A fast, feature-rich, and cross-platform terminal emulator.
- Neovim: My text editor of choice for terminal.
- Starship: A minimal, fast, and customizable prompt for any shell.
- Hammerspoon: A powerful automation tool for macOS.
- Git: My version control of choice.
- Tmux: Terminal multiplexer to manage multiple sessions.
- ... and various other tools that boost my productivity!

## Installation

To install the configurations, you need to clone the repository and follow the next steps in this README file.

## Homebrew

On macOS I use Homebrew as my package manager, so here you can find a Brewfile that contains all taps, brews, casks & vscode extensions that I use. To install the packages, you can run the following command in the terminal. 

> [!NOTE]
> Make sure to install Homebrew before running the following commands. You can find more information about Homebrew on their [website](https://brew.sh/).

```shell
brew bundle --file=Brewfile
```
After installing the packages, I run the following command to clean up the cache and remove old versions of the packages.

```shell
brew bundle cleanup --file=Brewfile --force
```

## GNU Stow

I use GNU Stow to manage my dotfiles. It is a simple tool that symlinks files from one directory to another. This makes it easy to manage dotfiles across multiple systems. To install GNU Stow, you can run the following command in the terminal.

> [!WARNING]
> Make sure that you are in the dotfiles directory before running the following command. This will create symlinks for the dotfiles in the home directory.

```shell
stow .
```

## Fish

I use Fish as my shell, and I have configured it to be as simple and efficient as possible. You can find my Fish configuration in the `.config/fish` directory.

### Change default shell

> [!TIP]
> Fish is not installed by default on macOS, so i have installed it using Homebrew. You can find more information about Fish on their [website](https://fishshell.com/).

To change the default shell to Fish, you need to add the following line to the `/etc/shells` file.

```text
/opt/homebrew/bin/fish
```

After adding the line to the `/etc/shells` file, you can run the following command in the terminal to change the default shell to Fish.

```shell
chsh -s /opt/homebrew/bin/fish
```

### Update completions

To update the completions for Fish, you can run the following command in the terminal. This will update the completions for all the installed packages.

```shell
fish_update_completions
```
