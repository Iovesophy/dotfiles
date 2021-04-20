FROM node
WORKDIR /dotfiles

RUN apt-get update \
      && apt-get -y install \
        python3-pip \
        zsh \
      && pip3 install vim-vint \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint \
      && git init \
      && git remote add origin https://github.com/Iovesophy/dotfiles.git \
      && git pull origin add-dotfiles-vm

CMD ["./test.sh"]
