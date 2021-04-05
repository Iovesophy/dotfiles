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
ln -nfs $(pwd)/zshrc ~/.zshrc
    
printf "Make dir ~/.zsh/completion (add p option)\n"
mkdir -p ~/.zsh/completion/

printf "Download git-prompt.sh\n"
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
mv $(pwd)/git-prompt.sh ~/.zsh/completion/git-prompt.sh

printf "Setting global user.name , user.email\n" 
printf "Add whoami username to user.name\n"
printf "*********\n"
whoami
printf "*********\n"

# Set name.
name=$(whoami)
email=$(cat gitconfig | head -n 3 | tail -n 1)
rm $(pwd)/gitconfig
printf "[user]\n" >> $(pwd)/gitconfig
printf "        name = ${name}\n" >> $(pwd)/gitconfig

# Set email.
if [[ -z "${1:-}" ]]; then
    printf "${email}\n" >> $(pwd)/gitconfig
    printf "No email setting.\n"
else
    printf "        email = ${1}\n" >> `pwd`/gitconfig
fi
cat $(pwd)/gitconfig_addon >> $(pwd)/gitconfig

ln -nfs $(pwd)/gitconfig ~/.gitconfig

printf "Make .zshrc on home\n"
mkdir -p ~/.zsh/completion

printf "_docker-compose\n"
etc=/Applications/Docker.app/Contents/Resources/etc
ln -nfs $etc/docker.zsh-completion ~/.zsh/completion/_docker
ln -nfs $etc/docker-compose.zsh-completion ~/.zsh/completion/_docker-compose
#curl -LO https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

printf "Make .vimrc on home\n"
touch ~/.vimrc

printf "symlink .vimrc on home\n"
ln -nfs $(pwd)/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exec $SHELL -l

printf "Done , Please check any setting files yourself .\n"
printf "Start your happy Coding life . 🍀 \n"
