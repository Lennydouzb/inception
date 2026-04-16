FROM debian:bookworm


RUN apt update -y && apt upgrade -y && apt install -y php-fpm php-mysql wget
RUN mkdir -p /var/www/html 
RUN mkdir -p /run/php
RUN wget -O /var/www/html/adminer.php https://github.com/vrana/adminer/releases/download/v5.4.1/adminer-5.4.1.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 8080
CMD ["php-fpm8.2", "-F"]
