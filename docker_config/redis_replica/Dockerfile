FROM et0803/redis_base:0.1
MAINTAINER James Turnbull <james@example.com>
ENV REFRESHED_AT 2014-06-01
ENTRYPOINT [ "redis-server", "--logfile /var/log/redis/redis-replica.log", "--slaveof redis_primary 6379" ]
