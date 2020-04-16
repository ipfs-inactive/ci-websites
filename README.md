## This repository has been archived!

*This IPFS-related repository has been archived, and all issues are therefore frozen*. If you want to ask a question or open/continue a discussion related to this repo, please visit the [official IPFS forums](https://discuss.ipfs.io).

We archive repos for one or more of the following reasons:

- Code or content is unmaintained, and therefore might be broken
- Content is outdated, and therefore may mislead readers
- Code or content evolved into something else and/or has lived on in a different place
- The repository or project is not active in general

Please note that in order to keep the primary IPFS GitHub org tidy, most archived repos are moved into the [ipfs-inactive](https://github.com/ipfs-inactive) org.

If you feel this repo should **not** be archived (or portions of it should be moved to a non-archived repo), please [reach out](https://ipfs.io/help) and let us know. Archiving can always be reversed if needed.

---
   
# infra-websites

> Docker container that builds our websites.

[![CircleCI](https://circleci.com/gh/ipfs/ci-websites.svg?style=svg)](https://circleci.com/gh/ipfs/ci-websites)

Has Go and JS installed. Used by https://github.com/ipfs/docs

```console
# build the image
$ docker build . -t ipfs/ci-websites

# run the build process for the website at /path/to/repo
$ docker run -it -v /path/to/repo:/site ipfs/ci-websites make -C /site build
```
