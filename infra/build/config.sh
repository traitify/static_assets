# this script will put our config templates together

cd /repo

# create our config directory
mkdir -p $CONFIG_DIR

cat /files/template-functions.tmpl infra/remote-syslog2.yml.tmpl > ${CONFIG_DIR}/remote-syslog2.yml.tmpl
cat /files/template-functions.tmpl infra/logrotate.conf.tmpl > ${CONFIG_DIR}/logrotate.conf.tmpl
cp -r infra/datadog ${CONFIG_DIR}

# generate our apache configs
cd infra
for DIR in `find ./apache -type d`; do mkdir -p ${CONFIG_DIR}/$DIR; done
for FILE in `find ./apache -name '*.tmpl'`; do 
    cat /files/template-functions.tmpl $FILE > ${CONFIG_DIR}/$FILE
done
