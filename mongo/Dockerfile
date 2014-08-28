FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync \
      gzip \
      shadow \
      tar && \
    groupadd mongo && \
    useradd \
      --gid mongo \
      --home-dir /home/mongo \
      --create-home \
      mongo && \
    mkdir \
      /opt/mongo \
      /var/lib/mongo && \
    chown mongo:mongo /var/lib/mongo && \
    curl -LS https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.11.tgz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/mongo && \
    pacman --noconfirm --remove --cascade --recursive \
      gzip \
      shadow \
      tar && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

ADD mongodb.conf /etc/mongodb.conf

VOLUME /var/lib/mongo
USER mongo
EXPOSE 27017
CMD ["/opt/mongo/bin/mongod", "--config", "/etc/mongodb.conf"]
