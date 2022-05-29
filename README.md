This is a collection of my Dockerfiles for images I create for some projects I interested in and which does not have own Dockerfile.

Every Dockerfile followed by these guidelines:

- Main user is `root`
- Logs goes to `stdout`
- ..something else

Also I try to make sure each has a README.md with little correct quick start info and documentation. Feel free to provide pull requests to make Dockerfiles and READMEs better!

All of these live on dockerhub under [andyceo](https://hub.docker.com/r/andyceo/).

After Docker Hub close autobuilds for non-paid users, mostly those images are build and pushed to Docker Hub via (for example `andyceo/openldap`, `TAGNAME` may be ommited for creating `latest` tag):

    cd openldap
    sudo docker build -t andyceo/openldap:TAGNAME
    sudo docker push andyceo/openldap:TAGNAME
