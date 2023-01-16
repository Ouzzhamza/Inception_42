FROM	debian:buster

RUN	apt-get update \
	&& apt-get -y install redis-server -y

 RUN sed -i "s|bind 127.0.0.1| bind 0.0.0.0|g" /etc/redis/redis.conf \
     && sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf \
     && sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf \
     && sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT redis-server --protected-mode no
