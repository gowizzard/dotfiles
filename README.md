# dotfiles

Here you can find my dotfiles and configurations that I use on my macOS system. I have been using these configurations for a while now, and I am quite happy with them. I have tried to keep the configurations as simple as possible, so that they can be easily understood and modified.

> [!NOTE]
> I have recently switched to macOS, so I am still in the process of setting up my system. I will update this repository as I make changes.

![macOS](https://github.com/user-attachments/assets/f7ce588e-80bd-48b8-af45-e4899843cf01)

This repository contains dotfiles and configuration settings for:

- Fish: My shell of choice.
- Ghostty: A fast, feature-rich, and cross-platform terminal emulator.
- Rex: Terminal multiplexer to manage sessions, tabs and panes.
- Neovim: My text editor of choice for terminal.
- Starship: A minimal, fast, and customizable prompt for any shell.
- Hammerspoon: A powerful automation tool for macOS.
- Karabiner-Elements: Keyboard customizer for macOS.
- Git: My version control of choice.
- Claude Code: Global settings, agents, commands and skills.
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

### Autoupdate

To keep all packages up to date automatically, I use the `homebrew/autoupdate` tap. It runs `brew upgrade` and `brew cleanup` every 24 hours in the background via launchd. To enable it, run the following command in the terminal.

```shell
brew autoupdate start 86400 --upgrade --cleanup
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

## Ghostty

The color theme `jjideenschmiede` is based on the colors of the J&J Ideenschmiede logo and lives in `.config/ghostty/themes`. Ghostty starts the shell directly, so no multiplexer is configured here.

## Rex

The Rex configuration lives in `.config/rex`. `init.lua` loads the custom actions from `actions.lua`, `projects.lua` and `updates.lua` and binds them in `keys.lua`. All actions also appear in the command palette.

| Shortcut | Action |
| --- | --- |
| `⌘W` | Close the focused pane, or the whole tab when it is the last pane. |
| `⌘⌥C` | Copy the output of the last command to the clipboard. |
| `⌘⌥⇧C` | Copy the last command together with its output. |
| `⌘P` | Change the focused shell to the projects directory and open Go to Directory there. |
| `⌘⇧K` | Start Claude Code on the left of the focused pane in the same directory. |
| `⌘⇧O` | Open the origin remote of the focused pane's repository in the browser. |
| `⌘⇧U` | Run `update_all` in a background tab named `updates`, or focus that tab when it is already open. |
| `⌘⇧T` | Open the YouTrack ticket named in the current git branch, such as `feature/daily-627-…`. |

Tabs are also named automatically. `autostart.lua` starts `auto-label.lua` in the background once per login. Whenever the focused shell changes its directory, the script names the tab after the repository or directory. Tabs you rename yourself keep their name. After editing the script, run Restart Automatic Tab Names from the command palette. Its log is in `~/Library/Logs/rex-auto-label.log`.

The YouTrack address is internal, so it lives in `.config/rex/local.lua`, which git ignores. Create it on a new machine with the following content.

```lua
return {
  youtrack_url = "https://youtrack.example.com",
}
```

Rex does not watch the configuration file, so reload it after every change.

```shell
rex config reload
```

The theme is not part of the Rex configuration and has to be imported once in the app. Open the command palette, run the Ghostty import and select the following file.

```text
~/.config/ghostty/themes/jjideenschmiede
```

## Git hooks

This repository is public, so a pre-commit hook blocks commits that contain an `autoMode` block in the Claude Code settings, tokens, private keys or passwords. Claude Code only reads `autoMode` from `~/.claude/settings.json`, which is linked to this repository, so a git filter removes the block from every commit while the local file keeps it. To enable both after cloning the repository, run the following commands in the dotfiles directory.

```shell
git config core.hooksPath .githooks
git config filter.strip-automode.clean "jq --indent 2 'del(.autoMode)'"
git config filter.strip-automode.smudge cat
git config filter.strip-automode.required true
```
