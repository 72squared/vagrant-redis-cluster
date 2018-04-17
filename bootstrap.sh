#!/usr/bin/env bash

# need make to build redis
sudo apt-get update
sudo apt-get install -y git ruby make supervisor

sudo gem install redis
