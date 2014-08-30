FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

# build tools
RUN pacman --sync --refresh --sysupgrade --noconfirm
RUN pacman --sync --noconfirm \
    docker \
    haveged \
    tar

# minimal system to allow pacman to function
RUN mkdir -p /arch/var/lib/pacman /arch/var/cache/pacman/pkg
RUN pacman --sync --refresh --noconfirm --root /arch \
    filesystem \
    gzip \
    pacman \
    tar

# initialize the keyring
RUN haveged -w 1024 ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --init ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --populate archlinux ; \
    pkill haveged ; \
    true

# pacman servers
RUN echo "Server = http://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /arch/etc/pacman.d/mirrorlist

# create new base image
CMD tar \
    --create \
    --directory=/arch \
    --numeric-owner \
    --preserve-permissions . | docker import - daaku/arch
