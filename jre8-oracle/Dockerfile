FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir -p /opt/java && \
    curl \
      --location \
      --cookie oraclelicense=a \
      http://download.oracle.com/otn-pub/java/jdk/8u25-b17/server-jre-8u25-linux-x64.tar.gz | \
      tar --extract --gunzip --strip-components 1 --directory /opt/java
