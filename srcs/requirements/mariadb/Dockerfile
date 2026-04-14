FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client gettext-base

#EXPOSE PORT 3306 LIKE SUBJECT ASK AND COPY MARIADB CONFIG
EXPOSE 3306
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ENTRYPOINT AND ADD EXECUTION PERMISSIONS
COPY ./tools/start.sh ./
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
