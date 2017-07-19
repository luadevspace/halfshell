FROM ubuntu:16.04
MAINTAINER Eduardo Leal <eleal@lua.net>

WORKDIR /opt/go/src/github.com/luadevspace/halfshell
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
COPY . /opt/go/src/github.com/luadevspace/halfshell
RUN cd /opt/go/src/github.com/luadevspace/halfshell && make deps && make build


ENTRYPOINT ["/opt/go/src/github.com/luadevspace/halfshell/bin/halfshell", "/opt/go/src/github.com/luadevspace/halfshell/config.json"]

EXPOSE 8080
