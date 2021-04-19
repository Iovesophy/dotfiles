FROM node
WORKDIR /dotfiles

# Install basic command , clone dotfiles repository and install grunt linter package .
RUN apt-get update \
      && apt-get -y install \
        python3-pip \
        zsh \
      && pip3 install vim-vint \
      && git clone https://github.com/Iovesophy/dotfiles.git . \
      && git checkout add-dotfiles-vm \
      && npm install -g grunt-cli \
      && npm install grunt grunt-zshlint

CMD ["./test.sh"]
