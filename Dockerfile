
FROM ubuntu:noble-20240530

RUN set -xe \
    && DEBIAN_FRONTEND=noninteractive TERM=dumb apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive TERM=dumb apt-get -y install --no-install-recommends --no-install-suggests \
        apt-utils \
    && DEBIAN_FRONTEND=noninteractive TERM=dumb apt-get -y install --no-install-recommends --no-install-suggests \
        adduser \
        locales \
    && rm -rf /var/lib/apt/lists/* \
    && true

ENV LANG C.UTF-8
