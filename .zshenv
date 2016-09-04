setopt no_global_rcs

export LANG=ja_JP.UTF-8
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

# cross compiler
if [ -e ~/opt/cross ]; then
	PATH=~/opt/cross/bin:$PATH
fi

export PATH
