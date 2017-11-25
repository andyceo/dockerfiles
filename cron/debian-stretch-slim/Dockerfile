FROM debian:stretch-slim
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
RUN apt-get update -qq && apt-get install -qqy --no-install-recommends cron && \
    apt-get clean && apt-get autoremove && rm -r /var/lib/apt/lists/* && rm -rf /tmp/* /var/tmp/*
