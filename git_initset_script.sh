#!/bin/zsh

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
touch ~/.zshrc
cat ./settingfile > ~/.zshrc
    
/bin/echo "+ Make dir ~/.zsh/completion (add p option)"
mkdir -p ~/.zsh/completion/

/bin/echo "+ Download git-prompt.sh"
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv ./git-prompt.sh ~/.zsh/completion/

/bin/echo "+ Setting global user.name , user.email" 
/bin/echo "+ Add whoami username to user.name"
/bin/echo "*********"
whoami
/bin/echo "*********"

# set whoami.
git config --global user.name `whoami`

/bin/echo "+ Please input setting email ."
/bin/echo "※You can use private email on github and any git cloud service's private email ."
/bin/echo -n "» "

read email

# set input email.
git config --global user.email $email

echo "Done , Please check any setting files yourself ."
echo "Start your happy Git life . 🍀 "

