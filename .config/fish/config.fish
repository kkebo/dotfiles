umask 022
set -x LANG en_US.UTF-8

set -g fish_greeting

# Swift Package Manager
fish_add_path -mP $HOME/.swiftpm/bin

# Homebrew
fish_add_path -mP /opt/homebrew/bin /opt/homebrew/sbin

# Visual Studio Code
fish_add_path -mP /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Go
set -x GOPATH $HOME/go
fish_add_path -maP $GOPATH/bin

# oh-my-posh
if string match -q -r '^(.*256col.*|alacritty|xterm-ghostty)$' $TERM; and type -q oh-my-posh
    oh-my-posh init fish --config $HOME/.config/omp/theme.omp.json | source > /dev/null
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
