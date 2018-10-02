FROM alpine:latest
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
RUN apk add --update tftp-hpa && mkdir /tftpboot && rm -rf /tmp/* /var/tmp/*
VOLUME /tftpboot
EXPOSE 69/udp
ENTRYPOINT ["sh", "-c", "busybox syslogd -n -O /dev/stdout && in.tftpd"]
CMD ["--foreground", "--verbose", "--verbose", "--verbose", "--secure", "/tftpboot"]
