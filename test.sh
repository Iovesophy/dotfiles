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
  src=${1}
  target=${2}
  if [ `md5sum $src | awk '{print $1}'` != `md5sum $target | awk '{print $1}'` ]; then
      exit 1
  fi
}

function FileExistCheck()
{
  test -f ${1}
}

  zshrc_src=zshrc
  zshrc_target=~/.zshrc
  vimrc_src=vimrc
  vimrc_target=~/.vimrc

  _docker_src=~/.zsh/completion/_docker
  _docker_compose_src=~/.zsh/completion/_docker-compose
  git_prompt=~/.zsh/completion/git-prompt.sh

./start_setting.sh
StatusCheck $?

./start_setting.sh
FileCheck $zshrc_src $zshrc_target
FileCheck $vimrc_src $vimrc_target
StatusCheck $?

FileExistCheck $_docker_src 
StatusCheck $?

FileExistCheck $_docker_compose_src 
StatusCheck $?

FileExistCheck $git_prompt
StatusCheck $?


vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

./start_setting.sh
./start_setting.sh
FileCheck $zshrc_src $zshrc_target
FileCheck $vimrc_src $vimrc_target
StatusCheck $?

FileExistCheck $_docker_src 
StatusCheck $?

FileExistCheck $_docker_compose_src 
StatusCheck $?

FileExistCheck $git_prompt
StatusCheck $?

vint vimrc
StatusCheck $?

grunt zshlint
StatusCheck $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
