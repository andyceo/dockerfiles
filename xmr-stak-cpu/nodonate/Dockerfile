FROM debian:stretch-slim as builder
WORKDIR /root
RUN apt-get update -qq && apt-get install -qqy git libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev && \
    git clone https://github.com/fireice-uk/xmr-stak-cpu.git && \
    sed -i 's/constexpr double fDevDonationLevel.*/constexpr double fDevDonationLevel = 0.0;/' /root/xmr-stak-cpu/donate-level.h && \
    cd xmr-stak-cpu && cmake . && make install

FROM debian:stretch-slim
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
LABEL RUN /usr/bin/docker run -d --restart=always -v ~/xmr-stak-cpu-config-clean.txt:/config.txt andyceo/xmr-stak-cpu
LABEL GET_CONFIG /usr/bin/docker run --rm andyceo/xmr-stak-cpu
RUN apt-get update -qq && apt-get install -qqy --no-install-recommends libmicrohttpd12 libssl1.1 libhwloc5 && \
    apt-get clean && apt-get autoremove && rm -r /var/lib/apt/lists/* && rm -rf /tmp/* /var/tmp/*
COPY --from=builder /root/xmr-stak-cpu/bin/xmr-stak-cpu /
COPY --from=builder /root/xmr-stak-cpu/bin/config.txt /
CMD ["/xmr-stak-cpu", "/config.txt"]
