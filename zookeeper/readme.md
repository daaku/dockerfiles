zookeeper
=========

Provides a zookeeper image.

To run:

```sh
docker run --name zookeeper daaku/zookeeper
```

To open the CLI against it:

```sh
docker run -it --link zookeeper:zookeeper --rm daaku/zookeeper \
  sh -c '
    exec \
    /opt/java/bin/java \
    -Dlog4j.configuration=file:/etc/zookeeper/log4j.properties \
    -cp /opt/zookeeper/*:/opt/zookeeper/lib/* \
    org.apache.zookeeper.ZooKeeperMain \
    -server $ZOOKEEPER_PORT_2181_TCP_ADDR:$ZOOKEEPER_PORT_2181_TCP_PORT'
```
