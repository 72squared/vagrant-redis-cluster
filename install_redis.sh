#!/usr/bin/env bash

source /vagrant/redis_vars.sh


rm -rf $REDIS_SUPERVISOR_CONF
supervisorctl update

rm -rf $REDIS_DIR

mkdir -p $REDIS_DIR

for port in $REDIS_PORTS
do
    mkdir -p $REDIS_DIR/$port
done




for port in $REDIS_PORTS
do
echo "======================================"
echo "INSTALLING REDIS SERVER: $port        "
echo "======================================"

supervisor_conf=$(cat <<EOF
[program:redis-$port]
command = /usr/local/bin/redis-server /etc/redis.conf --port $port --dir $REDIS_DIR/$port --cluster-enabled yes
autostart = true
autorestart = true
stdout_logfile = syslog
stderr_logfile = syslog

EOF
)

echo "$supervisor_conf" >> $REDIS_SUPERVISOR_CONF

rm -rf "$REDIS_DIR/$port/nodes.conf"

done

supervisorctl update

sleep 2

echo "======================================"
echo "INITIALIZING REDIS CLUSTER            "
echo "======================================"


redis_host_list=""

for port in $REDIS_PORTS
do
    redis_host_list="$redis_host_list 127.0.0.1:$port "
done

yes "yes" | /usr/local/bin/redis-trib.rb create --replicas 1 $redis_host_list