FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

# install basic command
RUN apt-get update && \
    apt-get -y install \
    curl \
    git \
    vim \
    zsh \
    sudo \
    nodejs npm \
    python3-pip

# clone dotfiles
RUN git clone -b add-dotfiles-vm https://github.com/Iovesophy/dotfiles.git /root/dotfiles && \
    cd /root/dotfiles; npm init; npm install -g grunt-cli; npm install grunt --save-dev; npm install grunt-zshlint --save-dev && \
    pip3 install vim-vint

CMD ["./root/dotfiles/test.sh"]

