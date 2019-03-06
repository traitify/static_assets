#!/bin/bash

# exit on error
set -e

function printUsage() {
  echo "Build run containers for this app"
  echo "Usage: "
  echo " $0 -r -p"
  echo "  -p  push containers to remote"
  echo "  -r  remove the local containers after we push to remote"
  echo ""
}

# pull in our options
while getopts ":rp" OPT; do
  case $OPT in
  p)
    PUSH="true"
    ;;
  r)
    REMOVE="true"
    ;;
  *)
    echo "Invalid option: $OPTARG"
    printUsage
    exit 1
    ;;
  esac
done

# build our run containers
packer build $BUILD_OPTIONS \
    -var "DOCKER_REPO=${DOCKER_REPO}" \
    -var "ARTIFACT_DIR=${ARTIFACT_DIR}" \
    -var "GIT_HASH=${GIT_HASH}" \
    -var "APPUID=$(id -u)" \
    infra/build/run.packer.json

# push to remote locations if requested
if [ -n "$PUSH" ]; then
   # first get a login
   $(aws ecr get-login --no-include-email --region us-east-1)
   docker push ${DOCKER_REPO}${APP_NAME}:${GIT_HASH}
fi
# remove local if requested
if [ -n "$REMOVE" ]; then
   docker rmi -f ${DOCKER_REPO}${APP_NAME}:latest
   docker rmi -f ${DOCKER_REPO}${APP_NAME}:${GIT_HASH}
fi

