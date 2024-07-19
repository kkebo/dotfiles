#!/bin/sh -eux

BASEDIR=$PWD

ln -sf "$BASEDIR/.vimrc" "$HOME/Documents/"
ln -sf "$BASEDIR/.vim" "$HOME/Documents/"

ln -sf "$BASEDIR/.profile.ashell" "$HOME/Documents/.profile"
ln -sf "$BASEDIR/.bashrc.ashell" "$HOME/Documents/.bashrc"

mkdir -p "$HOME/Documents/.config"
ln -sf "$BASEDIR/.config/git" "$HOME/Documents/.config/"
ln -sf "$BASEDIR/.gitconfig" "$HOME/Documents/"
