FROM ubuntu:18.04
LABEL maintainer="UVA Data Science <nem2p@virginia.edu>"
LABEL org.opencontainers.image.source=https://github.com/nmagee/ds3002

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip

RUN pip3 install -r requirements.txt
