#!/usr/bin/env bash

echo "++++++++++++++++++++++++++++++++"
echo "Before Update"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get update
#sudo apt-get upgrade


echo "++++++++++++++++++++++++++++++++"
echo "Update Completed Successfully"
echo "Now install redis"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get install redis-server -y

# to enable redis to start at system boot
# sudo systemctl enable redis-server.service

# if required update the system config file
# sudo vim /etc/redis/redis.conf
# maxmemory 256mb
# maxmemory-policy allkeys-lru

sudo systemctl restart redis-server.service

# To Test the installation
# redis-cli
# 127.0.0.1:6379> ping
# PONG
# 127.0.0.1:6379> exit

echo "++++++++++++++++++++++++++++++++"
echo "Completed redis Installation "
echo "+++++++++++++++++++++++++++++++++"
