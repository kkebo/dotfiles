# dotfiles

My dotfiles for iPadOS, macOS, FreeBSD, Linux, and Windows Subsystem for Linux.

## Installation (a-Shell on iPadOS)

```shell
lg2 clone <this repository>
cd dotfiles
lg2 submodule update --init --recursive
./install.ashell.sh
```

## Installation (macOS, FreeBSD, Linux, or WSL)

```shell
git clone --recurse-submodules -j8 <this repository>
cd dotfiles
./install.sh
```

## Installation (iSH on iPadOS)

```shell
git clone --recurse-submodules <this repository>
cd dotfiles
./install.ish.sh
```

## Vim

### Prerequisites

- iPadOS (iVim, a-Shell, iSH), macOS, FreeBSD, Linux, or WSL
- Vim 8.0 or later with Python 3 support
- Python 3
- [yank](https://github.com/sunaku/home/blob/master/bin/yank) (For OSC52)

### Files

- `.vimrc`
- `.vim/*`
- `.vimrc.ish` (For iSH)

## fish

### Prerequisites

- macOS, FreeBSD, Linux, or WSL
- fish
  - [Fisher](https://github.com/jorgebucaran/fisher)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [bat](https://github.com/sharkdp/bat)
  - [lsd](https://github.com/Peltoche/lsd)
  - (macOS) `brew install terminal-notifier`
- [oh-my-posh](https://ohmyposh.dev)

### Files

- `.config/fish/config.fish`
- `.config/fish/fishfile`

## tmux

### Prerequisites

- macOS, FreeBSD, Linux, or WSL
- `pip3 install powerline-status`
- `pip3 install psutil`
- [yank](https://github.com/sunaku/home/blob/master/bin/yank) (For OSC52)

### Files

- `.tmux.conf`

## Git

### Prerequisites

- macOS, FreeBSD, Linux, or WSL
- Git

### Files

- `.gitconfig`
- `.config/git/ignore`

## Textastic

### Prerequisites

- iPadOS
- Textastic

### Files

- `#Textastic/*`

## a-Shell

### Prerequisites

- iPadOS
- a-Shell

### Files

- `.profile.ashell`
  - Rename it to `.profile`
