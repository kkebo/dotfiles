umask 022
set -x LANG en_US.UTF-8

set -g fish_greeting

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

# Swift Package Manager
fish_add_path -P $HOME/.swiftpm/bin

# Mint
fish_add_path -P $HOME/.mint/bin

# Homebrew
fish_add_path -P /opt/homebrew/bin /opt/homebrew/sbin

# Visual Studio Code
fish_add_path -P /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Go
set -x GOPATH $HOME/go
fish_add_path -maP $GOPATH/bin

# cross compiler
fish_add_path -P $HOME/opt/cross/bin

# VirtualGL (macOS)
fish_add_path -P /opt/VirtualGL/bin

# oh-my-posh
if type -q oh-my-posh
    oh-my-posh init fish --config $HOME/.mytheme.omp.json | source
end

# direnv
if type -q direnv
    direnv hook fish | source
end

# done
set -g __done_min_cmd_duration 5000

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
    set -x MANROFFOPT "-c"
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
