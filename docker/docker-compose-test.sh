#!/bin/bash
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

yes | docker system prune --volumes

docker rmi $(docker images -q) --force

docker-compose up -d --build
