#!/bin/bash
docker image build -t anshuldevops/jenkins-demo2:$1 -f jenkins-plugin-model/src/demo2-publish/dockerfile .

if [ -z ${DOCKER_HUB_USER+x} ]
then 
    echo 'Skipping login - credentials not set' 
else 
    sudo echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USER" --password-stdin
fi

docker push lightninglife/jenkins-demo2:$1
