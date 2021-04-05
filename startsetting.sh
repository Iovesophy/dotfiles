#!/bin/zsh

# Explain this tool .
/bin/echo "************************************************"
/bin/echo "Welcome to dotfile-initset-script ver: 1.0"
/bin/echo "Caution! , this script support only macOS's zsh ."
/bin/echo "************************************************"

<<COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc → .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT

/bin/echo "+ Make .zshrc on home"
ln -nfs `pwd`/zshrc ~/.zshrc
    
/bin/echo "+ Make dir ~/.zsh/completion (add p option)"
mkdir -p ~/.zsh/completion/

/bin/echo "+ Download git-prompt.sh"
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.zsh/completion/

/bin/echo "+ Setting global user.name , user.email" 
/bin/echo "+ Add whoami username to user.name"
/bin/echo "*********"
whoami
/bin/echo "*********"

# Set name.
# git config --global user.name `whoami`
name=`whoami`
email=`cat gitconfig | tail -n 1`
rm `pwd`/gitconfig
echo "[user]" >> `pwd`/gitconfig
echo "        name = ${name}" >> `pwd`/gitconfig

# Set email.
echo $1
if [ -n "$1" ]; then
    # git config --global user.email $1
    echo "        email = ${1}" >> `pwd`/gitconfig
else
    echo No email setting.
    echo "${email}" >> `pwd`/gitconfig
fi
ln -nfs `pwd`/gitconfig ~/.gitconfig

/bin/echo "+ Make .zshrc on home"
mkdir -p ~/.zsh/completion

/bin/echo "+ Download _docker-compose"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

/bin/echo "+ Make .vimrc on home"
touch ~/.vimrc

/bin/echo "+ symlink .vimrc on home"
ln -nfs `pwd`/vimrc ~/.vimrc
ln -nfs `pwd`/vimrc ~/vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exec $SHELL -l

echo "Done , Please check any setting files yourself ."
echo "Start your happy Coding life . 🍀 "
