#!/bin/sh -eux

if ! (type brew &>/dev/null); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  chmod -R go-w "$(brew --prefix)/share"
fi

brew install python3
brew install node
brew install shellcheck
brew install docker
brew install peco
brew install awscli

npm install -g grunt-cli
npm install grunt grunt-zshlint-darwin

pip3 install PyYAML
pip3 install vim-vint
