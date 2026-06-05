FROM debian:bookworm
RUN apt update -y && apt upgrade -y

COPY ./tools/webpage.html /var/www/html/static_site/webpage.html
CMD ["sleep", "infinity"]