FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync \
      grep \
      shadow \
      systemd && \
    pacman --noconfirm --sync redis && \
    pacman --noconfirm --remove --recursive --unneeded \
      grep \
      shadow \
      systemd && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

ADD redis.conf /etc/redis.conf

VOLUME /var/lib/redis
USER redis
EXPOSE 6379
CMD ["/usr/bin/redis-server", "/etc/redis.conf"]
