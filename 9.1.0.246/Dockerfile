FROM alpine:3.10

ENV NR_PORT /tmp/.newrelic.sock

ARG NR_VERSION=9.1.0.246
ENV NR_FILE_NAME=newrelic-php5-$NR_VERSION-linux-musl
ENV NR_FILE_URL=https://download.newrelic.com/php_agent/archive/$NR_VERSION/$NR_FILE_NAME.tar.gz

RUN set -ex \
    && apk update \
    && apk add --no-cache --virtual .build-deps curl \
    && curl --connect-timeout 10 -o nr.tar.gz -fSL $NR_FILE_URL \
    && tar -xf nr.tar.gz \
    && cp $NR_FILE_NAME/daemon/newrelic-daemon.x64 /usr/local/bin/newrelic-daemon \
    && mkdir -p /var/log/newrelic \
    && rm -rf newrelic-php5* nr.tar.gz \
    && apk del .build-deps

CMD ["sh", "-c", "/usr/local/bin/newrelic-daemon -f --port ${NR_PORT}"]
