arch
====

To build:

```sh
docker build -t daaku/make-arch . &&
docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -t daaku/make-arch
```
