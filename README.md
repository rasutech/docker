# Docker

This Project aims to demonstrate the ability of Docker to Initiate Web Based Automation Tests. Docker requires 64Bit Linux to run and this presumes that the Developer has this Installed.

Dockerfile appended in this Project downloads Ubuntu Image from Dockerhub and builds on top of that to install Firefox, Selenium and Xvfb(Virtual X Window Server) to name a few. It also hsa RSA Key pairs for establishing trust between the Host and the Docker Container.

Once, downloaded run installdocker.sh file from shell prompt in Linux to install docker.

buildme.sh file will take care of constructing a docker image, while runme.sh will run the container, trigger test and print a successful execution to the container
