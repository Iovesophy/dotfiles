EMAIL:=dotfiles@example.com

.PHONY: setting
setting: test
	./start_setting.sh $(EMAIL)

.PHONY: test
test: install
	shellcheck start_setting.sh
	shellcheck install_package.sh
	zsh -n zshrc
	vint vimrc

.PHONY: install
install:
	./install_package.sh
