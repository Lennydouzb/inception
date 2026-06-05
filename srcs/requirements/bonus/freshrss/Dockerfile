FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN wget https://github.com/FreshRSS/FreshRSS/archive/latest.zip
RUN unzip FreshRSS-latest.zip -d /tmp/
RUN mv /tmp/FreshRSS-* /tmp/FreshRSS
RUN rm FreshRSS-latest.zip

CMD cp -r /tmp/FreshRSS/* /var/www/html/ && sleep infinity