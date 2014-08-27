redis
=====

Provides a redis docker image. The redis user/group have the id `999`, which is
what you'll need your volume to be owned by.

```sh
mkdir -p /var/lib/redis
chown -R 999:999 /var/lib/redis
```

Then to start a container named `redis`:

```sh
docker run --name=redis --volume=/var/lib/redis:/data daaku/redis
```

To connect to it with the `redis-cli`:

```sh
docker run -it --link redis:redis --rm daaku/redis \
  sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'
```
