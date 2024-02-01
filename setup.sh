#!/bin/sh -eux

if [ -z "${1:-""}" ]; then
  exit 1
fi

cp gitconfig_addon ~/.gitconfig
git config --global user.name "$2"
git config --global user.email "$1"

mkdir -p ~/.zsh
cd ~/.zsh
curl -o git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
cd -

ln -fs "$(pwd)"/zshrc ~/.zshrc
ln -fs "$(pwd)"/vimrc ~/.vimrc

mkdir -p ~/.config/nvim/
touch ~/.config/nvim/init.vim
ln -fs "$(pwd)"/vimrc ~/.config/nvim/init.vim
