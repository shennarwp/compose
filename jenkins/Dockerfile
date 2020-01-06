FROM jenkins/jenkins:latest
USER root

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
          apt-transport-https \
          ca-certificates \
          curl \
          gnupg2 \
          software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install --no-install-recommends docker-ce && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*