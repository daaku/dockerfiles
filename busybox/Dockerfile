FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN pacman --sync --noconfirm \
    busybox \
    docker \
    tar

RUN mkdir -p /arch/bin
RUN cp /usr/bin/busybox /arch/bin
RUN sh -c 'for each in `busybox --list`; do ln -s busybox /arch/bin/$each; done'

# create new base image
CMD tar \
    --create \
    --directory=/arch \
    --numeric-owner \
    --preserve-permissions . | docker import - daaku/busybox
