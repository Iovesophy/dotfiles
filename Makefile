NAME := dotfiles
VOLUME := $(shell pwd)

.PHONY: test
test: docker-build docker-run

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run
docker-run:
	docker run -v $(VOLUME):/$(NAME) --rm $(NAME)
