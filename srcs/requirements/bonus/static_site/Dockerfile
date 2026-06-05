FROM debian:bookworm
RUN apt update -y && apt upgrade -y

COPY ./tools/webpage.html /tmp/webpage.html
CMD cp /tmp/webpage.html /var/www/html/webpage.html && sleep infinity