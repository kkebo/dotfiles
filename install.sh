#!/bin/sh -eux

BASEDIR=$(dirname "$(realpath "$0")")

ln -sf "$BASEDIR/.vimrc" "$HOME/"
ln -sf "$BASEDIR/.vim" "$HOME/"

mkdir -p "$HOME/.config"
ln -sf "$BASEDIR/.config/fish" "$HOME/.config/"
ln -sf "$BASEDIR/.mytheme.omp.json" "$HOME/"

ln -sf "$BASEDIR/.tmux.conf" "$HOME/"

ln -sf "$BASEDIR/.config/git" "$HOME/.config/"
ln -sf "$BASEDIR/.gitconfig" "$HOME/"
