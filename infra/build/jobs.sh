# this file builds our nomad job files
cd /repo

# combine our jobs
/files/template-combiner.sh -c -s infra/nomad-jobs -p infra/nomad-jobs/ -d /tmp/combined-nomad-jobs.hcl.tmpl
# prefix our templates
cat /files/template-functions.tmpl /tmp/combined-nomad-jobs.hcl.tmpl > $COMBINED_JOB_FILE