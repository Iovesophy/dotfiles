#!/bin/zsh
/bin//bin/echo "Welcome to git-initset-script ver: 1.0"
/bin/echo "Caution! , this script is test script."

/bin/echo -n "Is your shell zsh?y,n: "
read ans
if [ $ans = "y" ]; then
	/bin/echo ""
	/bin/echo "ok continue."
else
	/bin/echo ""
	/bin/echo "not support."
	exit 0
fi

/bin/echo -n "Do you have .zshrc files?y,n: "

read ans
if [ $ans = "n" ]; then
	/bin/echo ""
	/bin/echo "ok set .zshrc"
	/bin/echo "+ make .zshrc on home"
	touch ~/.zshrc
	cat ./settingfile-zshrc.txt >> ~/.zshrc
else
	/bin/echo ""
	/bin/echo "please manual setting , not support."
	exit 0
fi

/bin/echo "+ make dir ~/.zsh/completion (add p option)"
mkdir -p ~/.zsh/completion/

/bin/echo "+ dowmload git-prompt.sh"
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
cp ./git-prompt.sh ~/.zsh/completion/git-prompt.sh

/bin/echo "+ gen ssh-key"
ssh-keygen
cat .ssh/id_rsa.pub | pbcopy

/bin/echo "+ ok gen ssh-key,next you need setting id_rsa.pub key ※already copied on clipboard."


/bin/echo -n "already paste any git cloud service?y: "
read ans
if [ $ans = "y" ]; then
	/bin/echo ""
	/bin/echo "ok continue."
else
	/bin/echo ""
	/bin/echo "please setting."
fi

/bin/echo "+ git config settings"
/bin/echo -n "Do you need git config on global?y,n: "
read ans
if [ $ans = "y" ]; then
	/bin/echo ""
	/bin/echo "ok set global"
	/bin/echo "+ set user.name user.email"

	/bin/echo "please input setting name. ※you can use github username"
	read name
	/bin/echo "please input setting email. ※you can use github email or Keep my email addresses private's email."
	read email
	git config --global user.name $name
	git config --global user.email $email
else
	/bin/echo ""
	/bin/echo "ok skip git config settings."
fi

echo "Done. Please check any setting files yourself."

