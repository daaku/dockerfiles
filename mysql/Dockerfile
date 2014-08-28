FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN \
    pacman --noconfirm --sync \
      shadow \
      systemd && \
    pacman --noconfirm --sync --noscriptlet percona-server && \
    groupadd -g 89 mysql && \
    useradd -u 89 -g mysql -d /var/lib/mysql -s /bin/false mysql && \
    systemd-tmpfiles --create mysqld.conf && \
    mkdir -p /var/lib/mysql && \
    chown mysql:mysql /var/lib/mysql && \
    pacman --noconfirm --remove --recursive --unneeded \
      shadow \
      systemd && \
    echo -e "y\ny\n" | pacman --sync --clean --clean

ADD my.cnf /etc/mysql/my.cnf
ADD init.sql /etc/mysql/init.sql
ADD entrypoint.sh /usr/bin/mysql-entrypoint

VOLUME /var/lib/mysql
USER mysql
EXPOSE 3306
CMD ["/usr/bin/mysql-entrypoint"]
