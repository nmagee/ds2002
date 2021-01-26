FROM ubuntu:20.04
LABEL maintainer="UVA Data Science <nem2p@virginia.edu>"
LABEL org.opencontainers.image.source=https://github.com/nmagee/ds3002

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip \
  git curl net-tools jq unzip dnsutils tzdata httpie htop
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir "/home/host"

WORKDIR /root
COPY ./ ./
RUN python3 -m pip install -r requirements.txt && rm -rf requirements.txt
