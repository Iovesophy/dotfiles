FROM node
WORKDIR /dotfiles

RUN apt-get update \
      && apt-get -y install \
        python3-pip \
        zsh \
        shellcheck \
        docker-compose \
      && pip3 install --upgrade pip \
      && pip3 install vim-vint \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint

COPY . .

CMD ["./test.sh"]
