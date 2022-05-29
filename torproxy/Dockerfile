FROM alpine
RUN apk update && apk add tor && \
    echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc.default && \
    rm -rf /tmp/* /var/tmp/* /var/cache/*
EXPOSE 9050
USER tor
ENTRYPOINT ["tor"]
CMD ["-f", "/etc/tor/torrc.default"]
