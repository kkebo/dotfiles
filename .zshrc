# Created by newuser for 5.0.2
export LANG=ja_JP.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -Uz compinit; compinit

setopt auto_cd
setopt auto_pushd
setopt print_eight_bit

##
autoload colors; colors
PROMPT="%n@%m:%{${fg[yellow]}%}%~%{${reset_color}%}%# "
setopt transient_rprompt
##

export PATH=$HOME/opt/cross/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/.cabal/bin:/usr/local/mysql/bin:/sbin:/usr/sbin:/usr/bin:$PATH

alias ls='gls --color=auto'

eval $(gdircolors ~/.dircolors-solarized)

alias ll='ls -l'
alias la='ls -la'

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

