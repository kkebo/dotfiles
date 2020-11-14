xrdb -merge $HOME/.Xresources
xmodmap $HOME/.xmodmaprc

# fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx

feh --bg-center $HOME/wallpapers/ipados.jpg &

# exec i3
# exec $HOME/.cabal/bin/xmonad
exec xmonad
