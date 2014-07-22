vagrant-redis-cluster
=====================

*Configures a redis cluster in vagrant*

The cluster is 6 redis instances running with 3 master & 3 slaves, one slave for each master.

It will allways run on the latest in the 3.0 branch of redis git repo (https://github.com/antirez/redis). To change this, change the git clone command inside `./build_redis.sh`.

When redis 3.0 will be stable and released this repo will update to use master branch.

## Setup
How to set up vagrant and start the cluster image.

* Install vagrant on your system (Instructions can be found at: http://www.vagrantup.com/)
* Navigate to root of this project
* Run 'vagrant up'
* Test the connection by running either 'redis-cli -p 7000' (or any other cluster port)
