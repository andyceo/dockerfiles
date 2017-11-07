# Bitcoin Cash Node

This repository contain Bitcoin Cash Node.


## Quick start

    sudo docker run -d -p 8333:8333 -p 8333:8333/udp -v bitcoincash:/root andyceo/bitcoincash

This will create container with running Bitcoin Cash daemon inside, will create named volume to store root user home directory. Also it will open port 8333 on host system for both tcp and udp protocols.


## Volumes

This image use `/root` (root user home directory) inside a container as the only volume. This decision was made because you would attach into working container with `docker exec -ti YOUR-CONTAINER bash -il` usually, and may be you will need your shell history or other files inside home dir.


## Misc

This image was originally started at `2017-07-27 10:02:09 +0300` in andyceo/docker-bitcoin repository as separate branch `bitcoinabc`.
