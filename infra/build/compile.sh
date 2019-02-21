# move to the repo dir
cd /repo

# make sure our artifact dir exists
mkdir -p ${ARTIFACT_DIR}

# generate our assets
tar -zcf ${ARTIFACT_DIR}/${APP_NAME}.tar.gz -C deploy .