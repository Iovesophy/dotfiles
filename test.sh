#!/bin/bash
# not support function on sh , so set bash.
set -eu

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"

function StatusCheck()
{
  printf "Status:${1}\n"
  if [ ${1} != 0 ]; then
      exit 1
  fi
}

function FileCheck()
{
  printf "FileCheck:[${1}]==[${2}]\n"
  src=${1}
  target=${2}
  if [ `md5sum $src | awk '{print $1}'` != `md5sum $target | awk '{print $1}'` ]; then
      exit 1
  fi
}

function FileExistenceCheck()
{
  printf "FileExistenceCheck:${1}\n"
  test -f ${1}
}

zshrc_src=zshrc
zshrc_target=~/.zshrc
vimrc_src=vimrc
vimrc_target=~/.vimrc

_docker_src=~/.zsh/completion/_docker
_docker_compose_src=~/.zsh/completion/_docker-compose
git_prompt_src=~/.zsh/completion/git-prompt.sh
gitconfig_target=~/.gitconfig

./start_setting.sh
StatusCheck $?

FileCheck $zshrc_src $zshrc_target
StatusCheck $?
FileCheck $vimrc_src $vimrc_target
StatusCheck $?

FileExistenceCheck $zshrc_target
StatusCheck $?
FileExistenceCheck $vimrc_target
StatusCheck $?

FileExistenceCheck $_docker_src 
StatusCheck $?
FileExistenceCheck $_docker_compose_src 
StatusCheck $?
FileExistenceCheck $git_prompt_src
StatusCheck $?
FileExistenceCheck $gitconfig_target
StatusCheck $?

printf "Check .vimrc\n"
vint vimrc
StatusCheck $?

printf "Check .zshrc\n"
grunt zshlint
StatusCheck $?

./start_setting.sh
./start_setting.sh
StatusCheck $?

FileCheck $zshrc_src $zshrc_target
StatusCheck $?
FileCheck $vimrc_src $vimrc_target
StatusCheck $?

FileExistenceCheck $zshrc_target
StatusCheck $?
FileExistenceCheck $vimrc_target
StatusCheck $?

FileExistenceCheck $_docker_src 
StatusCheck $?
FileExistenceCheck $_docker_compose_src 
StatusCheck $?
FileExistenceCheck $git_prompt_src
StatusCheck $?
FileExistenceCheck $gitconfig_target
StatusCheck $?

printf "Check .vimrc\n"
vint vimrc
StatusCheck $?

printf "Check .zshrc\n"
grunt zshlint
StatusCheck $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
