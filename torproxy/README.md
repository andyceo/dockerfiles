This is the simplest and lightweight implementation of Tor proxy in Docker container, based on Alpine Linux image.


## Run

    sudo docker run -d --restart always -p 9050:9050 andyceo/torproxy


## Test

Get your current ip:

    curl -L http://ifconfig.me

Get your ip through the tor socks proxy:

    curl --socks5 http://localhost:9050 -L http://ifconfig.me


## Links

This image inspired by this article: [Setup Tor in a Docker Container](https://sachsenhofer.io/setup-tor-docker-container/)
