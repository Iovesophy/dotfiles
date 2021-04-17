#!/bin/bash
# not support function on sh , so set bash.
set -eu

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"


function StatusCheck()
{
  printf "${1}\n"
  if [ ${1} = 0 ]; then
      :
  else
      exit 1
  fi
}

function FileExec()
{
  exectimes=${1}
  for i in `seq $exectimes`; do
    ./start_setting.sh
  done
}

function FileCheck()
{
  zshrc_o=`md5sum zshrc | awk '{print $1}'`
  zshrc_b=`md5sum ~/.zshrc | awk '{print $1}'`
  vimrc_o=`md5sum vimrc | awk '{print $1}'`
  vimrc_b=`md5sum ~/.vimrc | awk '{print $1}'`

  if [ $zshrc_o = $zshrc_b -a $vimrc_o = $vimrc_b ]; then
      :
  else
      exit 1
  fi
}

FileExec 1
StatusCheck $?

FileExec 1
FileCheck
StatusCheck $?

vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

FileExec 2
FileCheck
StatusCheck $?

vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
