redis
=====

Provides a redis docker image.

To start:

```sh
docker run --name=redis daaku/redis
```

To connect to it with the `redis-cli`:

```sh
docker run -it --link redis:redis --rm daaku/redis \
  sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'
```
