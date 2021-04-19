NAME=dotfiles
build:
	docker build -t $(NAME) .
.PHONY: build
run:
	docker run -t --rm $(NAME)
.PHONY: run
test: build run
.PHONY: test
