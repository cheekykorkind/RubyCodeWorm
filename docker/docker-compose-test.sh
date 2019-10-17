#!/bin/bash
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

yes | docker system prune --volumes

docker rmi $(docker images -q) --force

# sudo rm -rf ./workspace/

docker-compose up -d --build
