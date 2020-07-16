#!/bin/sh
#########################################################################
# Copyright (C) 2020 Akito <the@akito.ooo>                              #
#                                                                       #
# This program is free software: you can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation, either version 3 of the License, or     #
# (at your option) any later version.                                   #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          #
# GNU General Public License for more details.                          #
#                                                                       #
# You should have received a copy of the GNU General Public License     #
# along with this program.  If not, see <http://www.gnu.org/licenses/>. #
#########################################################################

set -e

if [ ! -f ${CONF_DIR}/fixed_conf ]; then
  sed -i \
      -e "s|PLUGIN_DIR|${PLUGIN_DI}|" \
      -e "s|DATA_DIR|${DATA_DIR}|" \
      -e "s|INCOMPLETE_DIR|${INCOMPLETE_DIR}|" \
      -e "s|TNTFILE_DIR|${TNTFILE_DIR}|" \
      -e "s|AUTOADD_DIR|${AUTOADD_DIR}|" \
      -e "s|AUTOADD_ENABLE|${AUTOADD_ENABLE}|" \
      -e "s|COMPACT_ALLOCATION|${COMPACT_ALLOCATION}|" \
      -e "s|COPY_TORRENT_FILE|${COPY_TORRENT_FILE}|" \
      -e "s|MAX_ACTIVE_DOWNLOADING|${MAX_ACTIVE_DOWNLOADING}|" \
      -e "s|MAX_ACTIVE_LIMIT|${MAX_ACTIVE_LIMIT}|" \
      -e "s|MAX_ACTIVE_SEEDING|${MAX_ACTIVE_SEEDING}|" \
      -e "s|MAX_CONNECTIONS_GLOBAL|${MAX_CONNECTIONS_GLOBAL}|" \
      -e "s|MAX_CONNECTIONS_PER_SECOND|${MAX_CONNECTIONS_PER_SECOND}|" \
      -e "s|MAX_CONNECTIONS_PER_TORRENT|${MAX_CONNECTIONS_PER_TORRENT}|" \
      -e "s|\bMAX_DOWNLOAD_SPEED\b|${MAX_DOWNLOAD_SPEED}|" \
      -e "s|MAX_DOWNLOAD_SPEED_PER_TORRENT|${MAX_DOWNLOAD_SPEED_PER_TORRENT}|" \
      -e "s|MAX_HALF_OPEN_CONNECTIONS|${MAX_HALF_OPEN_CONNECTIONS}|" \
      -e "s|MAX_UPLOAD_SLOTS_GLOBAL|${MAX_UPLOAD_SLOTS_GLOBAL}|" \
      -e "s|MAX_UPLOAD_SLOTS_PER_TORRENT|${MAX_UPLOAD_SLOTS_PER_TORRENT}|" \
      -e "s|\bMAX_UPLOAD_SPEED\b|${MAX_UPLOAD_SPEED}|" \
      -e "s|MAX_UPLOAD_SPEED_PER_TORRENT|${MAX_UPLOAD_SPEED_PER_TORRENT}|" \
      -e "s|MOVE_COMPLETED|${MOVE_COMPLETED}|" \
      -e "s|RANDOM_OUTGOING_PORTS|${RANDOM_OUTGOING_PORTS}|" \
      -e "s|SUPER_SEEDING|${SUPER_SEEDING}|" \
      -e "s|SEND_INFO|${SEND_INFO}|" \
      ${CONF_DIR}/core.conf && \
  touch ${CONF_DIR}/fixed_conf
fi

exec deluged \
  --do-not-daemonize \
  --config ${CONF_DIR} \
  --port 58846 \
  --loglevel info