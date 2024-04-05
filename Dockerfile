FROM ubuntu:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    echo 'libc6 libraries/restart-without-asking boolean true' | debconf-set-selections

RUN apt-get update && \
    apt -y install software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update && apt-get -y install \
    python3.7 python3.7-dev \
    curl

RUN apt -y install python3.7-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.7 && \
    add-apt-repository ppa:sumo/stable -y

RUN apt-get update && apt-get -y install sumo \
    sumo-tools \
    sumo-doc




