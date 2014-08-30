FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync --noscriptlet percona-server && \
    mkdir -p \
      /run/mysqld \
      /var/lib/mysql && \
    chown 42004 \
      /run/mysqld \
      /var/lib/mysql

ADD my.cnf /etc/mysql/my.cnf
ADD init.sql /etc/mysql/init.sql
ADD entrypoint.sh /usr/bin/mysql-entrypoint

VOLUME /var/lib/mysql
USER 42004
EXPOSE 3306
CMD ["/usr/bin/mysql-entrypoint"]
