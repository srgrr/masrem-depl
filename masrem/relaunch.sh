#!/bin/bash
set -x

version=$1

function repush {
  container_name=$1
  image_name=$2
  docker stop ${container_name}
  docker rmi ${image_name} --force
  docker pull ${image_name}
}

repush "s6rgior6/masrem:frontend-${version}" "masrem-frontend"
repush "s6rgior6/masrem:backend-${backend}" "masrem-audit"

docker-compose up -d
