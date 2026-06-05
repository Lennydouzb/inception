FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y redis-server
COPY ./tools/start.sh ./
RUN chmod +x start.sh
CMD ["./start.sh"]

