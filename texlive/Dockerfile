FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get -y install --no-install-recommends texlive-full \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& mkdir /source

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
