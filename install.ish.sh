#!/bin/sh -eux

BASEDIR=$(dirname "$(realpath "$0")")

ln -sf "$BASEDIR/.vimrc.ish" "$HOME/.vimrc"

mkdir -p "$HOME/.config"
ln -sf "$BASEDIR/.config/fish" "$HOME/.config/"

ln -sf "$BASEDIR/.config/git" "$HOME/.config/"
ln -sf "$BASEDIR/.gitconfig" "$HOME/"
