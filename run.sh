BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

docker run \
  --name jenkins \
  -d \
  --restart=unless-stopped \
  -p 8080:8080 \
  -p 50000:50000 \
  -u root \
  -v /opt/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${BASEDIR}/config:/var/jenkins_home/casc_configs \
  -e CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs \
  -e JENKINS_URL=http://${HOSTNAME}:8080/ \
  labasc/javaci-jenkins