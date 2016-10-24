# Created by newuser for 5.0.2
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -Uz compinit; compinit
zstyle ':completion:*:default' menu select=2

setopt auto_cd
setopt auto_pushd
setopt print_eight_bit
setopt prompt_subst

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
function get_vcs_info() {
	psvar=()
	vcs_info
	[[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd get_vcs_info

##
autoload colors; colors
PROMPT="%n@%m:%{${fg[yellow]}%}%~%{${reset_color}%}%# "
RPROMPT="%v"
setopt transient_rprompt
##

# gls
if [ -e /usr/local/bin/gls ]; then
	alias ls='gls --color=auto'
else
	alias ls='ls --color=auto'
fi

alias ll='ls -l'
alias la='ls -la'

# zsh-syntax-highlighting
if [ -e $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/highlighters
elif [ -e $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/share/zsh-syntax-highlighting/highlighters
fi

# zsh-history-substring-search
if [ -e $ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
	source $ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

	# bind UP and DOWN arrow keys
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
fi

# zsh-completions
if [ -e $ZSH_PLUGINS_DIR/zsh-completions ]; then
	fpath=($ZSH_PLUGINS_DIR/zsh-completions $fpath)
elif [ -e $ZSH_PLUGINS_DIR/zsh-completions/share/zsh-completions ]; then
	fpath=($ZSH_PLUGINS_DIR/zsh-completions/share/zsh-completions $fpath)
fi

# zsh-autosuggestions
if [ -e $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -e $ZSH_PLUGINS_DIR/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source $ZSH_PLUGINS_DIR/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
