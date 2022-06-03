OpenLDAP
========

[![Docker Pulls](https://badgen.net/docker/pulls/andyceo/openldap)](https://hub.docker.com/r/andyceo/openldap)

This repository contains OpenLDAP server, hosted on Alpine Linux inside the Docker container. This image designed to be as simple and lighweight as possible. The first start will initialize OpenLDAP via new-style [slapd-config configuration system](https://www.openldap.org/doc/admin24/slapdconf2.html) (as older style `slapd.conf` is deprecated), using provided [Environment variables](#environment-variables).

For further configuration and database filling, one should use tool like [phpLDAPadmin](http://www.phpldapadmin.org) (see [andyceo/phpldapadmin](https://hub.docker.com/r/andyceo/phpldapadmin) image) or do the work inside running container via `docker contaner exec ...` or something else.


## Environment variables

Neither of given variables are mandatory. Most of them needed for first time when configuration and data volumes will be initialized. Since configuration and data were initialized, all variables may be ommited. If they provided anyway, it takes no effect, except for `DEBUG_LEVEL`.

- `LDAP_SUFFIX`: root suffix in format: `dc=example,dc=com` for domain `example.com` (as example). It would be used for configuration database
- `LDAP_ROOTDN`: `cn` in plain text, like `LDAP_ROOTDN=Manager`, so `rootdn` will be set to `cn=Manager,dc=example,dc=com` (in conjunction with `LDAP_SUFFIX`)
- `LDAP_ROOTPW_FILE`: file containing root password (use Docker Secrets to mount such secrets into container as file), content of that file will be used to set `rootpw`. Ignored if `LDAP_ROOTPW` set
- `LDAP_ROOTPW`: plain text root password. **NOT RECOMMENDED**. Use `LDAP_ROOTPW_FILE` instead
- `DEBUG_LEVEL`: OpenLDAP debug level, default is `32768`, for verbose debug use `-1`


## Volumes

- `/etc/openldap/slapd.d`: for configuration (created dynamically if empty)
- `/var/lib/openldap`: for data (would be reinitialized if configuration is empty)


## Quick start

Run as daemon, if configuration and data are already exists:

    sudo docker run -d \
        -p 389:389 -p 636:636 \
        -v openldap-conf:/etc/openldap/slapd.d -v openldap-data:/var/lib/openldap \ 
        andyceo/openldap

Start interactive shell in the container, then exit and remove container (useful for manual testing and experimenting inside container environment and automatically clean up after job is done):

    sudo docker run --rm -ti andyceo/openldap sh -i

Run `slapd` in the container shell with full debug log (`${CONF_DIR}` available from `Dockerfile`):

    slapd -d -1 -F ${CONF_DIR} -u ldap -g ldap

For experimenting with initializing database in host directory `/data/openldap/conf` for config, `/data/openldap/data` for data, use (do not forget to replace `LDAP_SUFFIX`, `LDAP_ROOTDN` and mentioned volumes with your desired values):

    sudo rm -rf /data/openldap && sudo mkdir -p /data/openldap/{conf,data} && \
    sudo chown 100:101 /data/openldap/conf && sudo chown 100:101 /data/openldap/data && \
    sudo chmod 755 /data/openldap/conf && sudo chmod 700 /data/openldap/data && \
    sudo docker container run --rm -ti -e LDAP_SUFFIX='dc=my-domain,dc=com' -e LDAP_ROOTDN=Manager \
        -v /data/openldap/conf:/etc/openldap/slapd.d -v /data/openldap/data:/var/lib/openldap/openldap-data \
        andyceo/openldap sh -i

It will start interactive shell and nothing would be done automatically before any you actions. Do the experiments you wish, after that, you can execute `/entrypoint.sh` to see what happens when container run normally with your changes:

    /entrypoint.sh

To work with database inside `openldap` container, try following commands:

    ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts  # pay attension on 'result: 0 Success' string
    slapcat -n 0  # should print big dump of existing configuration in ldif format. '0' means confif database


To work with database remotely, execute following command on remote host:

    ldapsearch -x -b "dc=my-domain,dc=com" -H ldap://openldap  # check connection
    ldapsearch -x -b "dc=my-domain,dc=com" -H ldap://openldap -D "cn=root,dc=my-domain,dc=com" -W  # check admin credentials


## Links

- [Configure OpenLDAP](https://wiki.alpinelinux.org/wiki/Configure_OpenLDAP)
- [Official OpenLDAP Quick Start Guide](https://openldap.org/doc/admin26/quickstart.html)
