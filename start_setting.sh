#!/bin/sh
set -eux

<<COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc → .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT
printf "************************************************\n"
printf "Welcome to dotfile-initset-script ver: 1.0\n"
printf "Caution! , this script support only macOS's zsh .\n"
printf "************************************************\n"

printf "Make .zshrc on home\n"
ln -nfs $(pwd)/zshrc ~/.zshrc
mkdir -p ~/.zsh/completion
printf "Download git-prompt.sh\n"
curl -fLo ~/.zsh/completion/git-prompt.sh --create-dirs https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
printf "_docker\n"
readonly ETC=/Applications/Docker.app/Contents/Resources/etc
ln -nfs $ETC/docker.zsh-completion ~/.zsh/completion/_docker
printf "_docker-compose\n"
ln -nfs $ETC/docker-compose.zsh-completion ~/.zsh/completion/_docker-compose

printf "Make .vimrc on home\n"
ln -nfs $(pwd)/vimrc ~/.vimrc
# vim plugin manager vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "Setting global user.name , user.email\n"
printf "Add whoami username to user.name\n"
printf "*********\n"
whoami
printf "*********\n"
cp gitconfig_addon ~/.gitconfig
git config --global user.name $(whoami)
if [ -z "${1:-}" ]; then
    printf "No email setting.\n"
else
    git config --global user.email $1
fi

printf "Done , Please check any setting files yourself .\n"
printf "Start your happy Coding life . 🍀 \n"
