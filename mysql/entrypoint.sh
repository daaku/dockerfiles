#!/usr/bin/env bash

set -e

# first run
if [ -z "$(ls -A /var/lib/mysql)" ]; then
  mysql_install_db \
    --basedir=/usr \
    --defaults-file=/etc/mysql/my.cnf \
    --datadir=/var/lib/mysql
  extra='--init-file=/etc/mysql/init.sql'
fi

exec /usr/bin/mysqld \
  --defaults-file=/etc/mysql/my.cnf \
  --basedir=/usr \
  $extra
