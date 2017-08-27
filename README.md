# dotfiles

My dotfiles for macOS, Linux, or Windows Subsystem for Linux.

## Contents
- `.vimrc`
	- vim 設定ファイル
- `.vim/dein*`
	- vim のプラグイン定義
- `.zshrc` and `.zshenv`
	- zsh 設定ファイル
- `.zsh/installer.sh`
	- zsh のプラグインインストーラ
- `settings.json`
	- Visual Studio Code 設定ファイル

## Installation
```
cd dotfiles
cp -rp .vimrc .zsh* ~
cp .vim/dein* ~/.vim/
cp settings.json <settings file location>
# <settings file location> is here:
#   Windows: %appdata%\Code\User\settings.json
#   macOS: $HOME/Library/Application Support/Code/User/settings.json
#   Linux: $HOME/.config/Code/User/settings.json
```

## TODO
- [ ] Installer shellscript
