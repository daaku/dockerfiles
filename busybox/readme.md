busybox
=======

An image with a statically linked `busybox`.

To build:

```sh
docker build -t daaku/make-busybox . &&
docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -t daaku/make-busybox
```
