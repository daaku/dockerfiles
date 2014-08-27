FROM daaku/jre8-oracle
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync \
      gzip \
      shadow \
      tar && \
    groupadd cassandra && \
    useradd cassandra -g cassandra && \
    mkdir \
      /etc/cassandra \
      /opt/cassandra \
      /var/cache/cassandra \
      /var/lib/cassandra && \
    chown cassandra:cassandra \
      /etc/cassandra \
      /var/cache/cassandra \
      /var/lib/cassandra && \
    curl http://mirrors.ibiblio.org/apache/cassandra/1.2.18/apache-cassandra-1.2.18-bin.tar.gz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/cassandra && \
    pacman --noconfirm --remove --cascade --recursive \
      gzip \
      shadow \
      tar && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ADD log4j.properties /etc/cassandra/log4j.properties

USER cassandra
EXPOSE 9160
CMD [ \
  "/opt/java/bin/java", \
  "-Dlog4j.configuration=file:/etc/cassandra/log4j.properties", \
  "-cp", \
  "/opt/cassandra/lib/*:/etc/cassandra", \
  "org.apache.cassandra.service.CassandraDaemon" \
]
