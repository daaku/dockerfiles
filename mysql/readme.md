mysql
=====

A mysql docker container.

To start:

```sh
docker run -ti --name=mysql daaku/mysql
```

To get a CLI:

```sh
docker run -it --rm --link mysql:mysql daaku/mysql sh -c '
    exec \
    mysql \
    -h"$MYSQL_PORT_3306_TCP_ADDR" \
    -P"$MYSQL_PORT_3306_TCP_PORT" \
    -uroot -proot'
```
