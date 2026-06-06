FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt-get install crowdsec -y
RUN mkdir -p /etc/crowdsec/
RUN cscli collections install crowdsecurity/nginx
RUN cscli collections install crowdsecurity/wordpress

COPY ./tools/scenario.yaml /etc/crowdsec/scenarios/
COPY ./tools/profiles.yaml /etc/crowdsec/profiles/
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh
RUN  /script.sh
EXPOSE 8080
CMD ["crowdsec"]