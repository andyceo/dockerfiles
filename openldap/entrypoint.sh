#!/usr/bin/env sh

# Initialize database if configuration directory is empty
# ${CONF_DIR}, ${DATA_DIR} and ${SLAPD_LDIF} variables are come from Dockerfile
if [ -d "${CONF_DIR}" ]
then
  if [ "$(ls -A ${CONF_DIR})" ]; then
	  echo "OpenLDAP database initialization skipped because configuration directory ${CONF_DIR} is not empty"
	else
    LDAP_SUFFIX=${LDAP_SUFFIX:-dc=my-domain,dc=com}
    LDAP_ROOTDN=${LDAP_ROOTDN:-Manager}
    LDAP_ROOTPW=${LDAP_ROOTPW:-`cat ${LDAP_ROOTPW_FILE:-/dev/null}`}
    echo "Configuring OpenLDAP database in ${CONF_DIR}..."
    echo "Using LDAP_SUFFIX=${LDAP_SUFFIX}, LDAP_ROOTDN=${LDAP_ROOTDN}..."
    sed -i "s/dc=my-domain,dc=com/${LDAP_SUFFIX}/" ${SLAPD_LDIF}
    sed -i "s/cn=Manager,/cn=${LDAP_ROOTDN},/" ${SLAPD_LDIF}
    sed -i "s/back_mdb.la/back_mdb.so/g" ${SLAPD_LDIF}
    sed -i "s/olcRootPW: secret/olcRootPW: ${LDAP_ROOTPW:-secret}/" ${SLAPD_LDIF}
    sed -i "/^include: file:\/\/\/etc\/openldap\/schema\/core.ldif/a include: file:\/\/\/etc\/openldap\/schema\/cosine.ldif" ${SLAPD_LDIF}
    sed -i "/^include: file:\/\/\/etc\/openldap\/schema\/cosine.ldif/a include: file:\/\/\/etc\/openldap\/schema\/inetorgperson.ldif" ${SLAPD_LDIF}
    sed -i "/^include: file:\/\/\/etc\/openldap\/schema\/inetorgperson.ldif/a include: file:\/\/\/etc\/openldap\/schema\/nis.ldif" ${SLAPD_LDIF}
    rm -rf ${DATA_DIR}/*
    slapadd -n 0 -F ${CONF_DIR} -l ${SLAPD_LDIF}
    chown -R ldap:ldap ${CONF_DIR}/*
    echo "OpenLDAP database was successfully configured in ${CONF_DIR}"
	fi
else
	echo "Configuration directory ${CONF_DIR} not found, exiting..."
	exit 1
fi

# Finally start OpenLDAP
echo "entrypoint.sh finished it's job, starting OpenLDAP!"
slapd -d ${DEBUG_LEVEL:-32768} -F ${CONF_DIR} -u ldap -g ldap
