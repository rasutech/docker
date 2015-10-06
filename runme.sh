CONTAINER_NAME="mycontainer"
IMAGE_NAME="dockerin10"
VIDEO_DEVICE="/dev/video0"
SSHD_MAP_PORT=127.0.0.1:2223
DOCKER="docker"
PARAMS="-d --name $CONTAINER_NAME -v /home/ubuntu/sandbox/tutorial:/home/tester/tutorial --device=$VIDEO_DEVICE -p $SSHD_MAP_PORT:22 --hostname=$CONTAINER_NAME"

$DOCKER run $PARAMS $IMAGE_NAME 

#Remove old host id entries in known_host file.
ssh-keygen -R [127.0.1.1]:$SSHD_MAP_PORT
#For some reason, if we try to ssh to the container right after the host id
#is removed from known_hosts, the sshd daemon closes the connection.
sleep 10

#ssh into the container and launch chrome
ssh $CONTAINER_NAME run-test
