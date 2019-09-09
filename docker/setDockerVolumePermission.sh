#!/bin/sh

# echo color
RED='\033[1;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

UID=$(id -u $USER)
GID=$(id -g $USER)
UNAME=$(echo "$USER")
CONTAINER_NAME="ruby_code_worm"
CONTAINER_VOLUME_PATH="/docker/workspace"

echo "${GREEN}Host machine UID : ${UID}${NC}"
echo "${GREEN}Host machine GID : ${GID}${NC}"
echo "${GREEN}Host machine user name : ${UNAME}${NC}"
echo "${GREEN}Host machine docker container name : ${CONTAINER_NAME}${NC}"

docker exec ${CONTAINER_NAME} groupadd -g ${GID} ${UNAME}
echo "${GREEN}container groupadd has been done${NC}"

docker exec ${CONTAINER_NAME} useradd -u ${UID} -g ${UNAME} -m ${UNAME}
echo "${GREEN}container useradd has been done${NC}"

docker exec ${CONTAINER_NAME} chown -R ${UNAME}:${UNAME} ${CONTAINER_VOLUME_PATH}
echo "${GREEN}container chown -R has been done${NC}"