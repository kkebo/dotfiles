#!/bin/sh -eux

BASEDIR="$(dirname "$(realpath "$0")")"

ln -s "$BASEDIR/.vimrc.ish" "$HOME/.vimrc"

mkdir -p "$HOME/.config"
ln -s "$BASEDIR/.config/fish" "$HOME/.config/"

ln -s "$BASEDIR/.gitconfig" "$HOME/"
