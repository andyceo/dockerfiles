FROM debian:stable-slim
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV BITCOIN_VERSION 25.0

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -y curl gnupg && \
    set -ex && \
    curl -SLO https://raw.githubusercontent.com/bitcoin-core/guix.sigs/main/builder-keys/fanquake.gpg && \
    curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS.asc && \
    curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS && \
    curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    gpg --import fanquake.gpg && \
    gpg --verify SHA256SUMS.asc SHA256SUMS 2>&1 | grep "Good signature" && \
    grep " bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz\$" SHA256SUMS | sha256sum -c - && \
    tar -xzf *.tar.gz -C /opt && \
    mv /opt/bitcoin-${BITCOIN_VERSION} /opt/bitcoin && \
    rm /opt/bitcoin/bin/bitcoin-qt /opt/bitcoin/bin/test_bitcoin && \
    rm SHA256SUMS *.tar.gz *.asc *.gpg && \
    apt-get purge -yq curl gnupg && \
    rm -rf /root/.gnupg && \
    echo "unset HISTFILE\nset +o history" >> /root/.bash_profile && \
    apt-get autoremove -yq && \
    apt-get autoclean -yq && \
    apt-get clean && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/bitcoin/bin
VOLUME /root/.bitcoin
# API at 8332, node communication at 8333 for Mainnet
EXPOSE 8332 8333 18332 18333 18443 18444
ENTRYPOINT ["/opt/bitcoin/bin/bitcoind", "-printtoconsole"]
HEALTHCHECK --interval=7m --timeout=2m \
    CMD /opt/bitcoin/bin/bitcoin-cli getblockchaininfo || exit 1
