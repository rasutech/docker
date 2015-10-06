#!/bin/bash
sudo apt-get install docker

sudo groupadd docker
sudo gpasswd -a ${USER} docker
