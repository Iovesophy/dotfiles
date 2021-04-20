#!/bin/bash
# not support function on sh , so set bash.
set -eu

printf "************************************************\n"
printf "Welcome to dotfile-test-script ver: 1.0\n"
printf "************************************************\n"

function CheckStatus()
{
  printf "Status:${1}\n"
  if [ $1 != 0 ]; then
      exit 1
  fi
}

function CheckFile()
{
  printf "CheckFile:[${1}]==[${2}]\n"
  src=$(shasum -a 256 ${1} | awk '{print $1}')
  target=$(shasum -a 256 ${2} | awk '{print $1}')
  test $src = $target
}

function CheckFileExistence()
{
  printf "CheckFileExistence:${1}\n"
  test -f $1
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
CheckStatus $?

CheckFile $ZSHRC_SRC $ZSHRC_TARGET
CheckStatus $?
CheckFile $VIMRC_SRC $VIMRC_TARGET
CheckStatus $?

CheckFileExistence $DOCKER_SRC 
CheckStatus $?
CheckFileExistence $DOCKER_COMPOSE_SRC 
CheckStatus $?
CheckFileExistence $GIT_PROMPT_SRC
CheckStatus $?
CheckFileExistence $GITCONFIG_TARGET
CheckStatus $?

printf "Check .vimrc\n"
vint vimrc
CheckStatus $?

printf "Check .zshrc\n"
grunt zshlint
CheckStatus $?

./start_setting.sh
CheckStatus $?

CheckFile $ZSHRC_SRC $ZSHRC_TARGET
CheckStatus $?
CheckFile $VIMRC_SRC $VIMRC_TARGET
CheckStatus $?

CheckFileExistence $DOCKER_SRC 
CheckStatus $?
CheckFileExistence $DOCKER_COMPOSE_SRC 
CheckStatus $?
CheckFileExistence $GIT_PROMPT_SRC
CheckStatus $?
CheckFileExistence $GITCONFIG_TARGET
CheckStatus $?

printf "Check .vimrc\n"
vint vimrc
CheckStatus $?

printf "Check .zshrc\n"
grunt zshlint
CheckStatus $?

printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
