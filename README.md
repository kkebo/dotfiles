# dotfiles

My dotfiles for macOS, Linux, or Windows Subsystem for Linux.

## Prerequisites

- fish
- tmux
- vim
- Python 3
- ag
- git
- `pip3 install powerline-status`
- `pip3 install neovim`
- `pip3 install psutil`
- (macOS) `brew install terminal-notifier`

## Contents

### vim (for 8.0 or higher with Python 3 supports)

- `.vimrc`
- `.vim/*`

### fish

- `.config/fish/config.fish`

### tmux

- `.tmux.conf`

### pip (for pip 9.0 or higher)

- `.pip/*`

### Visual Studio Code

- `VSCode/*`

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
mkdir -p .config/fish
ln -s $HOME/dotfiles/.config/fish/config.fish .config/fish/

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
