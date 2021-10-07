NAME := dotfiles
GIT_EMAIL :=

local: 
	./start_setting.sh $(GIT_EMAIL)

.PHONY: test
test: docker-build docker-run

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run
docker-run:
	docker run --rm $(NAME)
