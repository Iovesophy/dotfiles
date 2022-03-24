EMAIL:=dotfiles@example.com

all: setup

.PHONY: setup
setup: test
	./setup.sh $(EMAIL)

.PHONY: test
test: install
	shellcheck ./setup.sh
	zsh -n zshrc
	vint vimrc

.PHONY: install
install: ansible
	ansible-playbook -i inventory/localhost.ini install_playbook.yml

.PHONY: ansible
ansible:
	pip install ansible
	ansible --version

