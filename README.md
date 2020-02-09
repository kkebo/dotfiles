# dotfiles

My dotfiles for iPadOS, macOS, Linux, or Windows Subsystem for Linux.

## Prerequisites

- fish
  - [Fisher](https://github.com/jorgebucaran/fisher)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [bat](https://github.com/sharkdp/bat)
  - [lsd](https://github.com/Peltoche/lsd)
  - (macOS) `brew install terminal-notifier`
- tmux
  - `pip3 install powerline-status`
  - `pip3 install psutil`
- Vim 8 or later
  - Python 3

## Contents

### Vim (for 8.0 or later with Python 3 support)

- `.vimrc`
- `.vim/*`

### fish

- `.config/fish/config.fish`
- `.config/fish/fishfile`

### tmux

- `.tmux.conf`

### pip (for pip 9.0 or later)

- `.pip/*`

### Visual Studio Code

- `VSCode/*`

### Textastic

- `#Textastic/*`

### zsh (not maintained)

- `.zshrc`
- `.zprofile`
- `.zsh/*`

## Installation

```
cd $HOME
git clone <this repository>

# Install vim configuration
ln -s $HOME/dotfiles/.vimrc .
ln -s $HOME/dotfiles/.vim .

# Install fish configuration
ln -s $HOME/dotfiles/.config/fish .config/

# Install tmux configuration
ln -s $HOME/dotfiles/.tmux.conf .

# Install pip configuration
ln -s $HOME/dotfiles/.pip .

# Install Visual Studio Code configuration
cp settings.json <settings file location>
# <settings file location> is here:
#   Windows: %appdata%\Code\User\settings.json
#   macOS: $HOME/Library/Application Support/Code/User/settings.json
#   Linux: $HOME/.config/Code/User/settings.json
```

## TODO

- [ ] Installer shellscript
