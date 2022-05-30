FROM alpine:3.15
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
# phpLDAPadmin 1.2.6.3 available only on Alpine 3.16 and above, but there is no php7-fpm version
# phpLDAPadmin not work on php8-fpm: fatal error: uncaught error: call to undefined function get_magic_quotes_gpc()
ENV VERSION 1.2.6.2
RUN apk add --update --no-cache --purge --clean-protected phpldapadmin="$VERSION-r0" php7-fpm nginx && \
    cp /etc/phpldapadmin/config.php.example /etc/phpldapadmin/config.php && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*
COPY ./config/nginx/phpldapadmin.conf /etc/nginx/http.d/default.conf
COPY ./entrypoint.sh /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD []
