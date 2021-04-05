#!/bin/zsh

# Explain this tool .
/bin/echo "************************************************"
/bin/echo "Welcome to git-initset-script ver: 1.0"
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

/bin/echo "+ Download _docker-compose"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

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

echo "Done , Please check any setting files yourself ."
echo "Start your happy Git life . 🍀 "
