mongo
=====

A mongo container.

To run:

```sh
docker run -ti --name=mongo daaku/mongo
```

To get a CLI:

```sh
docker run -it --rm --link mongo:mongo daaku/mongo sh -c '
  exec /opt/mongo/bin/mongo $MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT'
```
