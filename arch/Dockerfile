FROM base/archlinux
MAINTAINER Naitik Shah "n@daaku.org"

# build tools
RUN pacman --sync --refresh --sysupgrade --noconfirm
RUN pacman --sync --noconfirm \
    docker \
    haveged

# minimal system to allow pacman to function
RUN mkdir -p /arch/var/lib/pacman /arch/var/cache/pacman/pkg
RUN pacman --sync --refresh --noconfirm --root /arch \
    pacman \
    filesystem

# initialize the keyring
RUN haveged -w 1024 ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --init ; \
    pacman-key --gpgdir=/arch/etc/pacman.d/gnupg --populate archlinux ; \
    pkill haveged ; \
    true

# pacman servers
RUN echo "Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /arch/etc/pacman.d/mirrorlist

# create new base image
CMD tar \
    --create \
    --directory=/arch \
    --numeric-owner \
    --preserve-permissions . | docker import - daaku/arch
