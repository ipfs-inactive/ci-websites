FROM golang:1.9-stretch
MAINTAINER Lars Gierth <lgierth@ipfs.io>

ENV IPFS_API /ip4/127.0.0.1/tcp/5001
ENV DNSIMPLE_TOKEN ""

ENV IPFS_VERSION 0.4.12-rc1
ENV HUGO_VERSION 0.30.2

EXPOSE 9000

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

# These are exactly here so that a change to them triggers a new `go get`.
COPY hooks.yaml /etc/hooks.yaml
COPY deploy.sh /opt/hook/deploy.sh

# Install webhook and dnslink-dnsimple
RUN set -ex && \
  go get -v github.com/adnanh/webhook && \
  go get -v github.com/lgierth/dnslink-dnsimple

CMD ["webhook", "-hooks", "/etc/hooks.yaml", "-port", "9000", "-verbose"]
