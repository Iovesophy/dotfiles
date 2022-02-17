#!/bin/sh -eux

ln -fs "$(pwd)"/zshrc ~/.zshrc
ln -fs "$(pwd)"/vimrc ~/.vimrc

cp gitconfig_addon ~/.gitconfig
git config --global user.name "$(whoami)"
if [ -z "${1:-""}" ]; then
  printf "No email setting.\n"
else
  git config --global user.email "$1"
fi

mkdir -p ~/.zsh/completion
cd ~/.zsh/completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

mkdir -p ~/.vim/autoload
cd ~/.vim/autoload
curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
