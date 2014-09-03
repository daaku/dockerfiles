FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    mkdir -p /var/lib/mysql && \
    chown 42004 /var/lib/mysql && \
    pacman --noconfirm --sync --noscriptlet percona-server && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

ADD my.cnf /etc/mysql/my.cnf
ADD init.sql /etc/mysql/init.sql
ADD entrypoint.sh /usr/bin/mysql-entrypoint

VOLUME /var/lib/mysql
USER 42004
EXPOSE 3306
CMD ["/usr/bin/mysql-entrypoint"]
