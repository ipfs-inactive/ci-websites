FROM golang:1.9-stretch
MAINTAINER Lars Gierth <lgierth@ipfs.io>

ENV IPFS_API /ip4/127.0.0.1/tcp/5001
ENV WEBHOOK_SECRET ""
ENV DNSIMPLE_TOKEN ""

ENV IPFS_VERSION 0.4.12-rc1
ENV HUGO_VERSION 0.30.2

EXPOSE 9000

RUN set -ex && \
  cd /tmp && \
  go get -v github.com/adnanh/webhook && \
  go get -v github.com/lgierth/dnslink-dnsimple && \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb && \
  dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb && \
  wget https://dist.ipfs.io/go-ipfs/v${IPFS_VERSION}/go-ipfs_v${IPFS_VERSION}_linux-amd64.tar.gz && \
  tar -xf go-ipfs_v${IPFS_VERSION}_linux-amd64.tar.gz && \
  mv go-ipfs/ipfs /usr/bin/ipfs

COPY hooks.yaml /etc/hooks.yaml
COPY deploy.sh /opt/hook/deploy.sh

CMD ["webhook", "-hooks", "/etc/hooks.yaml", "-port", "9000", "-verbose"]
