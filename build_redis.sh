#!/usr/bin/env bash

source /vagrant/redis_vars.sh

pushd /home/vagrant


# download, unpack and build redis
rm -rf $REDIS_BUILD_DIR
git clone https://github.com/antirez/redis.git $REDIS_BUILD_DIR

cd $REDIS_BUILD_DIR
make
sudo make install
cp src/redis-trib.rb /usr/local/bin/redis-trib.rb
cp ./redis.conf /etc/redis.conf


popd
