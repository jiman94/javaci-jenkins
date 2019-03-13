FROM jenkins/jenkins:lts

USER root
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

USER jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/install-plugins.sh < /plugins.txt
