FROM alpine
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV VERSION 2.6.2
RUN apk add --update --no-cache --purge --clean-protected openldap="$VERSION-r0" openldap-back-mdb && \
    # bugfixes for https://gitlab.alpinelinux.org/alpine/aports/-/issues/13441
    sed -i 's/back_mdb.la/back_mdb.so/g' /etc/openldap/slapd.conf && mkdir "/var/lib/openldap/run/" && \
    chown ldap:ldap "/var/lib/openldap/run/" && \
    # clean up image
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*
EXPOSE 389 636
VOLUME /var/lib/openldap/openldap-data
CMD ["slapd", "-d", "32768", "-u", "ldap", "-g", "ldap"]
