#!/bin/bash

# Install redisinsight an gui for redis databases.

if [ -d "/opt/redisinsight" ]; then
    echo "RedisInsight is already installed."
    exit 1
fi

wget -O /tmp/redisinsight.tar.gz https://download.redisinsight.redis.com/latest/redisstack/RedisInsight-app-linux.x86_64.tar.gz
if [ ! -f "/tmp/redisinsight.tar.gz" ]; then
    echo "Error while downloading RedisInsight."
    exit 1
fi

sudo mkdir -p /opt/redisinsight
sudo tar -xzf /tmp/redisinsight.tar.gz -C /opt/redisinsight --strip-components=1
rm /tmp/redisinsight.tar.gz

if [ ! -L "/usr/local/bin/redisinsight" ]; then
    sudo ln -s /opt/redisinsight/redisinsight /usr/local/bin/redisinsight
fi

echo "RedisInsight installation completed."