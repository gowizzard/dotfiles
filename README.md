# dotfiles

Here you can find my dotfiles and configurations that I use on my macOS system. I have been using these configurations for a while now, and I am quite happy with them. I have tried to keep the configurations as simple as possible, so that they can be easily understood and modified. I have also included a Makefile to automate the installation process, so that you can easily set up your system with my configurations.

> [!NOTE]
> I have recently switched to macOS, so I am still in the process of setting up my system. I will update this repository as I make changes.

![macOS](https://github.com/user-attachments/assets/c879851a-efb2-42da-aa7a-73df09743308)

This repository contains dotfiles and configuration settings for:

- Ghostty: A fast, feature-rich, and cross-platform terminal emulator.
- Oh-my-zsh: Framework for managing Zsh configuration.
- Tmux: Terminal multiplexer to manage multiple sessions.
- Git: My version control of choice.
- Neovim: My text editor of choice for terminal.
- ... and various other tools that boost my productivity!

## Installation

To install the configurations, you can run the following command in the terminal.

```shell
make all
```

## Homebrew

On macOS I use Homebrew as my package manager, so I have to install some packages and services directly. Here you can find some information about my installations and configurations.

```shell
brew bundle --file=Brewfile
```
After installing the packages, I run the following command to clean up the cache and remove old versions of the packages.

```shell
brew bundle --force cleanup --file=Brewfile
```
