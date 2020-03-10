FROM ubuntu:18.04

ENV HOME=/github/home
RUN mkdir -p $HOME
COPY install.bash /
RUN bash ./install.bash

ENV PATH="${HOME}/.cargo/bin:${PATH}"

VOLUME ["/github/home"]
