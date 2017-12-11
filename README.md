# infra-websites

> Docker container that builds our websites.

Has Go and JS installed.

```sh
> docker run -it -v /path/to/repo:/site ipfs/ci-websites make -C /site build
```
