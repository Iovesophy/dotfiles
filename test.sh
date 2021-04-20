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
  src=`shasum -a 256 ${1} | awk '{print $1}'`
  target=`shasum -a 256 ${2} | awk '{print $1}'`
  test $src = $target
  StatusCheck $?
}

function FileExistenceCheck()
{
  printf "FileExistenceCheck:${1}\n"
  test -f ${1}
}

readonly ZSHRC_SRC=zshrc
readonly ZSHRC_TARGET=~/.zshrc
readonly VIMRC_SRC=vimrc
readonly VIMRC_TARGET=~/.vimrc
readonly DOCKER_SRC=~/.zsh/completion/_docker
readonly DOCKER_COMPOSE_SRC=~/.zsh/completion/_docker-compose
readonly GIT_PROMPT_SRC=~/.zsh/completion/git-prompt.sh
readonly GITCONFIG_TARGET=~/.gitconfig

./start_setting.sh
StatusCheck $?

FileCheck $ZSHRC_SRC $ZSHRC_TARGET
StatusCheck $?
FileCheck $VIMRC_SRC $VIMRC_TARGET
StatusCheck $?

FileExistenceCheck $ZSHRC_TARGET
StatusCheck $?
FileExistenceCheck $VIMRC_TARGET
StatusCheck $?

FileExistenceCheck $DOCKER_SRC 
StatusCheck $?
FileExistenceCheck $DOCKER_COMPOSE_SRC 
StatusCheck $?
FileExistenceCheck $GIT_PROMPT_SRC
StatusCheck $?
FileExistenceCheck $GITCONFIG_TARGET
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

FileCheck $ZSHRC_SRC $ZSHRC_TARGET
StatusCheck $?
FileCheck $VIMRC_SRC $VIMRC_TARGET
StatusCheck $?

FileExistenceCheck $ZSHRC_TARGET
StatusCheck $?
FileExistenceCheck $VIMRC_TARGET
StatusCheck $?

FileExistenceCheck $DOCKER_SRC 
StatusCheck $?
FileExistenceCheck $DOCKER_COMPOSE_SRC 
StatusCheck $?
FileExistenceCheck $GIT_PROMPT_SRC
StatusCheck $?
FileExistenceCheck $GITCONFIG_TARGET
StatusCheck $?

printf "Check .vimrc\n"
vint vimrc
StatusCheck $?

printf "Check .zshrc\n"
grunt zshlint
StatusCheck $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
