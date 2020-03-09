FROM ubuntu:18.04

COPY install.bash /

RUN bash ./install.bash

ENV PATH="/root/.cargo/bin:${PATH}"
