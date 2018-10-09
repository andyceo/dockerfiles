FROM ubuntu:18.04
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV VERSION 0.16.3
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y --no-install-recommends bitcoind && \
    apt-get purge -y software-properties-common && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean
VOLUME /root/.bitcoin
ENTRYPOINT ["/usr/bin/bitcoind", "-printtoconsole"]
HEALTHCHECK --interval=5m --timeout=1m \
    CMD bitcoin-cli getblockchaininfo || exit 1
