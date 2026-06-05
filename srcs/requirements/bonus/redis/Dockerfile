FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y redis-server
CMD ["tools/start.sh"]

