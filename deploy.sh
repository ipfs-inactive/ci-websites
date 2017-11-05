#!/usr/bin/env bash

set -e
env | grep DELIVERY

rm -rf "$DOMAIN/$DELIVERY/"
mkdir -p "$DOMAIN"

git clone "$REPO" "$DOMAIN/$DELIVERY"
cd "$DOMAIN/$DELIVERY/"
git checkout "$COMMIT"

git submodule init
git submodule update
hugo --theme docdock

cid="$(ipfs --api="$IPFS_API" add -Q -r public/)"
dnslink-dnsimple "$DOMAIN" "/ipfs/$cid"
