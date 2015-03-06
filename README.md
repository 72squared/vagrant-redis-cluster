Vagrant Redis Cluster
=====================

*Configures a redis cluster in vagrant*

The cluster is 6 redis instances running with 3 master & 3 slaves, one slave for each master.

It will allways run on the latest in the 3.0 branch of redis git repo (https://github.com/antirez/redis). To change this, change the git clone command inside `./build_redis.sh`.

When redis 3.0 will be stable and released this repo will update to use master branch.

## Setup
How to set up vagrant and start the cluster image.

1. Install [vagrant](http://www.vagrantup.com/)
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. `git clone git@github.com:Kevinlearynet/vagrant-redis-cluster.git ~/Sites/vagrant-redis-cluster` clones this repo locally
1. `cd ~/Sites/vagrant-redis-cluster` moves into the project directory 
1. `vagrant plugin install vagrant-vbguest` installs the *vbguest1. plugin for Vagrant
1. `vagrant up` provisions the virtual machine using Vagrant, this may take some time initially
1. `redis-cli -p 7000` (or any other cluster port) tests the connection to verify everything is working
