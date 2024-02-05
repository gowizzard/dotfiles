<div align="center">

<img src="https://github.com/gowizzard/dotfiles/assets/30717818/acd99ee6-84b9-4081-8761-5a0b77dd2d1b" alt="dotfiles" width="650" style="margin:50px 0;">

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

## Ansible Playbooks

There is also an [.playbooks](.playbooks) directory where I store all the Ansible Playbooks that I need locally, like update my pi-hole etc.

## Installation

In the directory [.scripts/install](.scripts/install) you will find some scripts for the installation of, for me, important applications. There are also a few other services that I need, you can find a few short installation instructions here. Most of it is specific to arch linux.

### General

#### Themes

Here you can find the themes that I use, I have also linked the installation instructions here.

##### Fluent Dark

Here you can find the [Fluent Dark](https://github.com/vinceliuice/Fluent-gtk-theme) theme, which I use for GTK. You can install it with the following commands:

```shell
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
cd Fluent-gtk-theme
./install.sh
```

#### Icons

Here you can find the icon themes that I use, I have also linked the installation instructions here.

##### Papirus Dark

The [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) icon theme is a free and open source SVG icon theme for Linux. You can istall it in the root directory with the following command:

```shell
wget -qO- https://git.io/papirus-icon-theme-install | sh
```

### Arch Linux

#### Preparations

You can find the most important packages here, I need these for the installation and in the operating name of my system, plus other packages that are mapped directly via installation scripts.

```text
xorg, xorg-xinit, i3, dex, kwallet5, pulseaudio, pulseaudio-bluetooth, pulseaudio-equalizer, pasystray, nfs-utils, feh, kitty, zsh, git, make, tmux, neovim, chromium, firefox, go, python, npm, terraform, ansible, jq, neofetch, thunar, obsidian, gimp, vlc
```

**These packages should be installed directly during the installation process, with some more specific applications or services being added later.**

#### Specific installations

##### Notifications

If you want to install notifications under Arch, you have to proceed as follows. First install the following packages:

```shell
sudo pacman -S libnotify dunst
```

You can now create the folder in `~/.config/dunst` and create the file [dunstrc](.config/dunst/dunstrc) in it so that you can customize the notifications. The start of `dunstrc` must also be stored in the [i3 configuration](.config/i3/config).

##### Network Manager

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

##### Bluetooth

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

##### Ulauncher

In order to install Ulauncher under Arch Linux, you have to proceed as follows. First use the installation script from the [official website](https://ulauncher.io/#Download) and then install the following package:

```shell
git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is
```
After that you can clone my [Ulancher theme](https://github.com/gowizzard/dark-trooper) with the following command:

```shell
git clone https://github.com/gowizzard/dark-trooper
```

Now you can move into the repository and install the theme with the following commands:

```shell
make install
```

##### Docker

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

##### Rust

In order to use rust correctly, you should install the following package. This is the official rustup package, which is used to install rust.

```shell
sudo pacman -S rustup
```

Now you can install the Rust toolchain with the following command. This will install the stable version of rust.

```shell
rustup default stable
```
### Debian

Partly the installations are similar between Arch Linux and Debian, but since I mainly develop on Debian in the office, you can find some additional information for Debian here.

**P.S.: I decided to use Debian because I need a permanently available system, but of course I have to make concessions with Debian, especially when it comes to updating the packages.**

#### Preparations

You can find the most important packages here, I need these for the installation and in the operating name of my system, plus other packages that are mapped directly via installation scripts.

```text
xorg, xinit, i3, dmenu, dex, kwalletmanager, pulseaudio, pulseaudio-equalizer, pulseaudio-module-bluetooth, pasystray, feh, kitty, zsh, git, make, tmux, neovim, chromium, jq, neofetch, thunar, gimp, vlc
``` 

#### Specific installations

##### Network Manager

In order to have a network manager under Debian, you must install the following package:

```shell
sudo apt install network-manager network-manager-gnome
```

Now you should activate and start the service once, you can do this with these two commands:

```shell
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
```

I have now stored the `nm-applet` in my [i3 configuration](.config/i3/config) so that it is automatically started in the window manager.

##### Bluetooth

If you want to install Bluetooth under Debian, you can do this as follows. First install the following packages:

```shell
sudo apt install bluez blueman
```
Once this has been installed, all that remains is to create and start the service, which works as follows:

```shell
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```
The `blueman-applet` can now be stored directly in the [i3 configuration](.config/i3/config) so that the GUI starts immediately when the system is started.

##### Wireguard

In order to install Wireguard under Debian, you have to proceed as follows. First install the following packages:

```shell
sudo apt install wireguard resolfconf
```

Now you can create the configuration file for Wireguard, this is located in `/etc/wireguard/wg0.conf`. After that you can start the service with the following command:

```shell
sudo systemctl enable wg-quick@wg0.service
sudo systemctl start wg-quick@wg0.service
```
