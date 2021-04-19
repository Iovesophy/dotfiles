FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Install basic command , clone dotfiles repository and install grunt linter package .
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
      && pip3 install \
        vim-vint \
      && git clone https://github.com/Iovesophy/dotfiles.git \
      && cd dotfiles \
      && git checkout add-dotfiles-vm\
      && npm install -g \
        grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint

WORKDIR /app/dotfiles

CMD ["./test.sh"]
