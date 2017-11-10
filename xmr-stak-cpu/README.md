# Monero xmr-stak-cpu miner

This is minimized docker image for open-source xmr-stak-cpu Monero (and similar coins) miner.


## Quick start

First, get config for your cpu using built-in hardware autodetection:

    sudo docker run --rm andyceo/xmr-stak-cpu
    
Then, you should create your config, with your CPU-related config and wallet info. After that, you should start miner daemon like this:

    sudo docker run -d -v /your/config.txt:/config.txt:ro andyceo/xmr-stak-cpu
    
This will create container with running xmr-stak-cpu miner daemon inside.


## Volumes

This image use `/config.txt` file for configuration. You should provide your config with this path.


## Misc

This image was originally started at `2017-10-25 19:28:05 +0300` in andyceo/docker-xmr-stak-cpu repository.
