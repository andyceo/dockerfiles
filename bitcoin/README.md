# Bitcoin Core Node

This repository contain Bitcoin Core Node.


## Quick start

    sudo docker run -d -p 8333:8333 -p 8333:8333/udp -v bitcoin:/root/.bitcoin andyceo/bitcoin

This will create container with running Bitcoin Core daemon inside, will create named volume to store root user home directory. Also it will open port 8333 on host system for both tcp and udp protocols.


## Volumes

This image use `/root/.bitcoin` inside a container as the only volume. It store blockchain, state, wallets and all other data.


## Misc

This image was originally started at `2017-07-27 10:02:09 +0300` in andyceo/docker-bitcoin repository.
