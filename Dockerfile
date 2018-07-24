FROM golang:1.9-stretch
MAINTAINER Lars Gierth <lgierth@ipfs.io>

ENV IPFS_API /ip4/127.0.0.1/tcp/5001
ENV DNSIMPLE_TOKEN ""

ENV IPFS_VERSION 0.4.13
ENV HUGO_VERSION 0.41

# Install nodejs and npm
RUN set -ex && \
  wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb http://deb.nodesource.com/node_8.x stretch main" >> /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src http://deb.nodesource.com/node_8.x stretch main" >> -a /etc/apt/sources.list.d/nodesource.list && \
  apt-get update && \
  apt-get install -y nodejs build-essential libpng-dev

# Install hugo
RUN set -ex && \
  cd /tmp && \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb && \
  dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb

# Install go-ipfs
RUN set -ex && \
  wget https://dist.ipfs.io/go-ipfs/v${IPFS_VERSION}/go-ipfs_v${IPFS_VERSION}_linux-amd64.tar.gz && \
  tar -xf go-ipfs_v${IPFS_VERSION}_linux-amd64.tar.gz && \
  mv go-ipfs/ipfs /usr/bin/ipfs

# Install godoc2md, dnslink-dnsimple
RUN set -ex && \
  go get -v github.com/lgierth/dnslink-dnsimple && \
  go get -v github.com/davecheney/godoc2md

VOLUME /site
