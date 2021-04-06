#!/bin/sh
set -eux

# Explain this tool .
printf "************************************************\n"
printf "Welcome to dotfile-initset-script ver: 1.0\n"
printf "Caution! , this script support only macOS's zsh .\n"
printf "************************************************\n"

<<COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc → .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT

printf "Make .zshrc on home\n"
cp zshrc ~/.zshrc

printf "Make .zshrc on home\n"
mkdir -p ~/.zsh/completion

printf "Download git-prompt.sh\n"
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv git-prompt.sh ~/.zsh/completion/

printf "Setting global user.name , user.email\n"
printf "Add whoami username to user.name\n"
printf "*********\n"
whoami
printf "*********\n"

cp gitconfig_addon ~/.gitconfig

# Set name.
git config --global user.name $(whoami)

# Set email.
if [ -z "${1:-}" ]; then
    printf "No email setting.\n"
else
    git config --global user.email $1
fi

printf "_docker-compose\n"
readonly ETC=/Applications/Docker.app/Contents/Resources/etc
ln -nfs $ETC/docker.zsh-completion ~/.zsh/completion/_docker
ln -nfs $ETC/docker-compose.zsh-completion ~/.zsh/completion/_docker-compose

printf "Make .vimrc on home\n"
cp vimrc ~/.vimrc
cp vimrc ~/.config/nvim/init.vim

# vimのプラグインマネージャー vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "Done , Please check any setting files yourself .\n"
printf "Start your happy Coding life . 🍀 \n"
