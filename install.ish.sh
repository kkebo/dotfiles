#!/bin/sh -eux

BASEDIR=$(dirname "$(realpath "$0")")

cd

ln -sf "$BASEDIR/.vimrc.ish" .vimrc

mkdir -p .config
ln -sf "$BASEDIR/.config/fish" .config/

ln -sf "$BASEDIR/.config/git" .config/
ln -sf "$BASEDIR/.gitconfig" .
