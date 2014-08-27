cassandra12
===========

Provides a cassandra 1.2 image.

To run:

```sh
docker run --name cassandra daaku/cassandra12
```

To open the CLI against it:

```sh
docker run -it --link cassandra:cassandra --rm daaku/cassandra12 \
  sh -c '
    exec \
    /opt/java/bin/java \
    -Dlog4j.configuration=file:/etc/cassandra/log4j.properties \
    -cp /opt/cassandra/lib/*:/etc/cassandra \
    org.apache.cassandra.cli.CliMain \
    --host $CASSANDRA_PORT_9160_TCP_ADDR \
    --port $CASSANDRA_PORT_9160_TCP_PORT'
```
