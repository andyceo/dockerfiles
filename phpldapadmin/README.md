phpLDAPadmin
============

[![Docker Pulls](https://badgen.net/docker/pulls/andyceo/phpldapadmin)](https://hub.docker.com/r/andyceo/phpldapadmin)

This repository contains phpLDAPadmin web application, hosted on Alpine Linux inside the Docker container.


## Quick start

Run as daemon:

    sudo docker run -d -p 8080:80 andyceo/phpldapadmin

Start interactive shell in container, than exit and remove container (useful for manual testing inside container environment):

    sudo docker run --rm -ti andyceo/phpldapadmin sh -i

Run `slapd` in the container shell with full debug:

    php-fpm7 -D && nginx -g "daemon off;"
