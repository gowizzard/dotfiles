<div align="center">

<img src="https://github.com/gowizzard/dotfiles/assets/30717818/acd99ee6-84b9-4081-8761-5a0b77dd2d1b" alt="dotfiles" width="650" style="margin:50px 0;">

# dotfiles

</div>

This repository contains dotfiles and configuration settings for:

- Ghostty: A fast, feature-rich, and cross-platform terminal emulator.
- Oh-my-zsh: Framework for managing Zsh configuration.
- Tmux: Terminal multiplexer to manage multiple sessions.
- Git: My version control of choice.
- Neovim: My text editor of choice for terminal.
- ... and various other tools that boost my productivity!

## macOS

I changed my operating system back from Debian to macOS, so here you can find some of my configurations and dotfiles that I use.

![macOS](https://github.com/user-attachments/assets/c879851a-efb2-42da-aa7a-73df09743308)

### Homebrew

On macOS I use Homebrew as my package manager, so I have to install some packages and services directly. Here you can find some information about my installations and configurations.

```shell
brew bundle --file=Brewfile
```
After installing the packages, I run the following command to clean up the cache and remove old versions of the packages.

```shell
brew bundle --force cleanup --file=Brewfile
```
