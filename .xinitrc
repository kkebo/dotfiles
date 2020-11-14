xrdb -merge $HOME/.Xresources

# fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx

export GTK_THEME=Adwaita:dark

feh --bg-center $HOME/wallpapers/ipados.jpg &

# exec i3
# exec $HOME/.cabal/bin/xmonad
exec xmonad
