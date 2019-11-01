FROM debian:stable-slim
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV BITCOIN_VERSION 0.18.1

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -y curl gnupg && \
    set -ex && \
    for key in 01EA5486DE18A882D4C2684590C8019E36C2E964; do \
      gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" || \
      gpg --batch --keyserver pgp.mit.edu --recv-keys "$key" || \
      gpg --batch --keyserver keyserver.pgp.com --recv-keys "$key" || \
      gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
      gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ; \
    done && \
    gpg --keyserver hkp://keyserver.ubuntu.com --refresh-keys && \
    curl -SLO https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS.asc && \
    curl -SLO https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    gpg --verify SHA256SUMS.asc && \
    grep " bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz\$" SHA256SUMS.asc | sha256sum -c - && \
    tar -xzf *.tar.gz -C /opt && \
    mv /opt/bitcoin-${BITCOIN_VERSION} /opt/bitcoin && \
    rm *.tar.gz *.asc && \
    apt-get purge -yq curl gnupg && \
    rm -rf /root/.gnupg && \
    apt-get autoremove -yq && \
    apt-get autoclean -yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /root/.bitcoin
# API at 8332, node communication at 8333 for Mainnet
EXPOSE 8332 8333 18332 18333 18443 18444
ENTRYPOINT ["/opt/bitcoin/bin/bitcoind", "-printtoconsole"]
HEALTHCHECK --interval=5m --timeout=1m \
    CMD /opt/bitcoin/bin/bitcoin-cli getblockchaininfo || exit 1
