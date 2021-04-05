#!/bin/zsh

# Explain this tool .
/bin/echo "************************************************"
/bin/echo "Welcome to vim-initset-script ver: 1.0"
/bin/echo "Caution! , this script support only macOS's zsh ."
/bin/echo "************************************************"

/bin/echo "+ Make .vimrc on home"
touch ~/.vimrc

/bin/echo "+ symlink .vimrc on home"
ln -nfs `pwd`/vimrc ~/.vimrc
ln -nfs `pwd`/vimrc ~/vimrc

exec $SHELL -l
