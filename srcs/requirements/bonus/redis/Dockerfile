FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y redis-server
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf


CMD ["redis-server", "--protected-mode", "no"]

