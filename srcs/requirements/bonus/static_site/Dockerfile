FROM debian:bookworm
RUN apt update -y && apt upgrade -y
RUN apt install apache2 -y
COPY ./tools/webpage.html /tmp/webpage.html
CMD cp /tmp/webpage.html /var/www/html/index.html && apachectl -D FOREGROUND
