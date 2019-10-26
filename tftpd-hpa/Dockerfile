FROM alpine:latest
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
RUN apk add --update --no-cache tftp-hpa runit && \
    mkdir /tftpboot /runit-services /runit-services/tftpd-hpa /runit-services/syslogd && \
    echo -e "#!/bin/sh\nbusybox syslogd -n -O /dev/stdout" > /runit-services/syslogd/run && \
    echo -e "#!/bin/sh\nin.tftpd --foreground --verbose --verbose --verbose --secure /tftpboot" > \
        /runit-services/tftpd-hpa/run && \
    chmod +x /runit-services/syslogd/run /runit-services/tftpd-hpa/run && \
    rm -rf /tmp/* /var/tmp/*
VOLUME /tftpboot
EXPOSE 69/udp
ENTRYPOINT ["runsvdir", "/runit-services"]
