#!/bin/bash
sudo apt-get install docker-engine

sudo groupadd docker
sudo gpasswd -a ${USER} docker
