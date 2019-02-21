#!/bin/bash -ex

# set some dirs that we use in our scripts below
export ARTIFACT_DIR="/repo/${ARTIFACT_DIR}"
export PACKAGE_DIR="${ARTIFACT_DIR}/packages"
export CONFIG_DIR="${ARTIFACT_DIR}/config_templates"
export COMBINED_JOB_FILE="${ARTIFACT_DIR}/combined-nomad-jobs.hcl.tmpl"
export ARCHIVE_DIR="/archive"

bash -ex /files/compile.sh
bash -ex /files/config.sh
bash -ex /files/jobs.sh
bash -ex /files/archive.sh
