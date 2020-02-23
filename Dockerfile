ARG CODE_VERSION=stable-slim

FROM debian:${CODE_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /bin/sh \
    && ln -s /bin/bash /bin/sh \
    && apt-get update \
    && apt-get install -q -y \
    curl \
    zip \
    unzip \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl -s https://get.sdkman.io | bash

RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh" \
    && source "$HOME/.sdkman/bin/sdkman-init.sh"
