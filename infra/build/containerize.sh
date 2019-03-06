# build our run containers
packer build $BUILD_OPTIONS \
    -var "DOCKER_REPO=${DOCKER_REPO}" \
    -var "ARTIFACT_DIR=${ARTIFACT_DIR}" \
    -var "GIT_HASH=${GIT_HASH}" \
    -var "APPUID=$(id -u)" \
    infra/build/run.packer.json