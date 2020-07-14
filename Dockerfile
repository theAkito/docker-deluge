FROM alpine:edge

ARG BUILD_VERSION
ARG BUILD_REVISION
ARG BUILD_DATE
ARG USER_ID=510
ARG USER_NAME="deluge"
ARG USER_HOME="/home/deluge"
ARG CONF_DIR="${USER_HOME}/config"
ARG DATA_DIR="${USER_HOME}/tnt"
ARG INCOMPLETE_DIR="${DATA_DIR}/incomplete"
ARG AUTOADD_DIR="${DATA_DIR}/.torrent"

LABEL maintainer="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.authors="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.vendor="Akito"
LABEL org.opencontainers.image.version="${BUILD_VERSION}"
LABEL org.opencontainers.image.revision="${BUILD_REVISION}"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.title="Deluge Daemon"
LABEL org.opencontainers.image.description="Deluge daemon in a Docker image. Easy to use and ready to go."
LABEL org.opencontainers.image.source="https://github.com/theAkito/docker-deluge"
LABEL org.opencontainers.image.licenses="GPL-3.0+"

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update \
    deluge@testing
RUN rm -fr /tmp/* /var/tmp/* /var/cache/*/*

RUN adduser --gecos ${USER_NAME} \
            --system \
            --disabled-password \
            --uid ${USER_ID} \
            --shell /bin/ash \
            --home ${USER_HOME} \
            ${USER_NAME}

WORKDIR ${USER_HOME}
USER deluge

RUN mkdir ${CONF_DIR} \
          ${DATA_DIR} \
          ${INCOMPLETE_DIR} \
          ${AUTOADD_DIR}

COPY --chown=deluge:root config/* ${CONF_DIR}/

EXPOSE 58846/tcp
ENTRYPOINT [ "deluged" ]
CMD [ "--do-not-daemonize", "--config", "/home/deluge/config", "--loglevel", "info" ]
