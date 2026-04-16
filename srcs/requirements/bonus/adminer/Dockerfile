FROM debian:bookworm


RUN apt update -y && apt upgrade -y && apt install -y php-fpm php-mysql wget
RUN mkdir -p /var/www/html
RUN wget -O /var/www/html/adminer.php https://www.adminer.org/latest.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 8080
RUN chown -R www-data:www-data /var/www/html
CMD ["php-fpm8.2", "-F"]
