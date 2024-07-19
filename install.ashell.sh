#!/bin/sh -eux

BASEDIR=$PWD

cd

ln -sf "$BASEDIR/.vimrc" .
ln -sf "$BASEDIR/.vim" .

ln -sf "$BASEDIR/.profile.ashell" .profile
ln -sf "$BASEDIR/.bashrc.ashell" .bashrc

mkdir -p .config
ln -sf "$BASEDIR/.config/git" .config/
ln -sf "$BASEDIR/.gitconfig" .
