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

export LANG=en_US.UTF-8
if [ -e $HOME/.cargo/bin ]; then
	export PATH=$HOME/.cargo/bin:$PATH
fi

# cross compiler
if [ -e ~/opt/cross ]; then
	export PATH=~/opt/cross/bin:$PATH
fi

umask 022
