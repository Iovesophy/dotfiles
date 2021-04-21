#!/bin/bash
set -eu

readonly DOCKER_COMPOSE_SRC=~/.zsh/completion/_docker-compose
readonly DOCKER_SRC=~/.zsh/completion/_docker
readonly GITCONFIG_TARGET=~/.gitconfig
readonly GIT_PROMPT_SRC=~/.zsh/completion/git-prompt.sh
readonly VIMRC_SRC=vimrc
readonly VIMRC_TARGET=~/.vimrc
readonly ZSHRC_SRC=zshrc
readonly ZSHRC_TARGET=~/.zshrc
readonly START_SETTING_SH=start_setting.sh
readonly TEST_SH=test.sh

function check_exit_status() {
  printf "Status:%s\n" "$1"
  if [ "$1" != 0 ]; then
    exit 1
  fi
}

function check_equal_file() {
  printf "check_equal_file:[%s]==[%s]\n" "$1" "$2"
  local src
  local target
  src=$(shasum -a 256 "$1" | awk '{print $1}')
  target=$(shasum -a 256 "$2" | awk '{print $1}')
  test "${src}" = "${target}"
}

function check_equal_fileExistence() {
  printf "check_equal_fileExistence:%s\n" "$1"
  test -f "$1"
}

function do_test() {
  printf "Check lint start_setting.sh\n"
  shellcheck $START_SETTING_SH
  check_exit_status $?

  printf "Check lint test.sh\n"
  shellcheck $TEST_SH
  check_exit_status $?

  ./start_setting.sh
  check_exit_status $?

  check_equal_file $ZSHRC_SRC $ZSHRC_TARGET
  check_exit_status $?

  check_equal_file $VIMRC_SRC $VIMRC_TARGET
  check_exit_status $?

  check_equal_fileExistence $DOCKER_SRC
  check_exit_status $?

  check_equal_fileExistence $DOCKER_COMPOSE_SRC
  check_exit_status $?

  check_equal_fileExistence $GIT_PROMPT_SRC
  check_exit_status $?

  check_equal_fileExistence $GITCONFIG_TARGET
  check_exit_status $?

  printf "Check .vimrc\n"
  vint vimrc
  check_exit_status $?

  printf "Check .zshrc\n"
  grunt zshlint
  check_exit_status $?
}

function main() {
  printf "************************************************\n"
  printf "Welcome to dotfile-test-script ver: 1.0\n"
  printf "************************************************\n"

  do_test
  do_test

  printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
}

main
