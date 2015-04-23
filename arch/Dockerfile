FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

# disable sig checking
RUN pacman --sync --refresh --noconfirm
RUN pacman --sync --noconfirm sed grep

# disable sig checking
RUN sed -i'' -e 's/SigLevel.*/SigLevel = Never/' /etc/pacman.conf

# upgrade the pacman we'll use to bootstap our image
RUN pacman --sync --sysupgrade --noconfirm

# possibly need to upgrade the DB format if pacman has seen a major upgrade
# since we created the last container.
RUN pacman-db-upgrade

# build tools
RUN pacman --sync --noconfirm \
    docker \
    tar

# minimal system to allow pacman to function
RUN mkdir -p /arch/var/lib/pacman /arch/var/cache/pacman/pkg
RUN pacman --sync --refresh --noconfirm --root /arch \
    filesystem \
    gzip \
    pacman \
    tar

# initialize the keyring, use urandom since we never seem to have enough entropy
RUN /bin/rm -f /dev/random && ln -s /dev/urandom /dev/random ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --init ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --populate archlinux ; \
    true

# pacman servers
RUN echo "Server = http://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /arch/etc/pacman.d/mirrorlist

# create new base image
CMD tar \
    --create \
    --directory=/arch \
    --numeric-owner \
    --preserve-permissions . | docker import - daaku/arch
