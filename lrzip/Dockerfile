FROM alpine as builder
RUN apk add --update git autoconf automake libtool gcc musl-dev zlib-dev bzip2-dev lzo-dev coreutils make g++ && \
    git clone https://github.com/ckolivas/lrzip.git && \
    cd /lrzip && ./autogen.sh && ./configure && make -j `nproc` && make install

FROM alpine
LABEL maintainer="Andrey Andreev <andyceo@yandex.ru> (@andyceo)"
RUN apk add --update --no-cache lzo libbz2 libstdc++ && \
    rm -rf /tmp/* /var/tmp/*
COPY --from=builder /usr/local/bin/lrzip /usr/local/bin/lrzip
CMD ["/usr/local/bin/lrzip"]
