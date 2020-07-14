![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/akito13/alpine?style=plastic)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/akito13/alpine?style=plastic)

![Docker Stars](https://img.shields.io/docker/stars/akito13/alpine?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/akito13/alpine?style=plastic)

![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/akito13/alpine?style=plastic)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/akito13/alpine?style=plastic)

[![Upstream](https://img.shields.io/badge/upstream-project-yellow?style=plastic)](https://github.com/borgbackup/borg)

![GitHub](https://img.shields.io/github/license/theAkito/docker-alpine?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

## What
My base alpine image I use for my other alpine-based images.

## Why
Promoted `bash` to shell first class.

## How
Recommended way of usage:
```bash
alias rhash='docker run --rm -it -v "$(pwd):$(pwd)" -w "$(pwd)" akito13/rhash rhash '
```
Now run the `rhash` command as you would always do:
```bash
rhash --uppercase --sha512 Dockerfile
```

## Get
Latest build:
```bash
docker pull akito13/alpine
```
Fixed version:
```bash
docker pull akito13/alpine:0.4.0
```
Tags follow semver, without the `v`.
Git tags equal Docker tags, so no need to check tags explicitly on Docker Hub.

## Build
Build yourself:
```bash
docker build -t akito-alpine:test -f Dockerfile .
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