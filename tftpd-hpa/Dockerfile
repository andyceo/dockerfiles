FROM alpine:latest
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
RUN apk add --update tftp-hpa && mkdir /tftpboot && rm -rf /tmp/* /var/tmp/*
VOLUME /tftpboot
EXPOSE 69/udp
ENTRYPOINT ["/usr/sbin/in.tftpd"]
CMD ["--foreground", "--verbose", "--secure", "/tftpboot"]
