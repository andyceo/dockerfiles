## Ergo Protocol Reference Client

This is dockerized version of ergo.jar releases from https://github.com/ergoplatform/ergo/releases


## Quick start

    sudo docker run -d -p 9030:9030 -p 9030:9030/udp -p 9053:9053 -v ergo:/app/.ergo andyceo/ergo --mainnet

This will create container with running Ergo daemon inside, will create named volume to store Ergo data directory. Also it will open port 9030 on host system for both tcp and udp protocols. Also we open port `9053` for node built-in swagger and web panel interfaces (`9053/swagger` and `9053/panel` respectively) 


## Volumes

This image use `/app/.ergo` inside a container as the only volume. It store blockchain, state, wallets and all other data.


## Build with you local Docker

Build:

    cd ./ergo
    sudo docker build --rm -t ergo .

Run:

    sudo docker run -d -p 9030:9030 -p 9030:9030/udp -p 9053:9053 -v /tmp/ergo:/app/.ergo ergo --mainnet
