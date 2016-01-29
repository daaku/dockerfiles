dev
===

My personal development container.

TODO:
- neovim
- vim plugins
- go
- docker ps config

```sh
docker build -t daaku/dev .
mkdir -p /home/naitik
chown 1666:1666 /home/naitik
docker run \
  --name=daaku-dev \
  --hostname=daaku-dev \
  --detach \
  --privileged \
  --publish=666:22 \
  --publish=61001:61001/udp \
  --volume=/home/naitik:/home/naitik \
  --volume=/run/docker.sock:/run/docker.sock \
  --volume=/run/shm:/run/shm \
  daaku/dev
```
