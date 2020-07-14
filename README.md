![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/akito13/deluge?style=plastic)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/akito13/deluge?style=plastic)

![Docker Stars](https://img.shields.io/docker/stars/akito13/deluge?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/akito13/deluge?style=plastic)

![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/akito13/deluge?style=plastic)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/akito13/deluge?style=plastic)

[![Upstream](https://img.shields.io/badge/upstream-project-yellow?style=plastic)](https://github.com/borgbackup/borg)

![GitHub](https://img.shields.io/github/license/theAkito/docker-deluge?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

## What
Deluge 2.x daemon in a Docker image. Easy to use and ready to go.

## Why
To provide an easy to set up Deluge daemon in Docker, without any hassle. It is pretty much ready to go. The only thing you need to set up are the volume locations on your host, if you care to put them in a special location. Otherwise, just run the image, as specified below.

## How
1. Adjust the volume locations in the  `docker-compose.yaml` file.
2. Run the daemon:
```bash
docker-compose up -d
```

## Get
Latest build:
```bash
docker pull akito13/deluge
```
Fixed version:
```bash
docker pull akito13/deluge:0.1.0
```
Tags follow semver, without the `v`.
Git tags equal Docker tags, so no need to check tags explicitly on Docker Hub.

## Build
Build yourself:
```bash
docker build -t akito-deluge:test -f Dockerfile .
```

## License
Copyright (C) 2020  Akito <the@akito.ooo>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.