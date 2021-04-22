FROM node
WORKDIR /dotfiles

RUN apt-get update \
      && apt-get -y install \
        python3-pip \
        zsh \
        shellcheck \
      && pip3 install vim-vint \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint \
      && curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-"$(uname -s)"-"$(uname -m)" -o /usr/local/bin/docker-compose \
      && chmod 755 /usr/local/bin/docker-compose

COPY . .

CMD ["./test.sh"]
