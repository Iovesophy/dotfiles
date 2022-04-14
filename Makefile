EMAIL:=dotfiles@example.com

all: ansible setup

.PHONY: setup
setup: test
	./setup.sh $(EMAIL)

.PHONY: test
test: install
	shellcheck ./tools/install_ansible.sh
	shellcheck ./setup.sh
	zsh -n zshrc
	vint vimrc

.PHONY: install
install:
	for i in --syntax-check --list-tasks --check -v ; do \
	  ansible-playbook -i inventory/localhost.ini install_playbook.yml $$i; done

.PHONY: ansible
ansible:
	./tools/install_ansible.sh

