# this script copies our built files to our archive.  The archive is generally only used by external processes
# and not by the build scripts 

#create archive dir
mkdir -p ${ARCHIVE_DIR}
# move to the repo dir
cd /repo

# copy some files to the archive dir as needed
cp $COMBINED_JOB_FILE ${ARCHIVE_DIR}/${APP_NAME}-nomad-jobs-${GIT_HASH}.hcl.tmpl

# these are only needed until https://github.com/hashicorp/nomad/issues/2383 is resolved
tar --transform "s,${ARTIFACT_DIR/\//}/,," --show-transformed-names -cvzf ${ARCHIVE_DIR}/${APP_NAME}-config_templates-${GIT_HASH}.tar.gz ${CONFIG_DIR}
