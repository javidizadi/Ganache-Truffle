FROM debian:bullseye
# Expose port for using ganache
EXPOSE 8545
RUN useradd -ms /bin/bash dev
RUN apt update && apt upgrade -y
RUN apt install -y apt-utils
RUN apt install -y sudo
RUN echo "dev ALL=(ALL) ALL" >> /etc/sudoers
RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs
RUN sudo npm install --location=global yarn
USER dev
RUN echo "export PATH=$PATH:$(yarn global bin)" >> $HOME/.bashrc
RUN yarn global add truffle ganache
CMD [ "/bin/bash" ]