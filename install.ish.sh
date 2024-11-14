#!/bin/sh -eux

BASEDIR=$(cd "$(dirname "$0")" && pwd -P)
RELBASEDIR=${BASEDIR#"$HOME/"}

cd

ln -sf "$RELBASEDIR/.vimrc.ish" .vimrc

mkdir -p .config
ln -sf "../$RELBASEDIR/.config/fish" .config/

ln -sf "../$RELBASEDIR/.config/git" .config/
