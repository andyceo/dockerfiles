FROM node:4
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
ENV NETWORK livenet
COPY ./bitcore /bitcore
WORKDIR /bitcore
RUN apt-get update && apt-get install -y libzmq3-dev build-essential && \
    npm install -g bitcore && \
    mkdir /bitcore/data && \
    npm install
EXPOSE 3001 8333
VOLUME /bitcore/data
CMD /bin/cp -rf /bitcore/$NETWORK.json /bitcore/bitcore-node.json && bitcored
