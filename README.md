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
