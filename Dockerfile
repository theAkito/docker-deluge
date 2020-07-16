FROM alpine:edge

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

ARG BUILD_VERSION
ARG BUILD_REVISION
ARG BUILD_DATE

# Deluge OS user
ARG USER_ID=510
ARG USER_NAME="deluge"
ARG USER_HOME="/home/${USER_NAME}"

# Config: Folders
ENV CONF_DIR="${USER_HOME}/config"
ENV PLUGIN_DIR="${CONF_DIR}/plugins"
ENV DATA_DIR="${USER_HOME}/tnt"
ENV INCOMPLETE_DIR="${DATA_DIR}/incomplete"
ENV TNTFILE_DIR="${DATA_DIR}/.torrent"
ENV AUTOADD_DIR="${TNTFILE_DIR}"

# Config: Torrent Params
ENV AUTOADD_ENABLE="true"
ENV COMPACT_ALLOCATION="true"
ENV COPY_TORRENT_FILE="true"
ENV MAX_ACTIVE_DOWNLOADING="30"
ENV MAX_ACTIVE_LIMIT="300"
ENV MAX_ACTIVE_SEEDING="100"
ENV MAX_CONNECTIONS_GLOBAL="200"
ENV MAX_CONNECTIONS_PER_SECOND="20"
ENV MAX_CONNECTIONS_PER_TORRENT="-1"
ENV MAX_DOWNLOAD_SPEED="5000.0"
ENV MAX_DOWNLOAD_SPEED_PER_TORRENT="-1"
ENV MAX_HALF_OPEN_CONNECTIONS="50"
ENV MAX_UPLOAD_SLOTS_GLOBAL="30"
ENV MAX_UPLOAD_SLOTS_PER_TORRENT="-1"
ENV MAX_UPLOAD_SPEED="-1"
ENV MAX_UPLOAD_SPEED_PER_TORRENT="-1"
ENV MOVE_COMPLETED="true"
ENV RANDOM_OUTGOING_PORTS="true"
ENV SUPER_SEEDING="true"
ENV SEND_INFO="true"

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

RUN mkdir --parents \
          ${CONF_DIR} \
          ${PLUGIN_DIR} \
          ${DATA_DIR} \
          ${INCOMPLETE_DIR} \
          ${TNTFILE_DIR} \
          ${AUTOADD_DIR}

COPY --chown=deluge:root docker/config/* ${CONF_DIR}/
COPY --chown=deluge:root docker/entrypoint.sh /

VOLUME [ "${CONF_DIR}", "${DATA_DIR}" ]
EXPOSE 58846/tcp
ENTRYPOINT [ "/entrypoint.sh" ]