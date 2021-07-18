FROM node:12
COPY ./setVolumePermission.sh /code/
WORKDIR /code
USER root

ENV PATH /opt/working/node_modules/.bin:$PATH

RUN apt-get update \
&&  apt-get install -y gosu vim\
&&  apt-get clean && rm -rf /var/lib/apt/lists/*

ARG UID
ARG GID
ENV UID ${UID}
ENV GID ${GID}

COPY ./setVolumePermission.sh /usr/local/bin/setVolumePermission.sh
RUN chmod +x /usr/local/bin/setVolumePermission.sh

ENTRYPOINT ["/usr/local/bin/setVolumePermission.sh"]