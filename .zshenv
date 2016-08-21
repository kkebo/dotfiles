setopt no_global_rcs

export LANG=ja_JP.UTF-8
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

PATH=/usr/bin:/usr/local/bin:$PATH

# cross compiler
if [ -e ~/opt/cross ]; then
	PATH=~/opt/cross/bin:$PATH
fi

export PATH
