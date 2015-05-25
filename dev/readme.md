dev
===

My personal development container.

```sh
docker build -t daaku/dev .
mkdir -p /home/naitik
chown 1666:1666 /home/naitik
docker run \
  --name=dev \
  --hostname=dev \
  --detach \
  --privileged \
  --publish=666:22 \
  --publish=61001:61001/udp \
  --volume=/home/naitik:/home/naitik \
  --volume=/run/docker.sock:/run/docker.sock \
  --volume=/run/shm:/run/shm \
  daaku/dev
```
