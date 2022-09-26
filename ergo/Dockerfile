FROM alpine as crawler
ENV VERSION 4.0.46
RUN apk add --no-cache --update ca-certificates curl && \
    update-ca-certificates && \
    curl -sLo /ergo.jar "https://github.com/ergoplatform/ergo/releases/download/v${VERSION}/ergo-${VERSION}.jar"

FROM openjdk:11-jre-slim
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV VERSION 4.0.46
WORKDIR /app
COPY --from=crawler /ergo.jar /app/
RUN mkdir /app/.ergo
EXPOSE 9030 9053
VOLUME ["/app/.ergo"]
ENV MAX_HEAP 4G
ENTRYPOINT java -Xmx${MAX_HEAP} -jar /app/ergo.jar $0 $1 $2 $3
CMD []
