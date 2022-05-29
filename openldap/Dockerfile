FROM alpine
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
RUN apk add --update --no-cache openldap-back-mdb openldap && \
    rm -rf /tmp/* /var/tmp/*
EXPOSE 389 636
VOLUME /var/lib/openldap
CMD ["slapd", "-d", "32768", "-u", "ldap", "-g", "ldap"]
