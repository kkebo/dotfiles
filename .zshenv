setopt no_global_rcs

export LANG=en_US.UTF-8

PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

# cross compiler
if [ -e ~/opt/cross ]; then
	PATH=~/opt/cross/bin:$PATH
fi

export PATH

ZSH_PLUGINS_DIR=$HOME/.zsh

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
