FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync --asdeps \
      gzip \
      tar && \
    mkdir -p /opt/java && \
    curl \
      --location \
      --cookie oraclelicense=a \
      http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jre-8u20-linux-x64.tar.gz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/java && \
    pacman --noconfirm --remove --cascade --recursive \
      gzip \
      tar && \
    echo -e "y\ny\n" | pacman --sync --clean --clean
