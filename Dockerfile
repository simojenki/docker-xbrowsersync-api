FROM ubuntu:18.04

MAINTAINER simojenki

ARG OVERLAY_VERSION="v1.22.1.0"
ARG NODE_VERSION="v10.16.3"
ARG XBROWSERSYNC_API_VERSION="1.1.9"

RUN apt-get update && apt-get install -y \
    xz-utils

RUN mkdir -p /node /xbs-api

ADD https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz /tmp
RUN tar xf /tmp/node-$NODE_VERSION-linux-x64.tar.xz -C /node --strip-components=1

ADD https://github.com/xBrowserSync/api/archive/v$XBROWSERSYNC_API_VERSION.tar.gz /tmp
RUN tar xf /tmp/v$XBROWSERSYNC_API_VERSION.tar.gz -C /xbs-api --strip-components=1

ADD https://github.com/just-containers/s6-overlay/releases/download/$OVERLAY_VERSION/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

ADD src/etc /etc
ADD src/settings.json /xbs-api/config

RUN rm /tmp/*

ENV PATH="/node/bin:${PATH}"
ENV XBROWSERSYNC_DB_HOST="localhost"
ENV XBROWSERSYNC_DB_PORT="27017"
ENV XBROWSERSYNC_DB_USER="xbrowsersyncdb"
ENV XBROWSERSYNC_DB_PWD="setme"

WORKDIR /xbs-api

RUN npm install --only=production

EXPOSE 8080

ENTRYPOINT ["/init"]