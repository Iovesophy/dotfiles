#!/bin/bash -eux

# region enable symlink
export MSYS=winsymlinks:nativestrict
rm -rf ~/.bashrc
ln -s "$(pwd)/bashrc" ~/.bashrc
# endregion

# region git setting
cp -f gitconfig_addon ~/.gitconfig
git config --global core.symlinks true
git config --global user.name $1
git config --global user.email $2
cat ~/.gitconfig
# endregion

