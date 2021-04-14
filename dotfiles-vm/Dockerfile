FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN apt-get update && apt-get -y install curl \
    tzdata \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# docker-ce
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# docker-completion
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install basic command
RUN apt-get update && \
    apt-get -y install \
    git \
    vim \
    zsh \
    sudo \
    docker-ce \
    nodejs \
    npm \
    python3-pip

# clone dotfiles
RUN git clone -b add-dotfiles-vm https://github.com/Iovesophy/dotfiles.git /root/dotfiles

RUN cd /root/dotfiles; npm init; npm install -g grunt-cli; npm install grunt --save-dev
RUN pip3 install vim-vint
