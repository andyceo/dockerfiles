## Run

    docker run -d andyceo/waves


## Releases

Will be the same as **Waves** [releases](https://github.com/wavesplatform/Waves/releases), without letter `v` in version string, so for specific release `v1.1.5` use:

    docker run -d andyceo/waves:1.3.6


## Volumes

- **`/app/wavesdir:rw`** - main Waves node directory that store wallet, state and blockchain data. Waves node jar file and configs are located in `/app`, so Waves directory hardcoded to `/app/wavesdir` for that image.


## Confguration

Image support following environment variables:

|Env variable                 |Description   |
|-----------------------------|--------------|
|`WAVES_WALLET_SEED`          |Plain text seed for node wallet. Container converts it to base58.   |
|`WAVES_WALLET_SEED_FILE`     |Path to file with plain text seed for node wallet. It's content is read into `WAVES_WALLET_SEED` variable.   |
|`WAVES_WALLET_PASSWORD`      |Password for wallet file.    |
|`WAVES_WALLET_PASSWORD_FILE` |Path to file with password for wallet file. It's content is read into `WAVES_WALLET_PASSWORD` variable.   |
|`WAVES_NETWORK`              |Available values are `mainnet` and `testnet`.   |
|`WAVES_LOG_LEVEL`            |Node logging level, available values: `OFF`, `ERROR`, `WARN`, `INFO`, `DEBUG`, `TRACE`. More details about logging are available [here](https://docs.wavesplatform.com/en/waves-full-node/logging.html).   |
|`WAVES_HEAP_SIZE`            |Java Heap Size limit in -X Command-line Options notation (`-Xms=[your value]`). More details [here](https://docs.oracle.com/cd/E13150_01/jrockit_jvm/jrockit/jrdocs/refman/optionX.html)   |
|`JAVA_OPTS`                  |Standard `JAVA_OPTS` variable.   |

Default environment variables values you can see in [entrypoint.sh](entrypoint.sh).

The working directory in container is `/app`, so you must place custom config to `/app/local.conf`. Example: `-v /etc/waves/local.conf:/app/local.conf:ro` to pass your `/etc/waves/local.conf` file into container.


## Misc

This image was originally started at `2016-11-12 17:46:33 +0300` in `andyceo/docker-waves` repository, on the Blockchain Hackathon in Moscow, Digital October. Then it was upgraded to actual versions at `2017-10-05 18:28:58 +0300`.
