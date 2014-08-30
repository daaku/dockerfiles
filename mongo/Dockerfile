FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir \
      /opt/mongo \
      /var/lib/mongo && \
    chown 42003 /var/lib/mongo && \
    curl -LS https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.11.tgz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/mongo

ADD mongodb.conf /etc/mongodb.conf

VOLUME /var/lib/mongo
USER 42003
EXPOSE 27017
CMD ["/opt/mongo/bin/mongod", "--config", "/etc/mongodb.conf"]
