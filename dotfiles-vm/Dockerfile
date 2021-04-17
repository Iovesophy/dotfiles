FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

# install basic command
RUN apt-get update \
      && apt-get -y install \
        curl \
        git \
        nodejs \
        npm \
        python3-pip \
        sudo \
        vim \
        zsh \
      && pip3 install vim-vint

WORKDIR /app

# clone dotfiles
RUN git clone https://github.com/Iovesophy/dotfiles.git \
      && cd dotfiles \
      && git checkout add-dotfiles-vm \
      && npm install -g grunt-cli --save-dev \
      && npm install grunt --save-dev \
      && npm install grunt-zshlint --save-dev
WORKDIR /app/dotfiles
CMD ["./test.sh"]
