FROM alpine as crawler
ENV WAVES_VERSION 1.1.9
RUN apk add --no-cache --update ca-certificates curl && \
    update-ca-certificates && \
    curl -sLo /waves.jar "https://github.com/wavesplatform/Waves/releases/download/v${WAVES_VERSION}/waves-all-${WAVES_VERSION}.jar" && \
    curl -sLo /waves-devnet.conf "https://raw.githubusercontent.com/wavesplatform/Waves/v${WAVES_VERSION}/node/waves-devnet.conf" && \
    curl -sLo /waves-mainnet.conf "https://raw.githubusercontent.com/wavesplatform/Waves/v${WAVES_VERSION}/node/waves-mainnet.conf" && \
    curl -sLo /waves-stagenet.conf "https://raw.githubusercontent.com/wavesplatform/Waves/v${WAVES_VERSION}/node/waves-stagenet.conf" && \
    curl -sLo /waves-testnet.conf "https://raw.githubusercontent.com/wavesplatform/Waves/v${WAVES_VERSION}/node/waves-testnet.conf"

FROM openjdk:11-jre-slim
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
WORKDIR /app
COPY --from=crawler /waves.jar /waves-devnet.conf /waves-mainnet.conf /waves-testnet.conf /app/
COPY ./entrypoint.sh /app/
RUN mkdir /app/wavesdir
EXPOSE 6869 6868 6863 6862
VOLUME ["/app/wavesdir"]
ENTRYPOINT ["/app/entrypoint.sh"]
