FROM daaku/jre8-oracle
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir \
      /etc/zookeeper \
      /opt/zookeeper \
      /var/lib/zookeeper && \
    chown 42005 /var/lib/zookeeper && \
    curl http://www.dsgnwrld.com/am/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/zookeeper

ADD zoo.cfg /etc/zookeeper/zoo.cfg
ADD log4j.properties /etc/zookeeper/log4j.properties

VOLUME /var/lib/zookeeper
USER 42005
EXPOSE 2181
CMD [ \
  "/opt/java/bin/java", \
  "-Dlog4j.configuration=file:/etc/zookeeper/log4j.properties", \
  "-cp", \
  "/opt/zookeeper/zookeeper-3.4.6.jar:/opt/zookeeper/lib/*", \
  "org.apache.zookeeper.server.quorum.QuorumPeerMain", \
  "/etc/zookeeper/zoo.cfg" \
]
