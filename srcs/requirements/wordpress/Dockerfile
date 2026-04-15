FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y curl php-fpm php-mysql mariadb-client

RUN mkdir -p /run/php && chown www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
WORKDIR /var/www/html

COPY ./tools/install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/install.sh"]
