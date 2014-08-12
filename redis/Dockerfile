FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN pacman --noconfirm --sync --refresh --sysupgrade
RUN pacman --noconfirm --sync --asdeps grep shadow systemd
RUN pacman --noconfirm --sync redis
RUN pacman --noconfirm --remove --recursive --unneeded grep shadow systemd

RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data

USER redis
EXPOSE 6379
CMD ["redis-server"]
