#!/bin/sh -eux

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
chmod -R go-w "$(brew --prefix)/share"

brew install \
  awscli \
  docker \
  docker-compose-completion \
  go \
  node \
  peco \
  python3 \
  shellcheck \
  zsh-git-prompt

pip3 install \
  PyYAML \
  vim-vint
