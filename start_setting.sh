#!/bin/sh -eux

if [ -z "${1:-""}" ]; then
  exit 1
fi

cp gitconfig_addon ~/.gitconfig
git config --global user.name "$(whoami)"
git config --global user.email "$1"

ln -fs "$(pwd)"/zshrc ~/.zshrc
ln -fs "$(pwd)"/vimrc ~/.vimrc

mkdir -p ~/.vim/autoload
cd ~/.vim/autoload
curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

