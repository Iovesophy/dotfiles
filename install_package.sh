#!/bin/sh -eux

if ! (type brew > /dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  chmod -R go-w "$(brew --prefix)/share"
fi

brew install \
  python3 \
  node \
  shellcheck \
  docker \
  peco \
  awscli \
  docker-compose-completion \
  go \
  zsh-git-prompt

pip3 install \
  PyYAML \
  vim-vint
