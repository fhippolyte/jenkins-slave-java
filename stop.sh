#!/bin/bash

echo "DOCKER_NAME=[$DOCKER_NAME]"


if [ -z "$DOCKER_NAME" ] 
then
    echo "please provide DOCKER_NAME environnement variable"
else
    docker stop $DOCKER_NAME
    docker rm $DOCKER_NAME
fi


