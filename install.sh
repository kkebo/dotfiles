#!/bin/sh -eux

BASEDIR=$(dirname "$(realpath "$0")")

cd

ln -sf "$BASEDIR/.vimrc" .
ln -sf "$BASEDIR/.vim" .

mkdir -p .config
ln -sf "$BASEDIR/.config/fish" .config/
ln -sf "$BASEDIR/.mytheme.omp.json" .

ln -sf "$BASEDIR/.tmux.conf" .

ln -sf "$BASEDIR/.config/git" .config/
ln -sf "$BASEDIR/.gitconfig" .
