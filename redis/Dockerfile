FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir -p /var/lib/redis && \
    chown 42006 /var/lib/redis && \
    pacman --noconfirm --sync --noscriptlet redis

ADD redis.conf /etc/redis.conf

VOLUME /var/lib/redis
USER 42006
EXPOSE 6379
CMD ["/usr/bin/redis-server", "/etc/redis.conf"]
