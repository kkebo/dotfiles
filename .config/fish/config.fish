umask 022
set -x LANG en_US.UTF-8

# For WSL
if uname -r | string match -q -r 'Microsoft$'
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

# Swiftly
if test -e $HOME/.local/bin
    set -x PATH $HOME/.local/bin $PATH
end

# Mint
if test -e $HOME/.mint/bin
    set -x PATH $HOME/.mint/bin $PATH
end

# Homebrew
if test -e /opt/homebrew/bin
    set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
end

# Visual Studio Code
if test -e "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    set -x PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH
end

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# cross compiler
if test -e $HOME/opt/cross
    set -x PATH $HOME/opt/cross/bin $PATH
end

# VirtualGL (macOS)
if test -e /opt/VirtualGL/bin
    set -x PATH /opt/VirtualGL/bin $PATH
end

# bobthefish
set -g theme_nerd_fonts yes
set -g theme_color_scheme default
set -g theme_display_git_default_branch yes
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# done
set -U __done_min_cmd_duration 5000

# Preferences
if type -q vim
    set -x EDITOR vim
    if uname -r | string match -q -r -- '-ish$'
        alias vim="vim -N -u $HOME/.vimrc"
    end
    alias view="vim -RM"
    alias vi="vim"
end
if type -q bat
    alias cat="bat"
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
if type -q rg
    alias grep="rg"
end
if type -q lsd
    alias ls="lsd"
    alias ll="ls -l"
    alias la="ls -la"
    alias lt="ls --tree"
end
