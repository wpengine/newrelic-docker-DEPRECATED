FROM alpine
MAINTAINER WP Engine <@wpengine.com>

ENV NR_PORT /tmp/.newrelic.sock

RUN set -ex; \
	\
    apk --no-cache add curl; \
	NR_VERSION="$( \
		curl --connect-timeout 10 -sS https://download.newrelic.com/php_agent/release/ \
			| sed -n 's/.*>\(.*linux-musl\).tar.gz<.*/\1/p' \
	)"; \
    curl --connect-timeout 10 -o nr.tar.gz -fSL "https://download.newrelic.com/php_agent/release/$NR_VERSION.tar.gz"; \
    tar -xf nr.tar.gz; \
    cp $NR_VERSION/daemon/newrelic-daemon.x64 /usr/local/bin/newrelic-daemon; \
	mkdir -p /var/log/newrelic; \
	rm -rf newrelic-php5* nr.tar.gz; 

CMD ["sh", "-c", "/usr/local/bin/newrelic-daemon -f --port ${NR_PORT}"]
