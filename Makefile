EMAIL:=dotfiles@example.com

all: setup

.PHONY: setup
setup: test
	ansible-playbook -i inventory/localhost.ini setup_playbook.yml -e "email=$(EMAIL)"

.PHONY: test
test: install
	shellcheck install_ansible.sh
	zsh -n zshrc
	vint vimrc

.PHONY: install
install:
	./install_ansible.sh
	ansible-playbook -i inventory/localhost.ini install_playbook.yml

