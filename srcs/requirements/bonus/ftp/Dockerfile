FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install vsftpd -y

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh
EXPOSE 21
EXPOSE 20
EXPOSE 30000-30009
CMD ["/script.sh"]