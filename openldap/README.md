OpenLDAP
========

[![Docker Pulls](https://badgen.net/docker/pulls/andyceo/openldap)](https://hub.docker.com/r/andyceo/openldap)

This repository contains OpenLDAP server, hosted on Alpine Linux inside the Docker container.


## Quick start

Run as daemon:

    sudo docker run -d -p 389:389 -p 636:636 -v openldap:/var/lib/openldap andyceo/openldap

Start interactive shell in container, than exit and remove container (useful for manual testing inside container environment):

    sudo docker run --rm -ti andyceo/openldap sh -i

Run `slapd` in the container shell with full debug:

    slapd -d -1 -u ldap -g ldap
