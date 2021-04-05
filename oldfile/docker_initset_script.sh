#!/bin/zsh

# Explain this tool .
/bin/echo "************************************************"
/bin/echo "Welcome to docker-initset-script ver: 1.0"
/bin/echo "Caution! , this script support only macOS's zsh ."
/bin/echo "************************************************"

<<COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc → .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT

/bin/echo "+ Make .zshrc on home"
mkdir -p ~/.zsh/completion

/bin/echo "+ Download _docker-compose"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

exec $SHELL -l

