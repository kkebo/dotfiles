# dotfiles

My dotfiles for iPadOS, macOS, FreeBSD, Linux, and Windows Subsystem for Linux.

## Installation (a-Shell on iPadOS)

```shell
cd
lg2 clone <this repository>
cd dotfiles
lg2 submodule update --init --recursive
cd ..

# Install .profile and .bashrc
ln -s dotfiles/.profile.ashell .profile
ln -s dotfiles/.bashrc.ashell .bashrc

# Install vim configuration
ln -s dotfiles/.vimrc .
ln -s dotfiles/.vim .
```

## Installation (macOS, FreeBSD, Linux, or WSL)

```shell
cd
git clone --recurse-submodules -j8 <this repository>

# Install vim configuration
ln -s $HOME/dotfiles/.vimrc .
ln -s $HOME/dotfiles/.vim .

# Install fish configuration
ln -s $HOME/dotfiles/.config/fish .config/
ln -s $HOME/dotfiles/.mytheme.omp.json .mytheme.omp.json

# Install tmux configuration
ln -s $HOME/dotfiles/.tmux.conf .
```

## Installation (iSH on iPadOS)

```shell
cd
git clone --recurse-submodules <this repository>

# Install vim configuration
ln -s $HOME/dotfiles/.vimrc.ish .vimrc

# Install fish configuration
ln -s $HOME/dotfiles/.config/fish .config/
```

## Vim

### Prerequisites

- iPadOS (iVim, a-Shell, iSH), macOS, FreeBSD, Linux, or WSL
- Vim 8.0 or later with Python 3 support
- Python 3

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
- tmux
  - `pip3 install powerline-status`
  - `pip3 install psutil`

### Files

- `.tmux.conf`

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

## TODO

- [ ] Installer shellscript
