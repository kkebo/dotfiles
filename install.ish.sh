#!/bin/sh -eux

BASEDIR=$(dirname "$(realpath "$0")")
RELBASEDIR=${BASEDIR#"$HOME/"}

cd

ln -sf "$RELBASEDIR/.vimrc.ish" .vimrc

mkdir -p .config
ln -sf "../$RELBASEDIR/.config/fish" .config/

ln -sf "../$RELBASEDIR/.config/git" .config/
ln -sf "$RELBASEDIR/.gitconfig" .
