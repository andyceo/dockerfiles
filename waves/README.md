## Image Badges

@todo
    

## Run

    docker run -d -v waves:/root andyceo/waves


## Releases

Will be the same as **Waves** releases: https://github.com/wavesplatform/Waves/releases


## Volumes

- **`/root:rw`** - folder to store wallet and blockchain data (`/root/waves/data`, `/root/waves/wallet` respectively).


## Private net

By default this image use mainnet config file. To enable testnet, just pass testnet or devnet configuration file (all this configs are in image already):

    docker run -d -v waves:/root/waves:rw andyceo/waves waves-testnet.conf


## Misc

This image was originally started at `2016-11-12 17:46:33 +0300` in andyceo/docker-waves repository, on the Blockchain Hackathon in Moscow, Digital October. Then it was upgraded to actual versions at `2017-10-05 18:28:58 +0300`.
