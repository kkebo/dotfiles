umask 022
export PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8

# For WSL
if [[ $(uname -r) =~ Microsoft$ ]]; then
	export LIBGL_ALWAYS_INDIRECT=1
	export DISPLAY=localhost:0.0
	export GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
	export UBUNTU_MENUPROXY=1
	export NO_AT_BRIDGE=1
	export XMODIFIERS=@im=fcitx
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
fi

# Rustup
if [ -e $HOME/.cargo/bin ]; then
	export PATH=$HOME/.cargo/bin:$PATH
fi

# Visual Studio Code
if [[ "$OSTYPE" == darwin* ]]; then
	export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Node.js
if [ -e $HOME/.nvm ]; then
	export NVM_DIR=$HOME/.nvm
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	[ -s /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh
	nvm use 9.3
fi

# cross compiler
if [ -e ~/opt/cross ]; then
	export PATH=~/opt/cross/bin:$PATH
fi
