EMAIL:=dotfiles@example.com
NAME:=dotfiles

.PHONY: setup
setup:
	./setup.sh $(EMAIL) $(NAME)
	-./tools/install_brew.sh
	sudo update-alternatives --config editor

.PHONY: install
install:
	sudo apt install -y vim
	curl -fsSL https://get.docker.com -o get-docker.sh
	./get-docker.sh
	sudo groupadd docker
	sudo usermod -aG docker $(USER)
	sudo chown $(USER):$(USER) /home/$(USER)/.docker -R
	mkdir -p /home/$(USER)/.docker
	sudo chmod g+rwx $(HOME)/.docker -R
	brew install peco

