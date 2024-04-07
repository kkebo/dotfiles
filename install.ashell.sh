#!/bin/sh -eux

BASEDIR="$PWD"

ln -s "$BASEDIR/.vimrc" "$HOME/Documents/"
ln -s "$BASEDIR/.vim" "$HOME/Documents/"

ln -s "$BASEDIR/.profile.ashell" "$HOME/Documents/.profile"
ln -s "$BASEDIR/.bashrc.ashell" "$HOME/Documents/.bashrc"

ln -s "$BASEDIR/.gitconfig" "$HOME/Documents/"
