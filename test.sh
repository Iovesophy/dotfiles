#!/bin/bash
# not support function on sh , so set bash.
set -eux

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"

function Check()
{
    printf "${1}\n"
    if [ ${1} = 0 ]; then
        :
    else
        printf '\033[31m%s\033[m\n' "Error: code ${1}"
        exit 0
    fi
}

cd /root/dotfiles
./start_setting.sh
Check $? 

zshrc_o=`md5sum /root/dotfiles/zshrc | awk '{print $1}'`
zshrc_b=`md5sum /root/.zshrc | awk '{print $1}'`
vimrc_o=`md5sum /root/dotfiles/zshrc | awk '{print $1}'`
vimrc_b=`md5sum /root/.zshrc | awk '{print $1}'`
if [ $zshrc_o = $zshrc_b -a $vimrc_o = $vimrc_b ]; then
    :
else
    exit 1
fi

vint /root/.vimrc
Check $? 

grunt zshlint
Check $? 

# 2 times program exec test.
./start_setting.sh
./start_setting.sh
Check $? 

zshrc_o=`md5sum /root/dotfiles/zshrc | awk '{print $1}'`
zshrc_b=`md5sum /root/.zshrc | awk '{print $1}'`
vimrc_o=`md5sum /root/dotfiles/zshrc | awk '{print $1}'`
vimrc_b=`md5sum /root/.zshrc | awk '{print $1}'`
if [ $zshrc_o = $zshrc_b -a $vimrc_o = $vimrc_b ]; then
    :
else
    exit 1
fi

vint /root/.vimrc
Check $? 

grunt zshlint
Check $? 

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
