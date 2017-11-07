# Monero Node

This repository contain Monero node.


## Quick start

    sudo docker run -d -p 18080:18080 -v monero:/root andyceo/monero

This will create container with running Monero daemon inside, will create named volume to store root user home directory. Also it will open port 18080 on host system for tcp protocol to allow node be visible for outer network. Also Monero node use 18081 port for RPC requests.


## Volumes

This image use `/root` (root user home directory) inside a container as the only volume. This decision was made because you would attach into working container with `docker exec -ti YOUR-CONTAINER bash -il` usually, and may be you will need your shell history or other files inside home dir.


## Misc

This image was originally started at `2017-08-30 17:49:16 +0300` in andyceo/docker-monero repository.
