#!/bin/bash

# kill background process on exit or ctrl+c
trap "pkill socat" SIGINT SIGTERM EXIT

# check if docker is running
docker ps > /dev/null
if [ $? -ne 0 ]; then echo "Docker is likely not running"; exit 1; fi

# start background socket to forward X11
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
if [ $? -ne 0 ]; then echo "Could not start socat"; exit 1; fi

# only build if the image doesn't exist
docker inspect yoda-stories-docker &> /dev/null
if [ $? -ne 0 ]; then docker build -t yoda-stories-docker ./docker; fi

# use the existing container if it exists
docker inspect yoda-stories-container &> /dev/null
if [ $? -ne 0 ]; then
  docker run -e DISPLAY=$(ipconfig getifaddr en1):0 -i -t --name yoda-stories-container yoda-stories-docker
else
  docker start -i yoda-stories-container
fi

exit 0

