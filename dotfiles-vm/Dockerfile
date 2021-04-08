FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
# timezone setting
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y \
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
