# dotfiles

[![CI to Docker Hub](https://github.com/Iovesophy/dotfiles/actions/workflows/docker.yml/badge.svg)](https://github.com/Iovesophy/dotfiles/actions/workflows/docker.yml)

This is dotfiles auto initialize setting scripts ver: 1.0


- Attention notice
If the configured dotfiles already exists , this script removes the configuration.

## Dependency
This scripts target shell is only zsh , so if you want to use script for bash . Please regulation yourself .

### for example 
+ .zshrc → .bashrc
+ zshlint → bashlint

## Usage

### Case1: LocalEnvironment
+ Open terminal.app .
+ Clone this repository .
+ Change directory on this repository .
+ Input this command .
```
$ ./start_setting.sh <your email>
```
+ Setting .
+ Done .

### Case2: VirtualEnvironment by Docker
+ Install Docker .
+ Open terminal.app .
+ Clone this repository .
+ Change directory on this repository .
+ Input this commands below .

```
$ make test
```
+ Auto start ./test.sh by Dockerfile's settings . If passed this test script , you get the set dotfiles environment .
+ Done .

※Use makefile

``` 
$ make test
$ make build
$ make run
```

## License
Copyright (c) 2021 Kazuya yuda.
This software is released under the MIT License, see LICENSE.
https://opensource.org/licenses/mit-license.php

## Authors
kazuya yuda.

## References
+ git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  
+ Docker-docks-ja コマンドライン補完 https://docs.docker.jp/compose/completion.html  
+ GRUNT Getting started https://gruntjs.com/getting-started  
+ grunt-zshlint https://www.npmjs.com/package/grunt-zshlint  
