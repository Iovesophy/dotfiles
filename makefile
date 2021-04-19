NAME=dotfiles

build:
	docker build -t $(NAME) .

run:
	docker run -it $(NAME)
