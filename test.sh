#!/bin/bash
# not support function on sh , so set bash.
set -eu

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"
Ckecklog=()

function Check()
{
    echo ${1}
    if [ ${1} = 0 ]; then
        echo ok
    else
        echo error
        exit 1
    fi
}

cd /root/dotfiles
./start_setting.sh
Check $? 

sha1sum /root/dotfiles/zshrc /root/.zshrc
Check $? 

sha1sum /root/dotfiles/vimrc /root/.vimrc
Check $? 

vint /root/.vimrc
Check $? 


grunt zshlint
Check $? 


# 2 times program exec test.
./start_setting.sh
./start_setting.sh
Check $? 


sha1sum /root/dotfiles/zshrc /root/.zshrc
Check $? 


sha1sum /root/dotfiles/vimrc /root/.vimrc
Check $? 


vint /root/.vimrc
Check $? 


grunt zshlint
Check $? 

echo ok test complete!

