#!/bin/sh -eux

BASEDIR=$(dirname "$PWD/$0")
RELBASEDIR=${BASEDIR#"$HOME/"}

cd

ln -sf "$RELBASEDIR/.vimrc" .
ln -sf "$RELBASEDIR/.vim" .

ln -sf "$RELBASEDIR/.profile.ashell" .profile
ln -sf "$RELBASEDIR/.bashrc.ashell" .bashrc

mkdir -p .config
ln -sf "../$RELBASEDIR/.config/git" .config/
ln -sf "$RELBASEDIR/.gitconfig" .
