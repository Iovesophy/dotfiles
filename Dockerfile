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
        grunt-zshlint

COPY ["*.sh","*rc","Gruntfile.js","gitconfig_addon","./"]

CMD ["./test.sh"]
