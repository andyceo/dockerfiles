OpenLDAP
========

[![Docker Pulls](https://badgen.net/docker/pulls/andyceo/openldap)](https://hub.docker.com/r/andyceo/openldap)

This repository contains OpenLDAP server, hosted on Alpine Linux inside the Docker container. This image designed to be as simple and lighweight as possible. For further configuration, one should use tool like [phpLDAPadmin](http://www.phpldapadmin.org) (see [andyceo/phpldapadmin](https://hub.docker.com/r/andyceo/phpldapadmin) image) or do the work inside running container via `docker contaner exec ...` or something else.


## Environment variables

Neither of given variables are mandatory. Most of them needed for first time when configuration and data would be initialized. Since configuration and data are initialized, all variables may be ommited. If they provided anyway, it take no effect, except for `DEBUG_LEVEL`.

- `LDAP_SUFFIX`: root suffix in format: `dc=example,dc=com` for domain `example.com` (as example). It would be used both for configuration and organization databases
- `LDAP_ROOTDN`: `cn` in plain text, like `LDAP_ROOTDN=Manager`, so `rootdn` will be set to `cn=Manager,dc=example,dc=com` (in conjunction with `LDAP_SUFFIX`)
- `LDAP_ROOTPW_FILE`: file containing root password (use Docker Secrets to mount such secrets into container as file), content of that file would be used to set `rootpw`. Ignored if `LDAP_ROOTPW` set
- `LDAP_ROOTPW`: plain text root password. **NOT RECOMMENDED**. Use `LDAP_ROOTPW_FILE` instead
- `DEBUG_LEVEL`: OpenLDAP debug level, default is `32768`, for debug use `-1`


## Volumes

- `/etc/openldap/slapd.d`: for configuration (created dynamically)
- `/var/lib/openldap`: for data


## Quick start

Run as daemon, if configuration and data are already exists:

    sudo docker run -d \
        -p 389:389 -p 636:636 \
        -v openldap-conf:/etc/openldap/slapd.d -v openldap-data:/var/lib/openldap \ 
        andyceo/openldap

Start interactive shell in container, than exit and remove container (useful for manual testing and experimenting inside container environment):

    sudo docker run --rm -ti andyceo/openldap sh -i

Run `slapd` in the container shell with full debug (`${CONF_DIR}` available from `Dockerfile`):

    slapd -d -1 -F ${CONF_DIR} -u ldap -g ldap

For experimenting with initializing database in host directory `/data/openldap/conf` for config, `/data/openldap/data` for data, use (do not forget to replace `LDAP_SUFFIX`, `LDAP_ROOTDN` and mentioned directories with your desired values):

    sudo rm -rf /data/openldap && sudo mkdir -p /data/openldap/{conf,data} && \
    sudo chown 100:101 /data/openldap/conf && sudo chown 100:101 /data/openldap/data && \
    sudo chmod 755 /data/openldap/conf && sudo chmod 700 /data/openldap/data && \
    sudo docker container run --rm -ti -e LDAP_SUFFIX='dc=my-domain,dc=com' -e LDAP_ROOTDN=Manager \
        -v /data/openldap/conf:/etc/openldap/slapd.d -v /data/openldap/data:/var/lib/openldap/openldap-data \
        andyceo/openldap sh -i

After that, you can execute `/entrypoint.sh` to see what happens when container run:

    /entrypoint.sh

To work with database inside `openldap` container, try following commands:

    ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts  # pay attension on 'result: 0 Success' string
    slapcat -n 0  # should print big dump of existing configuration in ldif format. '0' means confif database


To work with database remotely, try execute following command on remote host:

    ldapsearch -x -b "dc=my-domain,dc=com" -H ldap://openldap  # check connection
    ldapsearch -x -b "dc=my-domain,dc=com" -H ldap://openldap -D "cn=root,dc=my-domain,dc=com" -W  # check admin credentials


## Links

- [Configure OpenLDAP](https://wiki.alpinelinux.org/wiki/Configure_OpenLDAP)
- [Official OpenLDAP Quick Start Guide](https://openldap.org/doc/admin26/quickstart.html)
