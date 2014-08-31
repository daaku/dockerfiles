FROM daaku/jre8-oracle
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir \
      /etc/cassandra \
      /opt/cassandra \
      /var/lib/cassandra && \
    chown 42001 /var/lib/cassandra && \
    curl http://mirrors.ibiblio.org/apache/cassandra/1.2.18/apache-cassandra-1.2.18-bin.tar.gz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/cassandra

ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ADD log4j.properties /etc/cassandra/log4j.properties

VOLUME /var/lib/cassandra
USER 42001
EXPOSE 9160
CMD [ \
  "/opt/java/bin/java", \
  "-Dlog4j.configuration=file:/etc/cassandra/log4j.properties", \
  "-cp", \
  "/opt/cassandra/lib/*:/etc/cassandra", \
  "org.apache.cassandra.service.CassandraDaemon" \
]
