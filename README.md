<div align="center">

<img src="https://github.com/gowizzard/dotfiles/assets/30717818/24cc9d7c-65e7-426d-a147-da74e11e6027" alt="dotfiles" width="650" style="margin:50px 0;">

# dotfiles

</div>

This repository contains dotfiles and configuration settings for:

- i3: A popular tiling window manager.
- Kitty: My terminal emulator of choice.
- Oh-my-zsh: Framework for managing Zsh configuration.
- Tmux: Terminal multiplexer to manage multiple sessions.
- Git: My version control of choice.
- Neovim: My text editor of choice for terminal.
- Dunst: My notification manager of choice.
- ... and various other tools that boost my productivity!

## Docker Compose

There is a [.compose](.compose) directory where I store all the Docker Compose files that I need locally, like creating a small database for testing etc. 

## Installation

In the directory [.scripts/install](.scripts/install) you will find some scripts for the installation of, for me, important applications. There are also a few other services that I need, you can find a few short installation instructions here. Most of it is specific to arch linux.

### Preparations

You can find the most important packages here, I need these for the installation and in the operating name of my system, plus other packages that are mapped directly via installation scripts.

```text
xorg, xorg-init, i3, dmenu, feh, kitty, zsh, git, tmux, neovim, chromium, firefox, go, python, neofetch
```

**These packages should be installed directly during the installation process, with some more specific applications or services being added later.**

### Specific installations

#### Notifications

If you want to install notifications under Arch, you have to proceed as follows. First install the following packages:

```shell
sudo pacman -S libnotify dunst
```

You can now create the folder in `~/.config/dunst` and create the file [dunstrc](.config/dunst/dunstrc) in it so that you can customize the notifications. The start of `dunstrc` must also be stored in the [i3 configuration](.config/i3/config).

#### Network Manager

In order to have a network manager under Arch Linux, you must install the following package:

```shell
sudo pacman -S networkmanager network-manager-applet
```

Now you should activate and start the service once, you can do this with these two commands:

```shell
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
```

I have now stored the `nm-applet` in my [i3 configuration](.config/i3/config) so that it is automatically started in the window manager.

#### Bluetooth

If you want to install Bluetooth under Arch Linux, you can do this as follows. First install the following packages:

```shell
sudo pacman -S bluez blueberry
```
Once this has been installed, all that remains is to create and start the service, which works as follows:

```shell
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```
The `blueberry-tray` can now be stored directly in the [i3 configuration](.config/i3/config) so that the GUI starts immediately when the system is started.

#### Docker

You can download Docker directly via the official Arch Packages, simply execute the following command (possibly install updates first):

```shell
sudo pacman -S docker docker-compose
```

The service then only needs to be stored and started. This can be done with the following commands:

```shell
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

Now your user should be added to the group, simply execute the following command:

```shell
sudo usermod -aG docker $USER
```

**It is then recommended to restart the system immediately, now you should be able to execute the Docker commands with your user without `sudo`.**

#### Rust

In order to use rust correctly, you should install the following package. This is the official rustup package, which is used to install rust.

```shell
sudo pacman -S rustup
```

Now you can install the Rust toolchain with the following command. This will install the stable version of rust.

```shell
rustup default stable
```
