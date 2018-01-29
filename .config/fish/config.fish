umask 022
set -x PATH /bin /sbin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin $PATH
set -x EDITOR vim
set -x LANG en_US.UTF-8

# For WSL
if uname -r | string match -r 'Microsoft$'
	set -x LIBGL_ALWAYS_INDIRECT 1
	set -x DISPLAY localhost:0.0
	set -x GTK_MODULES $GTK_MODULES appmenu-gtk-module
	set -x UBUNTU_MENUPROXY 1
	set -x NO_AT_BRIDGE 1
	set -x XMODIFIERS @im=fcitx
	set -x GTK_IM_MODULE fcitx
	set -x QT_IM_MODULE fcitx
end

# Rustup
if test -e $HOME/.cargo/bin
    set -x PATH $HOME/.cargo/bin $PATH
end

# Visual Studio Code
if test -e /Applications/Visual Studio Code.app/Contents/Resources/app/bin
	set -x PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH
fi

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# cross compiler
if test -e $HOME/opt/cross
    set -x PATH $HOME/opt/cross/bin $PATH
end

# Python (macOS)
if test -e $HOME/Library/Python/2.7/bin
    set -x PATH $HOME/Library/Python/2.7/bin $PATH
end

# VirtualGL (macOS)
if test -e /opt/VirtualGL/bin
    set -x PATH /opt/VirtualGL/bin $PATH
end
