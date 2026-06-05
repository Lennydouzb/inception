echo "maxmemory 256mb" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
echo "requirepass" $REDIS_PASSWORD >> /etc/redis/redis.conf

redis-server /etc/redis/redis.conf --protected-mode no