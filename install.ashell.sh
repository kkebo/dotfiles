#!/bin/sh -eu

BASEDIR=$(cd "$(dirname "$0")" && pwd -P)
RELBASEDIR=${BASEDIR#"$HOME/Documents/"}

cd $HOME/Documents

ln -sf "$RELBASEDIR/.vimrc" .
ln -sf "$RELBASEDIR/.vim" .

ln -sf "$RELBASEDIR/.profile.ashell" .profile
ln -sf "$RELBASEDIR/.bashrc.ashell" .bashrc

mkdir -p .config
ln -sf "../$RELBASEDIR/.config/git" .config/
ln -sf "$RELBASEDIR/.gitconfig" .
