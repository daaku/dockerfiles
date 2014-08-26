FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync \
      curl \
      gzip \
      shadow \
      tar && \
    groupadd cassandra && \
    useradd cassandra -g cassandra && \
    mkdir \
      /etc/cassandra \
      /var/cache/cassandra \
      /var/lib/cassandra && \
    chown cassandra:cassandra \
      /etc/cassandra \
      /var/cache/cassandra \
      /var/lib/cassandra && \
    curl --location --cookie oraclelicense=a http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jre-8u20-linux-x64.tar.gz | \
      tar --extract --gunzip --directory /usr/local && \
    curl http://mirrors.ibiblio.org/apache/cassandra/1.2.18/apache-cassandra-1.2.18-bin.tar.gz | \
      tar --extract --gunzip --directory /usr/local

ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ADD log4j.properties /etc/cassandra/log4j.properties

USER cassandra
EXPOSE 9160
CMD [ \
  "/usr/local/jre1.8.0_20/bin/java", \
  "-Dlog4j.configuration=file:/etc/cassandra/log4j.properties", \
  "-cp", \
  "/usr/local/apache-cassandra-1.2.18/lib/*:/etc/cassandra", \
  "org.apache.cassandra.service.CassandraDaemon" \
]
