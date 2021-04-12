FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
# timezone setting
RUN yes | apt-get update
RUN yes | apt-get install tzdata
ENV TZ=Asia/Tokyo

RUN yes | apt-get update
RUN yes | apt-get install \
    curl \
    git \
    vim \
    zsh \
    sudo

# install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install docker-ce
RUN yes | apt-get install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN yes | add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN yes | apt-get update
RUN yes | apt-get install docker-ce

# install golang
RUN yes | sudo add-apt-repository ppa:longsleep/golang-backports
RUN yes | sudo apt update
RUN yes | sudo apt install golang-go

# clone dotfiles
RUN git clone https://github.com/Iovesophy/dotfiles.git
