# Docker Bitcore

This is a docker image of Bitcore. Inspired by this repository: https://github.com/WooGenius/bitcore-docker

## Quick start

    sudo docker run -d -p 3001:3001 -p 8333:8333 -v bitcore:/bitcore/data andyceo/bitcore

## Volumes

This image use `/root` (root user home directory) inside a container as the only volume. This decision was made because you would attach into working container with `docker exec -ti YOUR-CONTAINER bash -il` usually, and may be you will need your shell history or other files inside home dir.

## Misc

This image was originally started at `2017-10-12 15:41:06 +0300` in andyceo/docker-bitcore repository. Docker Hub downloads at 2017-11-08 01:12:00 +0300 was 160.
