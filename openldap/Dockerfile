FROM alpine
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
ENV VERSION=2.6.2 \
    CONF_DIR=/etc/openldap/slapd.d \
    DATA_DIR=/var/lib/openldap/openldap-data \
    SLAPD_LDIF=/etc/openldap/slapd.ldif
RUN apk add --update --no-cache --purge --clean-protected openldap="$VERSION-r0" openldap-back-mdb openldap-clients && \
    # bugfixes for https://gitlab.alpinelinux.org/alpine/aports/-/issues/13441 \
    # and settings according https://wiki.alpinelinux.org/wiki/Configure_OpenLDAP \
    install -m 755 -o ldap -g ldap -d /var/lib/openldap/run && \
    install -m 755 -o ldap -g ldap -d ${CONF_DIR} && \
    sed -i 's/back_mdb.la/back_mdb.so/g' ${SLAPD_LDIF} && \
    rm /etc/openldap/slapd.conf && rm -rf ${DATA_DIR}/* && \
    # clean up image
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*
COPY ./entrypoint.sh /entrypoint.sh
EXPOSE 389 636
VOLUME ["/etc/openldap/slapd.d", "/var/lib/openldap/openldap-data"]
CMD ["/entrypoint.sh"]
