#!/usr/bin/env bash

source /vagrant/redis_vars.sh


# download, unpack and build redis
rm -rf $REDIS_BUILD_DIR
git clone  -b 3.0 https://github.com/antirez/redis.git $REDIS_BUILD_DIR

pushd $REDIS_BUILD_DIR
make
sudo make install
cp src/redis-trib.rb /usr/local/bin/redis-trib.rb
cp ./redis.conf /etc/redis.conf

popd
