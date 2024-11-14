#!/bin/sh -eux

BASEDIR=$(cd "$(dirname "$0")" && pwd -P)
RELBASEDIR=${BASEDIR#"$HOME/"}

cd

ln -sf "$RELBASEDIR/.vimrc" .
ln -sf "$RELBASEDIR/.vim" .

mkdir -p .config
ln -sf "../$RELBASEDIR/.config/fish" .config/
ln -sf "../$RELBASEDIR/.config/omp" .config/

ln -sf "../$RELBASEDIR/.config/tmux" .config/

ln -sf "../$RELBASEDIR/.config/git" .config/
