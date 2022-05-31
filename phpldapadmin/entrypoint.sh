#!/usr/bin/env sh

sed -i "s/setValue('server','host','127.0.0.1')/setValue('server','host','`echo ${LDAP_HOST:-127.0.0.1} | sed 's#\/#\\\/#g'`')/" /etc/phpldapadmin/config.php
sed -i "s/setValue('server','port',389/setValue('server','port',${LDAP_PORT:-389}/" /etc/phpldapadmin/config.php
sed -i "s/setValue('server','name','My LDAP Server')/setValue('server','name','${LDAP_NAME:-My LDAP Server}')/" /etc/phpldapadmin/config.php
sed -i "s/setValue('server','base',array('')/setValue('server','base',array('${LDAP_BASEDN:-}')/" /etc/phpldapadmin/config.php
sed -i "s/setValue('login','auth_type','session')/setValue('login','auth_type','${LDAP_AUTHTYPE:-session}')/" /etc/phpldapadmin/config.php
sed -i "s/setValue('login','bind_id','')/setValue('login','bind_id','${LDAP_BINDID:-}')/" /etc/phpldapadmin/config.php

php-fpm7 -D && nginx -g "daemon off;"
