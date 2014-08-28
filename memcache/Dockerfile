FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync shadow && \
    pacman --noconfirm --sync memcached && \
    pacman --noconfirm --remove --recursive --unneeded shadow && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

USER memcached
EXPOSE 11211
CMD ["/usr/bin/memcached", "-p", "11211", "-U", "11211"]
