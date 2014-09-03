FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN pacman --noconfirm --sync memcached && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

USER 42002
EXPOSE 11211
CMD ["/usr/bin/memcached", "-p", "11211", "-U", "11211"]
