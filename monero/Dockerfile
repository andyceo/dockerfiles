FROM alpine as crawler
ENV VERSION v0.11.0.0
ENV CHECKSUM fa7742c822f3c966aa842bf20a9920803d690d9db02033d9b397cefc7cc07ff4
WORKDIR /tmp
RUN apk add --no-cache --update ca-certificates curl && \
    update-ca-certificates && \
    curl "https://downloads.getmonero.org/cli/monero-linux-x64-$VERSION.tar.bz2" -OSs && \
    echo "$CHECKSUM  monero-linux-x64-$VERSION.tar.bz2" | sha256sum -c - && \
    tar -xjvf monero-linux-x64-$VERSION.tar.bz2 && \
    mv ./monero-$VERSION /monero

FROM debian:stretch-slim
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
LABEL RUN /usr/bin/docker run -dt --restart=always -v monero:/root -p "18080:18080" -p "18081:18081" --name=monero andyceo/monero
WORKDIR /root
COPY --from=crawler /monero /monero
VOLUME /root
EXPOSE 18080 18081
ENTRYPOINT ["/monero/monerod", "--restricted-rpc", "--rpc-bind-ip=0.0.0.0", "--confirm-external-bind"]
