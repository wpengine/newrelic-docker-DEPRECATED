# New Relic Docker Image

Runs the New Relic Daemon.  This container is intended to be run as a side car to proxy data into New Relic.

# Updates & Prebuilt Images

These images are configured as Automated builds on [Docker Hub](https://hub.docker.com/r/wpengine/newrelic-daemon/).  

# Running

The following command runs the New Relic daemon and exposes the service on port 8004.  NR_PORT can also contain a socket name that could be shared between containers.

    docker run -d \
        -e NR_PORT=8004 \
        -p 8004:8004 \
        wpengine/newrelic-daemon

# Building

    docker build -t wpengine/newrelic-daemon .
