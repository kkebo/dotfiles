#!/bin/sh -eux

BASEDIR="$(dirname "$(realpath "$0")")"

ln -s "$BASEDIR/.vimrc" "$HOME/"
ln -s "$BASEDIR/.vim" "$HOME/"

mkdir -p "$HOME/.config"
ln -s "$BASEDIR/.config/fish" "$HOME/.config/"
ln -s "$BASEDIR/.mytheme.omp.json" "$HOME/"

ln -s "$BASEDIR/.tmux.conf" "$HOME/"
