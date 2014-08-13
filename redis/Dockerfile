FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync --asdeps grep shadow systemd && \
    pacman --noconfirm --sync redis && \
    pacman --noconfirm --remove --recursive --unneeded grep shadow systemd && \
    mkdir /data && \
    chown redis:redis /data

ADD redis.conf /etc/redis.conf

VOLUME /data
WORKDIR /data

USER redis
EXPOSE 6379
CMD ["redis-server", "/etc/redis.conf"]
