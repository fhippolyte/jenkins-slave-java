#!/bin/bash

echo "JNLP_URL=[$JNLP_URL]"
echo "DOCKER_NAME=[$DOCKER_NAME]"
echo "SLAVE_XMS=[$SLAVE_XMS]"
echo "SLAVE_XMX=[$SLAVE_XMX]"


if [ -z "$JNLP_URL" ] 
then
   echo "ERROR Please provide JNLP_URL environnement variable"
else
   if [ -z "$DOCKER_NAME" ]
   then
      echo "Please provide DOCKER_NAME environnement variable"
   else
       if [ -z "$SLAVE_XMS" ]; then export SLAVE_XMS="128m"; fi;
       if [ -z "$SLAVE_XMX" ]; then export SLAVE_XMX="512m"; fi;
       docker run -d --name $DOCKER_NAME -e SLAVE_XMS="$SLAVE_XMS" -e SLAVE_XMX="$SLAVE_XMX" -e JNLP_URL="$JNLP_URL" fhippolyte/jenkins-slave-java
   fi
fi


