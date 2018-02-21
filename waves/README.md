## Image Badges

@todo
    

## Run

    docker run -d -v waves:/root andyceo/waves


## Releases

Will be the same as **Waves** releases: https://github.com/wavesplatform/Waves/releases


## Volumes

- **`/root/waves:rw`** - main Waves node directory that store wallet, peers and blockchain data. The user in container is `root`, it's home directory is `/root`, so Waves directory become `${user.home}"/waves"` (see [Waves Node Configuration File](https://github.com/wavesplatform/Waves/wiki/Waves-Node-Configuration-File))


## Confguration

The working directory in container is root filesystem `/`, so you should place custom config to `/local.conf` to read it from default configuration file (see `include "local.conf"` in `/waves-mainnet.conf` for example).


## Private net

By default this image use mainnet config file. To enable testnet, just pass testnet or devnet configuration file (all this configs are in image already):

    docker run -d -v waves:/root/waves:rw andyceo/waves waves-testnet.conf


## Misc

This image was originally started at `2016-11-12 17:46:33 +0300` in andyceo/docker-waves repository, on the Blockchain Hackathon in Moscow, Digital October. Then it was upgraded to actual versions at `2017-10-05 18:28:58 +0300`.
