#!/bin/sh -eu

BASEDIR=$(cd "$(dirname "$0")" && pwd -P)
RELBASEDIR=${BASEDIR#"$HOME/Documents/"}

cd "$HOME/Documents"

ln -sf "$RELBASEDIR/.vimrc" .
ln -sf "$RELBASEDIR/.vim" .

ln -sf "$RELBASEDIR/.profile.ashell" .profile
ln -sf "$RELBASEDIR/.bashrc.ashell" .bashrc
ln -sf "$RELBASEDIR/.toolbarDefinition" .

mkdir -p .config
# FIXME: `ln` can't link to "../somewhere" in dash
ln -sfh "$BASEDIR/.config/git.ashell" .config/git
