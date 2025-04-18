FROM mysql:8.0

ENV MYSQL_DATABASE=testdb \
    MYSQL_USER=user \
    MYSQL_PASSWORD=userpassword \
    MYSQL_ROOT_PASSWORD=rootpassword

COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql

HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=5 \
  CMD mysqladmin ping -h localhost -u root -prootpassword || exit 1
