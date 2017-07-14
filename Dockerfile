FROM ubuntu:16.04
MAINTAINER Rafik Salama <rafik@oysterbooks.com>

WORKDIR /opt/go/src/github.com/rafikk/halfshell
ENV GOPATH /opt/go

RUN apt-get update && apt-get install -qy \
    build-essential \
    git \
    wget \
    libmagickcore-dev \
    libmagickwand-dev \
    imagemagick \
    golang

RUN mkdir -p /halfshell/magento2
COPY . /opt/go/src/github.com/rafikk/halfshell
RUN cd /opt/go/src/github.com/rafikk/halfshell && make deps && make build


ENTRYPOINT ["/opt/go/src/github.com/rafikk/halfshell/bin/halfshell", "/opt/go/src/github.com/rafikk/halfshell/config.json"]

EXPOSE 8080
