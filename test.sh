#!/bin/bash
# not support function on sh , so set bash.
set -eu

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"

function StatusCheck()
{
  printf "${1}\n"
  if [ ${1} != 0 ]; then
      exit 1
  fi
}

function FileCheck()
{
  zshrc_origin=$(pwd)/zshrc
  zshrc_target=~/.zshrc
  vimrc_origin=$(pwd)/vimrc
  vimrc_target=~/.vimrc

  if [ `md5sum $zshrc_origin | awk '{print $1}'` != `md5sum $zshrc_target | awk '{print $1}'` -a `md5sum $vimrc_origin | awk '{print $1}'` != `md5sum $vimrc_target | awk '{print $1}'` ]; then
      exit 1
  fi
}

./start_setting.sh
StatusCheck $?

./start_setting.sh
FileCheck
StatusCheck $?

vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

./start_setting.sh
./start_setting.sh
FileCheck
StatusCheck $?

vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
