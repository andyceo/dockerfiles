FROM alpine as crawler
ENV WAVES_VERSION 1.3.6
RUN apk add --no-cache --update ca-certificates curl && \
    update-ca-certificates && \
    curl -sLo /waves.jar "https://github.com/wavesplatform/Waves/releases/download/v${WAVES_VERSION}/waves-all-${WAVES_VERSION}.jar"

FROM openjdk:11-jre-slim
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
WORKDIR /app
COPY --from=crawler /waves.jar /app/
COPY ./entrypoint.sh /app/
RUN mkdir /app/wavesdir
EXPOSE 6869 6868 6863 6862
VOLUME ["/app/wavesdir"]
ENTRYPOINT ["/app/entrypoint.sh"]
