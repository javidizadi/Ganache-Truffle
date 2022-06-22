FROM debian:bullseye
# Expose port for using ganache
EXPOSE 8545
RUN useradd -ms /bin/bash dev
RUN apt update && apt upgrade -y
RUN apt install -y sudo
RUN echo "dev ALL=(ALL) ALL" >> /etc/sudoers
RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs
RUN sudo npm install --location=global npm
RUN sudo npm install --location=global truffle ganache
USER dev
CMD [ "/bin/bash" ]