# OpenLDAP

This repository contain OpenLDAP server, hosted on Alpine Linux inside the container.


## Quick start

    sudo docker run -d -p 389:389 -p 636:636 -v openldap:/var/lib/openldap andyceo/openldap
