#!/bin/bash

PORTS="5000:5000"
CONTAINER_NAME="flex-box"
IMAGE_NAME="maric77/app-cat:latest"

#login to Docker Hub
echo "${DOCKERHUB_TOKEN}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

#Pull image in DockerHub
docker pull "${IMAGE_NAME}"
    
# check if container exists or not
if [[ $(docker ps -qqa -f name="${CONTAINER_NAME}") ]] ; then 
  docker container stop flex-box && docker container rm flex-box
fi 
docker run -d -p ${PORTS} --name ${CONTAINER_NAME} ${IMAGE_NAME}

#remove
docker container prune -f 

#image
docker image prune -f


