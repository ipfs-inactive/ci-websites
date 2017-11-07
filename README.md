# infra-websites

> Automated deploys and builds of various websites

This is deployed using dokku at pages.ipfs.team.

```sh
> git remote add dokku dokku@pages.ipfs.team:pages.ipfs.team
> git push master pages.ipfs.team
```

Only after the first push:

```sh
# Let's Encrypt
> ssh dokku@pages.ipfs.team proxy:ports-add pages.ipfs.team http:80:9000
> ssh dokku@pages.ipfs.team letsencrypt pages.ipfs.team
> ssh dokku@pages.ipfs.team letsencrypt:cron-job --add

# DNSimple API
> ssh dokku@pages.ipfs.team config:set pages.ipfs.team DNSIMPLE_TOKEN=<account-token>
```


## TODO

- [ ] Eliminate the socat hack for accessing the IPFS API
- [ ] Periodically mirror pinned websites to more hosts
- [ ] Add more websites
  - [ ] protocol.ai
  - [ ] filecoin.io
  - [ ] ipfs.io
  - [ ] ipld.io
  - [ ] libp2p.io
  - [ ] multiformats.io
  - [ ] peerpad.net
  - [ ] datatogether.org
- [ ] Put result size restrictions into place
- [ ] Build pull requests and write preview URL to commit status
