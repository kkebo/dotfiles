# dotfiles

My dotfiles for iPadOS, macOS, FreeBSD, Linux, or Windows Subsystem for Linux.

## Vim

### Prerequisites

- iPadOS (iVim, a-Shell, iSH), macOS, FreeBSD, Linux, or WSL
- Vim 8.0 or later with Python 3 support
- Python 3

### Files

- `.vimrc`
- `.vim/*`

## fish

### Prerequisites

- macOS, FreeBSD, Linux, or WSL
- fish
  - [Fisher](https://github.com/jorgebucaran/fisher)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [bat](https://github.com/sharkdp/bat)
  - [lsd](https://github.com/Peltoche/lsd)
  - (macOS) `brew install terminal-notifier`

### Files

- `.config/fish/config.fish`
- `.config/fish/fishfile`

## tmux

### Prerequisites

- macOS, FreeBSD, Linux, or WSL
- tmux
  - `pip3 install powerline-status`
  - `pip3 install psutil`

### Files

- `.tmux.conf`

## pip

### Prerequisites

- iPadOS (iVim, a-Shell, iSH), macOS, FreeBSD, Linux, or WSL
- pip 9.0 or later

### Files

- `.pip/*`

## Textastic

### Prerequisites

- iPadOS

### Files

- `#Textastic/*`

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
```

## TODO

- [ ] Installer shellscript
